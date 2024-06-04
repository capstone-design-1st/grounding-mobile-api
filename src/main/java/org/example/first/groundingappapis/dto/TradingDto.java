package org.example.first.groundingappapis.dto;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

public class TradingDto {
    @Data
    @NoArgsConstructor
    @JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
    public static class BuyRequest {
        private int quantity;
        private int price;

        @Builder
        public BuyRequest(String propertyId, int quantity, int price) {
            this.quantity = quantity;
            this.price = price;
        }
    }

    @Data
    @NoArgsConstructor
    @JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
    public static class SellRequest {
        private int quantity;
        private int price;

        @Builder
        public SellRequest(int quantity, int price) {
            this.quantity = quantity;
            this.price = price;
        }
    }

    @Data
    @NoArgsConstructor
    @JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
    public static class BuyResponse {
        private String userId;
        private String walletAddress;

        private String propertyId;
        private Integer executedQuantity;
        private Integer executedPrice;

        private List<PurchasedSellerQuoteInfoDto> purchasedSellQuotesInfoDto;
        @Builder
        public BuyResponse(String userId, String walletAddress, String propertyId, Integer executedQuantity, Integer executedPrice) {
            this.userId = userId;
            this.walletAddress = walletAddress;
            this.propertyId = propertyId;
            this.executedQuantity = executedQuantity;
            this.executedPrice = executedPrice;
        }
    }

    @Data
    @NoArgsConstructor
    @JsonNaming(value = PropertyNamingStrategies.SnakeCaseStrategy.class)
    public static class PurchasedSellerQuoteInfoDto{
        private String sellerId;
        private String sellerWalletAddress;
        private Integer executedQuantity;
        private Integer executedPrice;

        @Builder
        public PurchasedSellerQuoteInfoDto(String sellerId, String sellerWalletAddress, Integer executedQuantity, Integer executedPrice) {
            this.sellerId = sellerId;
            this.sellerWalletAddress = sellerWalletAddress;
            this.executedQuantity = executedQuantity;
            this.executedPrice = executedPrice;
        }
    }

}
