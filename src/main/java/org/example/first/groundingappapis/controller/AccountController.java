package org.example.first.groundingappapis.controller;

import io.swagger.v3.oas.annotations.Operation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.example.first.groundingappapis.dto.AccountDto;
import org.example.first.groundingappapis.dto.DepositLogDto;
import org.example.first.groundingappapis.dto.OrderDto;
import org.example.first.groundingappapis.security.UserPrincipal;
import org.example.first.groundingappapis.service.AccountService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@Slf4j
@RequestMapping("/account")
@RestController
@RequiredArgsConstructor
public class AccountController {
    private final AccountService accountService;

    @PreAuthorize("isAuthenticated()")
    @GetMapping("/inventory")
    public ResponseEntity<List<AccountDto.ReadUserPropertyResponse>> readUserProperty(@AuthenticationPrincipal UserPrincipal userPrincipal) {
        log.info("readUserProperty");
        final UUID userId = userPrincipal.getUser().getId();
        return ResponseEntity.ok(accountService.readUserProperty(userId));
    }

    @Operation(summary = "거래 내역 조회, type : 매수, 매도 (null 시 전부 조회)")
    @GetMapping("/transactions")
    public ResponseEntity<Page<AccountDto.ReadCompletedOrderResponse>> readTransactions(@AuthenticationPrincipal UserPrincipal userPrincipal,
                                                                                      @RequestParam(defaultValue = "0") int page,
                                                                                      @RequestParam(defaultValue = "10") int size,
                                                                                      @RequestParam(defaultValue = "2020-01-01") String startDate,
                                                                                      @RequestParam(defaultValue = "2100-12-31") String endDate,
                                                                                      //@RequestParam() String type){ nullable false
                                                                                      @RequestParam(required = false) String type) {
        log.info("readTransactions");
        final UUID userId = userPrincipal.getUser().getId();

        Pageable pageable = PageRequest.of(page, size);
        type = type == null ? "" : type;
        return ResponseEntity.ok(accountService.readTransactions(userId, pageable, startDate, endDate, type));
    }

    @PreAuthorize("isAuthenticated()")
    @Operation(summary = "현재 투자 금액 및 자산현황 조회")
    @GetMapping("/present-status")
    public ResponseEntity<AccountDto.ReadPresentStatusResponse> readPresentStatus(@AuthenticationPrincipal UserPrincipal userPrincipal) {
        log.info("readPresentStatus");
        final UUID userId = userPrincipal.getUser().getId();
        return ResponseEntity.ok(accountService.readPresentStatus(userId));
    }

    @Operation(summary = "입출금 내역 조회, type : 입금, 출금 (null 시 전부 조회)")
    @GetMapping("/deposits-withdrawals")
    public ResponseEntity<Page<DepositLogDto.ReadResponse>> readDepositsWithdrawals(@AuthenticationPrincipal UserPrincipal userPrincipal,
                                                                                    @RequestParam(defaultValue = "0") int page,
                                                                                    @RequestParam(defaultValue = "10") int size,
                                                                                    @RequestParam(defaultValue = "2020-01-01") String startDate,
                                                                                    @RequestParam(defaultValue = "2100-12-31") String endDate,
                                                                                    @RequestParam(required = false) String type) {
        log.info("readDepositsWithdrawals");
        final UUID userId = userPrincipal.getUser().getId();

        Pageable pageable = PageRequest.of(page, size);
        type = type == null ? "" : type;

        return ResponseEntity.ok(accountService.readDepositsWithdrawals(userId, pageable, startDate, endDate, type));
    }

    @Operation(summary = "입금")
    @PostMapping("/deposit")
    public ResponseEntity<AccountDto.DepositWithdrawalResponse> deposit(@AuthenticationPrincipal UserPrincipal userPrincipal,
                                                                            @RequestBody AccountDto.DepositRequest request) {
        log.info("deposit");
        final UUID userId = userPrincipal.getUser().getId();
        return ResponseEntity.ok(accountService.deposit(userId, request));
    }

    @Operation(summary = "출금")
    @PostMapping("/withdrawal")
    public ResponseEntity<AccountDto.DepositWithdrawalResponse> withdrawal(@AuthenticationPrincipal UserPrincipal userPrincipal,
                                                                               @RequestBody AccountDto.WithdrawalRequest request) {
        log.info("withdrawal");
        final UUID userId = userPrincipal.getUser().getId();
        return ResponseEntity.ok(accountService.withdrawal(userId, request));
    }

}
