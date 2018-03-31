package com.xinpengdu.entity.project;

import java.io.Serializable;

/**
 * 劳务费
 * Created by jiafeng on 17/7/14.
 */
public class LabourServiceFee implements Serializable {
    private static final long serialVersionUID = 1L;

    private String labourServiceFeeId;                  // 劳务费主键
    private String projectId;                           // 项目Id

    private String serviceBusinessName;                 // 劳务商名称
    private String address;                             // 地址
    private String telephone;                           // 电话
    private String companyOpeningBank;                  // 开户银行
    private String accountOpeningAaccount;              // 开户账号
    private String signingDate;                         // 签订日期
    private String laburServiceMaterial;                // 劳务材料
    private String taxIdentificationNumber;             // 纳税识别号
    private String quantity;                            // 数量
    private String unitPrice;                           // 单价
    private String contractAmount;                      // 合同金额
    private String settlementAmount;                    // 结算金额
    private String remark;                              // 备注

    private String createDate;                          // 创建时间
    private String lastUpdateDate;                      // 最后更新时间


    public String getLaburServiceMaterial() {
        return laburServiceMaterial;
    }

    public void setLaburServiceMaterial(String laburServiceMaterial) {
        this.laburServiceMaterial = laburServiceMaterial;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getLabourServiceFeeId() {
        return labourServiceFeeId;
    }

    public void setLabourServiceFeeId(String labourServiceFeeId) {
        this.labourServiceFeeId = labourServiceFeeId;
    }

    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    public String getCompanyOpeningBank() {
        return companyOpeningBank;
    }

    public void setCompanyOpeningBank(String companyOpeningBank) {
        this.companyOpeningBank = companyOpeningBank;
    }

    public String getAccountOpeningAaccount() {
        return accountOpeningAaccount;
    }

    public void setAccountOpeningAaccount(String accountOpeningAaccount) {
        this.accountOpeningAaccount = accountOpeningAaccount;
    }

    public String getSigningDate() {
        return signingDate;
    }

    public void setSigningDate(String signingDate) {
        this.signingDate = signingDate;
    }

    public String getServiceBusinessName() {
        return serviceBusinessName;
    }

    public void setServiceBusinessName(String serviceBusinessName) {
        this.serviceBusinessName = serviceBusinessName;
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
