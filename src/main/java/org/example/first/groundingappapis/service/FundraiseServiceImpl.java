package org.example.first.groundingappapis.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.example.first.groundingappapis.dto.FundraiseDto;
import org.example.first.groundingappapis.entity.*;
import org.example.first.groundingappapis.exception.*;
import org.example.first.groundingappapis.repository.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.UUID;

@Service
@Slf4j
@RequiredArgsConstructor
public class FundraiseServiceImpl implements FundraiseService{
    private final PropertyRepository propertyRepository;
    private final OrderRepository orderRepository;
    private final RealTimeTransactionLogRepository realTimeTransactionLogRepository;
    private final InventoryRepository inventoryRepository;
    private final UserRepository userRepository;
    private final FundraiseRepository fundraiseRepository;
    private void validateFundraiseOrder(Fundraise fundraise, Account buyerAccount, User buyer, Property property, int totalSubscriptionPrice) {
        if (fundraise == null) {
            throw new PropertyException(PropertyErrorResult.FUNDRAISE_NOT_FOUND);
        }
        if(realTimeTransactionLogRepository.existsByPropertyAndUser(property, buyer)){
            throw new TradingException(TradingErrorResult.ALREADY_SUBSCRIBED);
        }
        if(buyerAccount.getDeposit() < totalSubscriptionPrice){
            throw new TradingException(TradingErrorResult.NOT_ENOUGH_DEPOSIT);
        }
        if (fundraise.getSubscriptionEndDate().isBefore(LocalDate.now())) {
            throw new TradingException(TradingErrorResult.FUNDRAISE_ENDED);
        }
        if (fundraise.getTotalFund() < fundraise.getProgressAmount() + totalSubscriptionPrice) {
            throw new TradingException(TradingErrorResult.EXCEED_FUNDRAISE_TOTAL_AMOUNT);
        }

    }

    @Transactional
    @Override
    public FundraiseDto.FundraiseResponse fundraiseProperty(String propertyId, FundraiseDto.FundraiseRequest fundraiseRequest, UUID userId) {
        final User buyer = userRepository.findById(userId)
                .orElseThrow(() -> new UserException(UserErrorResult.USER_NOT_FOUND));

        final Account buyerAccount = buyer.getAccount();
        log.info("fundraiseProperty called with propertyId: {} and account: {}", propertyId, buyerAccount.getId());

        final Property property = propertyRepository.findById(UUID.fromString(propertyId))
                .orElseThrow(() -> new PropertyException(PropertyErrorResult.PROPERTY_NOT_FOUND));

        final Fundraise fundraise = property.getFundraise();

        int totalSubscriptionPrice = fundraise.getIssuePrice() * fundraiseRequest.getQuantity();

        validateFundraiseOrder(fundraise, buyerAccount, buyer, property, totalSubscriptionPrice);

        Order newOrder = Order.builder()
                .type("매수")
                .quantity(fundraiseRequest.getQuantity())
                .price(fundraise.getIssuePrice())
                .status("체결 완료")
                .build();
        newOrder.updateUser(buyer);
        newOrder.updateProperty(property);

        orderRepository.save(newOrder);

        RealTimeTransactionLog realTimeTransactionLog = RealTimeTransactionLog.builder()
                .executedPrice(fundraise.getIssuePrice())
                .quantity(fundraiseRequest.getQuantity())
                .executedAt(LocalDateTime.now())
                .fluctuationRate(0.0)
                .build();

        realTimeTransactionLog.updateProperty(property);
        realTimeTransactionLog.updateUser(buyer);

        realTimeTransactionLogRepository.save(realTimeTransactionLog);

        buyerAccount.minusDeposit(Long.valueOf(totalSubscriptionPrice));

        Inventory inventory = Inventory.builder()
                .quantity(fundraiseRequest.getQuantity())
                .averageBuyingPrice(fundraise.getIssuePrice())
                .build();

        inventory.updateProperty(property);
        inventory.updateAccount(buyerAccount);

        inventoryRepository.save(inventory);

        int currentProgressAmount = fundraise.getProgressAmount();
        fundraise.setProgress(currentProgressAmount + totalSubscriptionPrice);

        fundraiseRepository.save(fundraise);

        return FundraiseDto.FundraiseResponse.builder()
                .userId(buyer.getId().toString())
                .propertyId(propertyId)
                .quantity(fundraiseRequest.getQuantity())
                .price(fundraise.getIssuePrice())
                .createdAt(LocalDateTime.now())
                .build();
    }
}