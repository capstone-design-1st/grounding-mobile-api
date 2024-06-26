package org.example.first.groundingappapis.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import java.util.UUID;

@Entity
@Table(name = "inventories", uniqueConstraints = {
        @UniqueConstraint(columnNames = {"account_id", "property_id"})
})
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Inventory {
    @Id
    @Column(name = "inventory_id", columnDefinition = "BINARY(16)", nullable = false)
    private UUID id;

    //수량, 가격, 수익률, 현재가
    @Column(name = "quantity")
    private Integer quantity;

    //매도 주문 가능 수량, 호가 등록시 -, 매도 주문 취소 시 +
    @Column(name = "sellable_quantity")
    private Integer sellableQuantity;

    //매입금액
    @Column(name = "average_buying_price")
    private Integer averageBuyingPrice;

    @Column(name = "earnings_rate")
    private Double earningsRate;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "account_id", columnDefinition = "BINARY(16)", foreignKey = @ForeignKey(name = "fk_inventorys_account"))
    private Account account;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "property_id", columnDefinition = "BINARY(16)", foreignKey = @ForeignKey(name = "fk_inventorys_property"))
    private Property property;

    @Builder
    public Inventory(Integer quantity, Integer averageBuyingPrice, Integer sellableQuantity, Double earningsRate) {
        this.quantity = quantity;
        this.averageBuyingPrice = averageBuyingPrice;
        this.sellableQuantity = sellableQuantity;
        this.earningsRate = earningsRate;
    }

    public void updateProperty(Property property) {
        this.property = property;
    }

    public void updateAccount(Account account) {
        this.account = account;
        account.getInventories().add(this);
    }

    @PrePersist
    public void prePersist() {
        if (this.id == null)
            this.id = UUID.randomUUID();
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public void setAverageBuyingPrice(Integer averageBuyingPrice) {
        this.averageBuyingPrice = averageBuyingPrice;
    }

    public void setSellableQuantity(int sellableQuantity) {
        this.sellableQuantity = sellableQuantity;
    }

    public void setEarningsRate(Double earningsRate) {
        this.earningsRate = earningsRate;
    }

    public void increaseQuantity(int executedQuantity) {
        this.quantity += executedQuantity;
    }

    public void decreaseQuantity(int executedQuantity) {
        this.quantity -= executedQuantity;
    }

    public void increaseSellableQuantity(int executedQuantity) {
        this.sellableQuantity += executedQuantity;
    }

    public void decreaseSellableQuantity(int executedQuantity) {
        this.sellableQuantity -= executedQuantity;
    }

    public void freeInventory(){
        this.property = null;
        this.account = null;
    }
//    public InventoryDto toDto() {
//        return InventoryDto.builder()
//                .build();
//    }
}
