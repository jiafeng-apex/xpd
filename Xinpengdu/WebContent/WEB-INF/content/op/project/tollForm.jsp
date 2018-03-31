<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<input type="hidden" id="projectRateId_projectToll" />
<input type="hidden" id="projectTollId_projectToll" />
<!-- Add ProjectToll modal dialog -->
<div id="addProjectTollModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" style="width: 60%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">添加工程收费</h4>
            </div>
            <div class="modal-body form-horizontal">
                <div class="form-group has-feedback">
                    <label for="projectTollDateAddModal_projectToll" class="col-sm-2 control-label">日期：</label>
                    <div class="input-daterange col-md-4" id="projectTollDate_AddModal">
                        <input type="text" class="form-control col-md-12 dateSelect" id="projectTollDateAddModal_projectToll" name="projectTollDate"
                               style="border-radius: 4px;" title="日期" readonly="readonly"/>
                    </div>
                    <label for="automaticCalculationAddModal_projectToll" class="col-sm-2 control-label">自动计算：</label>
                    <div class="col-sm-4">
                        <select id="automaticCalculationAddModal_projectToll" class="input-sm col-md-12 automaticCalculationToll" title="自动计算">
                            <option value="1" selected="selected">是</option>
                            <option value="2">否</option>
                        </select>
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="summaryAddModal_projectToll" class="col-sm-2 control-label">摘要：</label>
                    <div class="col-sm-10">
                        <select id="summarySelectAddModal_projectToll" class="input-sm col-md-12 summarySelect_toll">
                        </select>
                        <input type="text" class="form-control ipt_content_left" id="summaryAddModal_projectToll" name="educationalSurtax"
                               autocomplete="off" style="position:absolute;width: 94%;height: 30px;" placeholder="">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="importAmountAddModal_projectToll" class="col-sm-2 control-label">汇入金额：</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control autoCalc again_input" id="importAmountAddModal_projectToll" name="importAmount" maxLength="30" autocomplete="off" placeholder="" title="汇入金额">
                    </div>
                    <label for="exportAmountAddModal_projectToll" class="col-sm-2 control-label">汇出金额：</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control autoCalc again_input" id="exportAmountAddModal_projectToll" name="exportAmount" maxLength="30" autocomplete="off" placeholder="" title="汇出金额">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="materialGeldAddModal_projectToll" class="col-sm-2 control-label">材料款：</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control autoCalc" id="materialGeldAddModal_projectToll" name="materialGeld" maxLength="30" autocomplete="off" placeholder="">
                    </div>
                    <label for="labourServiceFeeAddModal_projectToll" class="col-sm-2 control-label">劳务费：</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control autoCalc" id="labourServiceFeeAddModal_projectToll" name="labourServiceFee" maxLength="30" autocomplete="off" placeholder="">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="manageCostAddModal_projectToll" class="col-sm-2 control-label">扣管理费：</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control autoCalc" id="manageCostAddModal_projectToll" name="manageCost" maxLength="30" autocomplete="off" placeholder="">
                    </div>
                    <label for="warrantyAmountAddModal_projectToll" class="col-sm-2 control-label">扣质保金：</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control autoCalc" id="warrantyAmountAddModal_projectToll" name="warrantyAmount" maxLength="30" autocomplete="off" placeholder="">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="backWarrantyAmountAddModal_projectToll" class="col-sm-2 control-label">已退质保金：</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control autoCalc" id="backWarrantyAmountAddModal_projectToll" name="backWarrantyAmount" maxLength="30" autocomplete="off" placeholder="">
                    </div>
                    <label for="otherAmountAddModal_projectToll" class="col-sm-2 control-label">扣其他款：</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control autoCalc" id="otherAmountAddModal_projectToll" name="otherAmount" maxLength="30" autocomplete="off" placeholder="">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="vatSalesTaxAddModal_projectToll" class="col-sm-2 control-label">增值税销项税：</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="vatSalesTaxAddModal_projectToll" name="vatSalesTax" maxLength="30" autocomplete="off" placeholder="">
                    </div>
                    <label for="vatIncomeTaxAddModal_projectToll" class="col-sm-2 control-label">增值税进项税：</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="vatIncomeTaxAddModal_projectToll" name="vatIncomeTax" maxLength="30" autocomplete="off" placeholder="">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="cityBuildTaxAddModal_projectToll" class="col-sm-2 control-label">城市维护建设税：</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control autoCalc" id="cityBuildTaxAddModal_projectToll" name="cityBuildTax" maxLength="30" autocomplete="off" placeholder="">
                    </div>
                    <label for="educationSurchargeAddModal_projectToll" class="col-sm-2 control-label">教育费附加：</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control autoCalc" id="educationSurchargeAddModal_projectToll" name="educationSurcharge" maxLength="30" autocomplete="off" placeholder="">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="localEducationAttachedAddModal_projectToll" class="col-sm-2 control-label">地方教育附加：</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control autoCalc" id="localEducationAttachedAddModal_projectToll" name="localEducationAttached" maxLength="30" autocomplete="off" placeholder="">
                    </div>
                    <label for="stampDutyAddModal_projectToll" class="col-sm-2 control-label">扣印花税：</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control autoCalc" id="stampDutyAddModal_projectToll" name="stampDuty" maxLength="30" autocomplete="off" placeholder="">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="individualIncomeTaxAddModal_projectToll" class="col-sm-2 control-label">扣个人所得税：</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control autoCalc" id="individualIncomeTaxAddModal_projectToll" name="individualIncomeTax" maxLength="30" autocomplete="off" placeholder="">
                    </div>
                    <label for="corporateIncomeTaxAddModal_projectToll" class="col-sm-2 control-label">扣企业所得税：</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control autoCalc" id="corporateIncomeTaxAddModal_projectToll" name="corporateIncomeTax" maxLength="30" autocomplete="off" placeholder="">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="waterBuildIncomeAddModal_projectToll" class="col-sm-2 control-label">水利建设专项收入：</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control autoCalc" id="waterBuildIncomeAddModal_projectToll" name="waterBuildIncome" maxLength="30" autocomplete="off" placeholder="">
                    </div>
                    <label for="otherTaxAddModal_projectToll" class="col-sm-2 control-label">其他税：</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control autoCalc" id="otherTaxAddModal_projectToll" name="otherTax" maxLength="30" autocomplete="off" placeholder="">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="supplementaryBusinessTaxAddModal_projectToll" class="col-sm-2 control-label">扣营业税及附加税：</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control autoCalc" id="supplementaryBusinessTaxAddModal_projectToll" name="supplementaryBusinessTax" maxLength="30" autocomplete="off" placeholder="">
                    </div>
                    <label for="interestAddModal_projectToll" class="col-sm-2 control-label">扣利息：</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control autoCalc" id="interestAddModal_projectToll" name="interest" maxLength="30" autocomplete="off" placeholder="">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="companyFundsAddModal_projectToll" class="col-sm-2 control-label">汇回公司款：</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control autoCalc" id="companyFundsAddModal_projectToll" name="companyFunds" maxLength="30" autocomplete="off" placeholder="">
                    </div>
                    <label for="localBankDepositAddModal_projectToll" class="col-sm-2 control-label">当地银行存款：</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="localBankDepositAddModal_projectToll" name="localBankDeposit" maxLength="30" autocomplete="off" placeholder="">
                        <input type="hidden" id="localBankDepositBakAddModal_projectToll"/> <!-- 该条工程收费的当地银行存款 -->
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="balanceAddModal_projectToll" class="col-sm-2 control-label">余额：</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="balanceAddModal_projectToll" name="balance" maxLength="30" autocomplete="off" placeholder="" value="0" />
                        <input type="hidden" id="balanceBakAddModal_projectToll"/> <!-- 该条工程收费的余额 -->
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button id="addProjectTollModalSubmit" type="button" class="btn btn-primary" data-loading-text="保存&hellip;">保存</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<!-- Edit ProjectToll modal dialog -->
<div id="editProjectTollModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" style="width: 60%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">工程收费信息</h4>
            </div>
            <div class="modal-body form-horizontal">

                <div class="form-group has-feedback">
                    <label for="projectTollDateEditModal_projectToll" class="col-sm-2 control-label">日期：</label>
                    <div class="input-daterange col-md-4" id="projectTollDate_EditModal">
                        <input type="text" class="form-control col-md-12 dateSelect" id="projectTollDateEditModal_projectToll" name="projectTollDate"
                               style="border-radius: 4px;" title="日期" readonly="readonly"/>
                    </div>
                    <label for="automaticCalculationEditModal_projectToll" class="col-sm-2 control-label">自动计算：</label>
                    <div class="col-sm-4">
                        <select id="automaticCalculationEditModal_projectToll" class="input-sm col-md-12 automaticCalculationToll" title="自动计算">
                            <option value="1">是</option>
                            <option value="2">否</option>
                        </select>
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="summaryEditModal_projectToll" class="col-sm-2 control-label">摘要：</label>
                    <div class="col-sm-10">
                        <select id="summarySelectEditModal_projectToll" class="input-sm col-md-12 summarySelect_toll">
                        </select>
                        <input type="text" class="form-control ipt_content_left" id="summaryEditModal_projectToll" name="educationalSurtax"
                               autocomplete="off" style="position:absolute;width: 94%;height: 30px;" placeholder="">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="importAmountEditModal_projectToll" class="col-sm-2 control-label">汇入金额：</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control autoCalc again_input again_input" id="importAmountEditModal_projectToll" name="importAmount" maxLength="30" autocomplete="off" placeholder="" title="汇入金额">

                    </div>
                    <label for="exportAmountEditModal_projectToll" class="col-sm-2 control-label">汇出金额：</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control autoCalc again_input" id="exportAmountEditModal_projectToll" name="exportAmount" maxLength="30" autocomplete="off" placeholder="" title="汇出金额">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="materialGeldEditModal_projectToll" class="col-sm-2 control-label">材料款：</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control autoCalc" id="materialGeldEditModal_projectToll" name="materialGeld" maxLength="30" autocomplete="off" placeholder="">
                    </div>
                    <label for="labourServiceFeeEditModal_projectToll" class="col-sm-2 control-label">劳务费：</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control autoCalc" id="labourServiceFeeEditModal_projectToll" name="labourServiceFee" maxLength="30" autocomplete="off" placeholder="">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="manageCostEditModal_projectToll" class="col-sm-2 control-label">扣管理费：</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control autoCalc" id="manageCostEditModal_projectToll" name="manageCost" maxLength="30" autocomplete="off" placeholder="">
                    </div>
                    <label for="warrantyAmountEditModal_projectToll" class="col-sm-2 control-label">扣质保金：</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control autoCalc" id="warrantyAmountEditModal_projectToll" name="warrantyAmount" maxLength="30" autocomplete="off" placeholder="">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="backWarrantyAmountEditModal_projectToll" class="col-sm-2 control-label">已退质保金：</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control autoCalc" id="backWarrantyAmountEditModal_projectToll" name="backWarrantyAmount" maxLength="30" autocomplete="off" placeholder="">
                    </div>
                    <label for="otherAmountEditModal_projectToll" class="col-sm-2 control-label">扣其他款：</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control autoCalc" id="otherAmountEditModal_projectToll" name="otherAmount" maxLength="30" autocomplete="off" placeholder="">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="vatSalesTaxEditModal_projectToll" class="col-sm-2 control-label">增值税销项税：</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control autoCalc" id="vatSalesTaxEditModal_projectToll" name="vatSalesTax" maxLength="30" autocomplete="off" placeholder="">
                    </div>
                    <label for="vatIncomeTaxEditModal_projectToll" class="col-sm-2 control-label">增值税进项税：</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control autoCalc" id="vatIncomeTaxEditModal_projectToll" name="vatIncomeTax" maxLength="30" autocomplete="off" placeholder="">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="cityBuildTaxEditModal_projectToll" class="col-sm-2 control-label">城市维护建设税：</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control autoCalc" id="cityBuildTaxEditModal_projectToll" name="cityBuildTax" maxLength="30" autocomplete="off" placeholder="">
                    </div>
                    <label for="educationSurchargeEditModal_projectToll" class="col-sm-2 control-label">教育费附加：</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control autoCalc" id="educationSurchargeEditModal_projectToll" name="educationSurcharge" maxLength="30" autocomplete="off" placeholder="">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="localEducationAttachedEditModal_projectToll" class="col-sm-2 control-label">地方教育附加：</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control autoCalc" id="localEducationAttachedEditModal_projectToll" name="localEducationAttached" maxLength="30" autocomplete="off" placeholder="">
                    </div>
                    <label for="stampDutyEditModal_projectToll" class="col-sm-2 control-label">扣印花税：</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control autoCalc" id="stampDutyEditModal_projectToll" name="stampDuty" maxLength="30" autocomplete="off" placeholder="">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="individualIncomeTaxEditModal_projectToll" class="col-sm-2 control-label">扣个人所得税：</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control autoCalc" id="individualIncomeTaxEditModal_projectToll" name="individualIncomeTax" maxLength="30" autocomplete="off" placeholder="">
                    </div>
                    <label for="corporateIncomeTaxEditModal_projectToll" class="col-sm-2 control-label">扣企业所得税：</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control autoCalc" id="corporateIncomeTaxEditModal_projectToll" name="corporateIncomeTax" maxLength="30" autocomplete="off" placeholder="">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="waterBuildIncomeEditModal_projectToll" class="col-sm-2 control-label">水利建设专项收入：</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control autoCalc" id="waterBuildIncomeEditModal_projectToll" name="waterBuildIncome" maxLength="30" autocomplete="off" placeholder="">
                    </div>
                    <label for="otherTaxEditModal_projectToll" class="col-sm-2 control-label">其他税：</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control autoCalc" id="otherTaxEditModal_projectToll" name="otherTax" maxLength="30" autocomplete="off" placeholder="">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="supplementaryBusinessTaxEditModal_projectToll" class="col-sm-2 control-label">扣营业税及附加税：</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control autoCalc" id="supplementaryBusinessTaxEditModal_projectToll" name="supplementaryBusinessTax" maxLength="30" autocomplete="off" placeholder="">
                    </div>
                    <label for="interestEditModal_projectToll" class="col-sm-2 control-label">扣利息：</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control autoCalc" id="interestEditModal_projectToll" name="interest" maxLength="30" autocomplete="off" placeholder="">
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="companyFundsEditModal_projectToll" class="col-sm-2 control-label">汇回公司款：</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control autoCalc" id="companyFundsEditModal_projectToll" name="companyFunds" maxLength="30" autocomplete="off" placeholder="">
                    </div>
                    <label for="localBankDepositEditModal_projectToll" class="col-sm-2 control-label">当地银行存款：</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="localBankDepositEditModal_projectToll" name="localBankDeposit" maxLength="30" autocomplete="off" placeholder="">
                        <input type="hidden" id="localBankDepositBakEditModal_projectToll"/> <!-- 该条工程收费的当地银行存款 -->
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="balanceEditModal_projectToll" class="col-sm-2 control-label">余额：</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="balanceEditModal_projectToll" name="balance" maxLength="30" autocomplete="off" placeholder="">
                        <input type="hidden" id="balanceBakEditModal_projectToll"/> <!-- 该条工程收费的余额 -->
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button id="editProjectTollModalSubmit" type="button" class="btn btn-primary" data-loading-text="保存&hellip;">保存</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<!-- Remove ProjectToll modal dialog -->
<div id="removeProjectTollModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">删除收费信息</h4>
            </div>
            <div class="modal-body form-horizontal">
                <p>确定删除该收费信息？</p>
            </div>
            <div class="modal-footer">
                <button id="removeProjectTollModalSubmit" type="button" class="btn btn-primary" data-loading-text="删除&hellip;">删除</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>
