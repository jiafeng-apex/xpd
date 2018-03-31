package com.xinpengdu.entity.project;

import java.io.Serializable;

/**
 * 银行录入
 *
 * @author Sunjf
 *         <p/>
 *         2015-12-30 下午9:06:34
 */
public class BankInput implements Serializable {
    private static final long serialVersionUID = 1L;

    private String bankId; // 编号
    private String projectId;   // 项目编号
    private String bankName; // 户名全称
    private String depositBank; // 开户银行
    private String bankAccount; // 银行账号
    private String cachet; // 公章
    private String financialSeal; // 财务章
    private String personalSeal; // 私章
    private String depositBankAddr; // 开户银行地址
    private String otherSeal; // 其他印章
    private String remark; // 备注
    private String createDate;  // 创建时间
    private String lastUpdateDate;  // 最后更新时间

    public String getBankId() {
        return bankId;
    }

    public void setBankId(String bankId) {
        this.bankId = bankId;
    }

    public String getBankName() {
        return bankName;
    }

    public void setBankName(String bankName) {
        this.bankName = bankName;
    }

    public String getDepositBank() {
        return depositBank;
    }

    public void setDepositBank(String depositBank) {
        this.depositBank = depositBank;
    }

    public String getBankAccount() {
        return bankAccount;
    }

    public void setBankAccount(String bankAccount) {
        this.bankAccount = bankAccount;
    }

    public String getCachet() {
        return cachet;
    }

    public void setCachet(String cachet) {
        this.cachet = cachet;
    }

    public String getFinancialSeal() {
        return financialSeal;
    }

    public void setFinancialSeal(String financialSeal) {
        this.financialSeal = financialSeal;
    }

    public String getPersonalSeal() {
        return personalSeal;
    }

    public void setPersonalSeal(String personalSeal) {
        this.personalSeal = personalSeal;
    }

    public String getDepositBankAddr() {
        return depositBankAddr;
    }

    public void setDepositBankAddr(String depositBankAddr) {
        this.depositBankAddr = depositBankAddr;
    }

    public String getOtherSeal() {
        return otherSeal;
    }

    public void setOtherSeal(String otherSeal) {
        this.otherSeal = otherSeal;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
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
