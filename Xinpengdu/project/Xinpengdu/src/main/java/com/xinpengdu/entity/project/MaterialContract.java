package com.xinpengdu.entity.project;

import java.io.Serializable;

/**
 * 材料合同
 * Created by jiafeng on 17/7/14.
 */
public class MaterialContract implements Serializable {
    private static final long serialVersionUID = 1L;

    private String materialContractId;          // 材料合同主键
    private String projectId;                   // 项目编号

    private String supplierName;                // 供应商名称
    private String telephone;                   // 电话
    private String address;                     // 地址
    private String openingBank;                 // 开户银行
    private String accountNumber;               // 开户账号
    private String signingDate;                 // 签订日期
    private String materialName;                // 材料名称
    private String taxIdentificationNumber;     // 纳税识别号
    private String quantity;                    // 数量
    private String unitPrice;                   // 单价
    private String contractAmount;              // 合同金额
    private String settlementAmount;            // 结算金额
    private String remark;                      // 备注

    private String createDate;                  // 创建时间
    private String lastUpdateDate;              // 最后更新时间

    public String getMaterialContractId() {
        return materialContractId;
    }

    public void setMaterialContractId(String materialContractId) {
        this.materialContractId = materialContractId;
    }

    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getOpeningBank() {
        return openingBank;
    }

    public void setOpeningBank(String openingBank) {
        this.openingBank = openingBank;
    }

    public String getAccountNumber() {
        return accountNumber;
    }

    public void setAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
    }

    public String getSigningDate() {
        return signingDate;
    }

    public void setSigningDate(String signingDate) {
        this.signingDate = signingDate;
    }

    public String getMaterialName() {
        return materialName;
    }

    public void setMaterialName(String materialName) {
        this.materialName = materialName;
    }

    public String getSupplierName() {
        return supplierName;
    }

    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName;
    }

    public String getTaxIdentificationNumber() {
        return taxIdentificationNumber;
    }

    public void setTaxIdentificationNumber(String taxIdentificationNumber) {
        this.taxIdentificationNumber = taxIdentificationNumber;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public String getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(String unitPrice) {
        this.unitPrice = unitPrice;
    }

    public String getContractAmount() {
        return contractAmount;
    }

    public void setContractAmount(String contractAmount) {
        this.contractAmount = contractAmount;
    }

    public String getSettlementAmount() {
        return settlementAmount;
    }

    public void setSettlementAmount(String settlementAmount) {
        this.settlementAmount = settlementAmount;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public String getLastUpdateDate() {
        return lastUpdateDate;
    }

    public void setLastUpdateDate(String lastUpdateDate) {
        this.lastUpdateDate = lastUpdateDate;
    }
}
