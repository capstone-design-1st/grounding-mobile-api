package org.example.first.groundingappapis.service;

import org.example.first.groundingappapis.dto.OrderDto;
import org.example.first.groundingappapis.dto.QuoteDto;
import org.example.first.groundingappapis.entity.User;
import org.springframework.data.domain.Page;

import java.util.Map;
import java.util.UUID;

public interface TradingService {

    //TradingDto.SellResponse uploadSellingOrderOnQuote(User user, UUID propertyId, TradingDto.SellRequest sellRequest);

    //TradingDto.BuyResponse uploadBuyingOrderOnQuote(User user, UUID propertyId, TradingDto.BuyRequest buyRequest);

    //OrderDto.GetTotalPriceResponse getTotalPrice(UUID propertyId, int quantity);

    OrderDto.GetQuantityResponse getQuantity(UUID userId, UUID propertyId);

    Double getFluctuationRate(int openingPrice, int executedPrice);

    OrderDto.GetQuantityOfInventoryResponse getQuantityOfInventory(User user, UUID propertyId);

    QuoteDto.ReadResponseWithPresentPrice readUpperQuotes(UUID propertyId, int basePrice, int page, int size);

    QuoteDto.ReadResponseWithPresentPrice readDownQuotes(UUID propertyId, int basePrice, int page, int size);
}
