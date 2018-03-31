<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<input type="hidden" id="invoiceId_projectInvoice" />
<input type="hidden" id="invoiceTaxBillId_invoiceTaxBill" />
<input type="hidden" id="invoiceTaxBillId_invoiceTaxBill_1" />
<input type="hidden" id="invoiceTaxBillId_invoiceTaxBill_2" />
<!-- Add ProjectInvoice modal dialog -->
<div id="addProjectInvoiceModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" style="width: 60%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">添加发票</h4>
            </div>
            <div class="modal-body form-horizontal">
                <div id="invoiceInfoAddModal">
                    <div class="form-group has-feedback">
                        <label for="invoiceNumberAddModal_projectInvoice" class="col-sm-2 control-label">发票号:</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control ipt_content_left required" id="invoiceNumberAddModal_projectInvoice" name="invoiceNumber" maxLength="30" autocomplete="off" placeholder="" title="发票号">
                        </div>
                        <label for="invoiceDateAddModal_projectInvoice" class="col-sm-2 control-label">填开日期:</label>
                        <div class="input-daterange col-md-4" id="invoiceDate_AddModal">
                            <input type="text" class="form-control col-md-12 dateSelect required" id="invoiceDateAddModal_projectInvoice" name="invoiceDate" style="border-radius: 4px;" title="填开日期"  readonly="readonly"/>
                        </div>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="summaryAddModal_projectInvoice" class="col-sm-2 control-label">摘要:</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control ipt_content_left required" id="summaryAddModal_projectInvoice" name="summary" maxLength="30" autocomplete="off" placeholder="" style="text-align: left;" title="摘要">
                        </div>
                        <label for="taxRateAddModal_projectInvoice" class="col-sm-2 control-label">税率:</label>
                        <div class="col-sm-3" style="width:32%;">
                            <div class="input-group" style="width:98%; float:left;">
                                <div class="input-group-btn">
                                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                        选择税率
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu calcInvoiceTaxSelect" id="calcInvoiceTaxSelectAddModal" data-toggle="taxRateAddModal_projectInvoice">
                                        <li>3</li>
                                        <li>6</li>
                                        <li>11</li>
                                        <li>17</li>
                                    </ul>
                                </div><!-- /btn-group -->
                                <input type="text" class="form-control ipt_tax calcInvoiceTax required" id="taxRateAddModal_projectInvoice" name="taxRate" title="税率" placeholder="输入其他税率">
                            </div><!-- /input-group -->
                            <span class="col-sm-1" style="line-height: 34px;width:5px;padding:0px; float:right;">%</span>
                        </div>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="invoiceAmountAddModal_projectInvoice" class="col-sm-2 control-label">金额:</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control ipt_tax_value calcInvoiceTax required" id="invoiceAmountAddModal_projectInvoice" name="invoiceAmount" maxLength="30" autocomplete="off" placeholder="" title="金额">
                        </div>
                        <label for="taxTotalAddModal_projectInvoice" class="col-sm-2 control-label">税价合计:</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control ipt_tax_value required" id="taxTotalAddModal_projectInvoice" name="taxTotal" maxLength="30" autocomplete="off" placeholder="" title="税价合计">
                        </div>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="taxAddModal_projectInvoice" class="col-sm-2 control-label">税额:</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control ipt_tax_value required" id="taxAddModal_projectInvoice" name="tax" maxLength="30" autocomplete="off" placeholder="" title="税额">
                        </div>
                        <label for="invoiceTypeAddModal_projectInvoice" class="col-sm-2 control-label">发票类型:</label>
                        <div class="col-sm-4">
                            <select id="invoiceTypeAddModal_projectInvoice" class="input-sm col-md-12" title="发票类型" >
                                <option value="1">普通发票</option>
                                <option value="2">专用发票</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="remarkAddModal_projectInvoice" class="col-sm-2 control-label">备注:</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control ipt_content_left" id="remarkAddModal_projectInvoice" name="remark" maxLength="30" autocomplete="off" placeholder="" style="text-align: left;" title="备注">
                        </div>
                        <label for="incomeTaxCalcTypeAddModal_projectInvoice" class="col-sm-2 control-label">所得税:</label>
                        <div class="col-sm-4">
                            <select id="incomeTaxCalcTypeAddModal_projectInvoice" class="input-sm col-md-12 incomeTaxCalcTypeSelect" title="所得税" >
                                <option value="1">按税价计算</option>
                                <option value="2">按金额</option>
                            </select>
                        </div>
                    </div>
                </div>

                <!-- 税单 start -->
                <div id="taxBill_title_AddModal" class="form-group has-feedback" style="margin-bottom: 5px;display: block;">
                    <h4 class="modal-title" style="padding-left: 20px;">税单</h4>
                </div>
                <div id="nonlocal_title_AddModal" class="form-group has-feedback" style="margin-bottom: 5px;display: none;">
                    <ul id="tax_pills_AddModal" class="nav nav-pills" role="tablist" style="display: inline-block;margin-left: 15px;">
                        <li id="shenzhen_tax_AddModal" role="presentation" class="active">
                            <a href="#">深圳交税</a>
                        </li>
                        <li id="local_tax_AddModal" role="presentation">
                            <a href="#">当地交税</a>
                        </li>
                    </ul>
                </div>
                <div class="title-line" style="margin-bottom: 10px;"></div>
                <!-- 税单 start -->
                <div id="taxBill_AddModal" style="display: block;">
                    <div class="form-group has-feedback">
                        <label for="addedValueTaxAddModal_invoiceTaxBill" class="col-sm-2 control-label">增值税:</label>
                        <div class="col-sm-1" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax required" id="addedValueTaxAddModal_invoiceTaxBill" name="addedValueTax" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="增值税">
                        </div>
                        <span class="col-sm-1" style="padding-left: 0px;line-height: 34px;width:1px;padding:0px;">%</span>
                        <div class="col-sm-2" style="padding-right:5px;">
                            <input type="text" class="form-control  ipt_tax_value required" id="addedValueTaxValueAddModal_invoiceTaxBill" name="addedValueTaxValue" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="增值税">
                        </div>
                        <label for="constructionTaxAddModal_invoiceTaxBill" class="col-sm-2 control-label">城建税:</label>
                        <div class="col-sm-1" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax required" id="constructionTaxAddModal_invoiceTaxBill" name="constructionTax" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="城建税">
                        </div>
                        <span class="col-sm-1" style="padding-left: 0px;line-height: 34px;width:1px;padding:0px;">%</span>
                        <div class="col-sm-2" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax_value required" id="constructionTaxValueAddModal_invoiceTaxBill" name="constructionTaxValue" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="城建税">
                        </div>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="areaEducationalSurtaxAddModal_invoiceTaxBill" class="col-sm-2 control-label">地方教育附加费:</label>
                        <div class="col-sm-1" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax required" id="areaEducationalSurtaxAddModal_invoiceTaxBill" name="areaEducationalSurtax" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="地方教育附加费">
                        </div>
                        <span class="col-sm-1" style="padding-left: 0px;line-height: 34px;width:1px;padding:0px;">%</span>
                        <div class="col-sm-2" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax_value required" id="areaEducationalSurtaxValueAddModal_invoiceTaxBill" name="areaEducationalSurtaxValue" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="地方教育附加费">
                        </div>
                        <label for="educationalSurtaxAddModal_invoiceTaxBill" class="col-sm-2 control-label">教育费附加:</label>
                        <div class="col-sm-1" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax required" id="educationalSurtaxAddModal_invoiceTaxBill" name="educationalSurtax" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="教育费附加">
                        </div>
                        <span class="col-sm-1" style="padding-left: 0px;line-height: 34px;width:1px;padding:0px;">%</span>
                        <div class="col-sm-2" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax_value required" id="educationalSurtaxValueAddModal_invoiceTaxBill" name="educationalSurtaxValue" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="教育费附加">
                        </div>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="individualIncomeTaxAddModal_invoiceTaxBill" class="col-sm-2 control-label">个人所得税:</label>
                        <div class="col-sm-1" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax required" id="individualIncomeTaxAddModal_invoiceTaxBill" name="individualIncomeTax" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="个人所得税">
                        </div>
                        <span class="col-sm-1" style="padding-left: 0px;line-height: 34px;width:1px;padding:0px;">%</span>
                        <div class="col-sm-2" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax_value required" id="individualIncomeTaxValueAddModal_invoiceTaxBill" name="individualIncomeTaxValue" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="个人所得税">
                        </div>
                        <label for="corporateIncomeTaxAddModal_invoiceTaxBill" class="col-sm-2 control-label">企业所得税:</label>
                        <div class="col-sm-1" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax required" id="corporateIncomeTaxAddModal_invoiceTaxBill" name="corporateIncomeTax" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="企业所得税">
                        </div>
                        <span class="col-sm-1" style="padding-left: 0px;line-height: 34px;width:1px;padding:0px;">%</span>
                        <div class="col-sm-2" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax_value required" id="corporateIncomeTaxValueAddModal_invoiceTaxBill" name="corporateIncomeTaxValue" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="企业所得税">
                        </div>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="otherTaxAddModal_invoiceTaxBill" class="col-sm-2 control-label">其他税:</label>
                        <div class="col-sm-1" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax" id="otherTaxAddModal_invoiceTaxBill" name="otherTax" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="其他税">
                        </div>
                        <span class="col-sm-1" style="padding-left: 0px;line-height: 34px;width:1px;padding:0px;">%</span>
                        <div class="col-sm-2" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax_value" id="otherTaxValueAddModal_invoiceTaxBill" name="otherTaxValue" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="其他税">
                        </div>
                        <label for="stampDutyAddModal_invoiceTaxBill" class="col-sm-2 control-label">印花税:</label>
                        <div class="col-sm-1" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax required" id="stampDutyAddModal_invoiceTaxBill" name="stampDuty" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="印花税">
                        </div>
                        <span class="col-sm-1" style="padding-left: 0px;line-height: 34px;width:1px;padding:0px;">%</span>
                        <div class="col-sm-2" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax_value required" id="stampDutyValueAddModal_invoiceTaxBill" name="stampDutyValue" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="印花税">
                        </div>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="taxPeriodAddModal_invoiceTaxBill" class="col-sm-2 control-label">税款所属期:</label>
                        <div class="col-sm-3" style="width:26%;">
                            <input type="text" class="form-control" id="taxPeriodAddModal_invoiceTaxBill" name="taxPeriod" maxLength="30" autocomplete="off" placeholder="" title="税款所属期">
                        </div>
                        <label for="waterBuildTaxAddModal_invoiceTaxBill" class="col-sm-2 control-label" style="width: 15.7%;">水利建设税:</label>
                        <div class="col-sm-1" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax" id="waterBuildTaxAddModal_invoiceTaxBill" name="waterBuildTax" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="水利建设税">
                        </div>
                        <span class="col-sm-1" style="padding-left: 0px;line-height: 34px;width:1px;padding:0px;">%</span>
                        <div class="col-sm-2" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax_value" id="waterBuildTaxValueAddModal_invoiceTaxBill" name="waterBuildTaxValue" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="水利建设税">
                        </div>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="taxBillTotalAddModal_invoiceTaxBill" class="col-sm-2 control-label">税单合计:</label>
                        <div class="col-sm-3" style="width:26%;">
                            <input type="text" class="form-control required" id="taxBillTotalAddModal_invoiceTaxBill" name="taxBillTotal" maxLength="30" autocomplete="off" placeholder="" title="税单合计">
                        </div>
                        <label for="remarkAddModal_invoiceTaxBill" class="col-sm-2 control-label" style="width: 15.7%;">备注:</label>
                        <div class="col-sm-3" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_content_left" id="remarkAddModal_invoiceTaxBill" name="remark" maxLength="30" autocomplete="off" placeholder="" style="text-align: left;" title="备注">
                        </div>
                    </div>
                </div>
                <!-- 税单 end -->

                <!-- 深圳交税 start -->
                <div id="nonclocal_szlocalTaxAddModal" style="display: none;">
                    <div class="form-group has-feedback">
                        <label for="addedValueTaxAddModal_invoiceTaxBill_1" class="col-sm-2 control-label">增值税:</label>
                        <div class="col-sm-1" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax required" id="addedValueTaxAddModal_invoiceTaxBill_1" name="addedValueTax" maxLength="30" autocomplete="off" placeholder="" style="padding: 0px 8px;" title="增值税">
                        </div>
                        <span class="col-sm-1" style="line-height: 34px;width: 1%;padding: 0px;">%</span>
                        <div class="col-sm-2" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax_value required" id="addedValueTaxValueAddModal_invoiceTaxBill_1" name="addedValueTaxValue" maxLength="30" autocomplete="off" placeholder="" style="padding: 0px 8px;" title="增值税">
                        </div>
                        <label for="educationalSurtaxAddModal_invoiceTaxBill_1" class="col-sm-2 control-label">教育费附加:</label>
                        <div class="col-sm-1" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax required" id="educationalSurtaxAddModal_invoiceTaxBill_1" name="educationalSurtax" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="教育费附加">
                        </div>
                        <span class="col-sm-1" style="line-height: 34px;width: 1%;padding:0px;">%</span>
                        <div class="col-sm-2" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax_value required" id="educationalSurtaxValueAddModal_invoiceTaxBill_1" name="educationalSurtaxValue" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="教育费附加">
                        </div>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="constructionTaxAddModal_invoiceTaxBill_1" class="col-sm-2 control-label">城建税:</label>
                        <div class="col-sm-1" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax required" id="constructionTaxAddModal_invoiceTaxBill_1" name="constructionTax" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="城建税">
                        </div>
                        <span class="col-sm-1" style="line-height: 34px;width: 1%;padding:0px;">%</span>
                        <div class="col-sm-2" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax_value required" id="constructionTaxValueAddModal_invoiceTaxBill_1" name="constructionTaxValue" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="城建税">
                        </div>
                        <label for="corporateIncomeTaxAddModal_invoiceTaxBill_1" class="col-sm-2 control-label">企业所得税:</label>
                        <div class="col-sm-1" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax required" id="corporateIncomeTaxAddModal_invoiceTaxBill_1" name="corporateIncomeTax" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="企业所得税">
                        </div>
                        <span class="col-sm-1" style="line-height: 34px;width: 1%;padding:0px;">%</span>
                        <div class="col-sm-2" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax_value required" id="corporateIncomeTaxValueAddModal_invoiceTaxBill_1" name="corporateIncomeTaxValue" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="企业所得税">
                        </div>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="areaEducationalSurtaxAddModal_invoiceTaxBill_1" class="col-sm-2 control-label">地方教育附加费:</label>
                        <div class="col-sm-1" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax required" id="areaEducationalSurtaxAddModal_invoiceTaxBill_1" name="areaEducationalSurtax" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="地方教育附加费">
                        </div>
                        <span class="col-sm-1" style="line-height: 34px;width: 1%;padding:0px;">%</span>
                        <div class="col-sm-2" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax_value required" id="areaEducationalSurtaxValueAddModal_invoiceTaxBill_1" name="areaEducationalSurtaxValue" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="地方教育附加费">
                        </div>
                        <label for="stampDutyAddModal_invoiceTaxBill_1" class="col-sm-2 control-label">印花税:</label>
                        <div class="col-sm-1" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax required" id="stampDutyAddModal_invoiceTaxBill_1" name="stampDuty" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="印花税">
                        </div>
                        <span class="col-sm-1" style="line-height: 34px;width: 1%;padding:0px;">%</span>
                        <div class="col-sm-2" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax_value" id="stampDutyValueAddModal_invoiceTaxBill_1" name="stampDutyValue" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="印花税">
                        </div>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="individualIncomeTaxAddModal_invoiceTaxBill_1" class="col-sm-2 control-label">个人所得税:</label>
                        <div class="col-sm-1" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax required" id="individualIncomeTaxAddModal_invoiceTaxBill_1" name="individualIncomeTax" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="个人所得税">
                        </div>
                        <span class="col-sm-1" style="line-height: 34px;width: 1%;padding:0px;">%</span>
                        <div class="col-sm-2" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax_value required" id="individualIncomeTaxValueAddModal_invoiceTaxBill_1" name="individualIncomeTaxValue" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="个人所得税">
                        </div>
                        <label for="otherTaxAddModal_invoiceTaxBill_1" class="col-sm-2 control-label">其他税:</label>
                        <div class="col-sm-1" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax" id="otherTaxAddModal_invoiceTaxBill_1" name="otherTax" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="其他税">
                        </div>
                        <span class="col-sm-1" style="line-height: 34px;width: 1%;padding:0px;">%</span>
                        <div class="col-sm-2" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax_value" id="otherTaxValueAddModal_invoiceTaxBill_1" name="otherTaxValue" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="其他税">
                        </div>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="taxPeriodAddModal_invoiceTaxBill_1" class="col-sm-2 control-label">税款所属期:</label>
                        <div class="col-sm-3" style="padding-right:5px;width: 26%;">
                            <input type="text" class="form-control" id="taxPeriodAddModal_invoiceTaxBill_1" name="taxPeriod" maxLength="30" autocomplete="off" placeholder="" title="税款所属期">
                        </div>
                        <label for="szSubtotalAddModal_invoiceTaxBill_1" class="col-sm-2 control-label">深圳小计:</label>
                        <div class="col-sm-3" style="padding-right:5px;width: 26%;">
                            <input type="text" class="form-control ipt_tax_value required" id="szSubtotalAddModal_invoiceTaxBill_1" name="szSubtotal" maxLength="30" autocomplete="off" placeholder="" title="深圳小计">
                        </div>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="waterBuildTaxAddModal_invoiceTaxBill_1" class="col-sm-2 control-label">水利建设税:</label>
                        <div class="col-sm-1" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax" id="waterBuildTaxAddModal_invoiceTaxBill_1" name="waterBuildTax" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="水利建设税">
                        </div>
                        <span class="col-sm-1" style="line-height: 34px;width: 1%;padding:0px;">%</span>
                        <div class="col-sm-2" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax_value" id="waterBuildTaxValueAddModal_invoiceTaxBill_1" name="waterBuildTaxValue" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="水利建设税">
                        </div>
                        <label for="taxBillTotalAddModal_invoiceTaxBill_1" class="col-sm-2 control-label">税单合计:</label>
                        <div class="col-sm-3" style="padding-right:5px;width: 26%;">
                            <input type="text" class="form-control ipt_tax_value required" id="taxBillTotalAddModal_invoiceTaxBill_1" name="taxBillTotal" maxLength="30" autocomplete="off" placeholder="" title="税单合计">
                        </div>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="remarkAddModal_invoiceTaxBill_1" class="col-sm-2 control-label">备注:</label>
                        <div class="col-sm-9" style="padding-right:5px;width: 69%">
                            <input type="text" class="form-control ipt_content_left" id="remarkAddModal_invoiceTaxBill_1" name="remark" maxLength="30" autocomplete="off" placeholder="" title="备注">
                        </div>
                        <span class="col-sm-1"></span>
                    </div>
                </div>
                <!-- 深圳交税 end -->

                <!-- 当地交税 start -->
                <div id="nonclocal_localTaxAddModal" style="display: none;">
                    <div id="leftContainer_AddModal" class="form-horizontal" style="float: left; width: 50%;">
                        <div class="form-group has-feedback">
                            <label for="addedValueTaxAddModal_invoiceTaxBill_2" class="col-sm-4 control-label">增值税:</label>
                            <div class="col-sm-2" style="padding-right:5px;">
                                <input type="text" class="form-control ipt_tax required" id="addedValueTaxAddModal_invoiceTaxBill_2" name="addedValueTax" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="增值税">
                            </div>
                            <span class="col-sm-1" style="padding-left: 0px;line-height: 34px;width:1%;">%</span>
                            <div class="col-sm-5" style="padding-right:5px;">
                                <input type="text" class="form-control ipt_tax_value required" id="addedValueTaxValueAddModal_invoiceTaxBill_2" name="addedValueTaxValue" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="增值税">
                            </div>
                        </div>
                        <div class="form-group has-feedback">
                            <label for="constructionTaxAddModal_invoiceTaxBill_2" class="col-sm-4 control-label">城建税:</label>
                            <div class="col-sm-2" style="padding-right:5px;">
                                <input type="text" class="form-control ipt_tax required" id="constructionTaxAddModal_invoiceTaxBill_2" name="constructionTax" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="城建税">
                            </div>
                            <span class="col-sm-1" style="padding-left: 0px;line-height: 34px;width:1%;">%</span>
                            <div class="col-sm-5" style="padding-right:5px;">
                                <input type="text" class="form-control ipt_tax_value required" id="constructionTaxValueAddModal_invoiceTaxBill_2" name="constructionTaxValue" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="城建税">
                            </div>
                        </div>
                        <div class="form-group has-feedback">
                            <label for="educationalSurtaxAddModal_invoiceTaxBill_2" class="col-sm-4 control-label">教育费附加:</label>
                            <div class="col-sm-2" style="padding-right:5px;">
                                <input type="text" class="form-control ipt_tax required" id="educationalSurtaxAddModal_invoiceTaxBill_2" name="educationalSurtax" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="教育费附加">
                            </div>
                            <span class="col-sm-1" style="padding-left: 0px;line-height: 34px;width:1%;">%</span>
                            <div class="col-sm-5" style="padding-right:5px;">
                                <input type="text" class="form-control ipt_tax_value required" id="educationalSurtaxValueAddModal_invoiceTaxBill_2" name="educationalSurtaxValue" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="教育费附加">
                            </div>
                        </div>
                        <div class="form-group has-feedback">
                            <label for="areaEducationalSurtaxAddModal_invoiceTaxBill_2" class="col-sm-4 control-label">地方教育附加费:</label>
                            <div class="col-sm-2" style="padding-right:5px;">
                                <input type="text" class="form-control ipt_tax required" id="areaEducationalSurtaxAddModal_invoiceTaxBill_2" name="areaEducationalSurtax" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="地方教育附加费">
                            </div>
                            <span class="col-sm-1" style="padding-left: 0px;line-height: 34px;width:1%;">%</span>
                            <div class="col-sm-5" style="padding-right:5px;">
                                <input type="text" class="form-control ipt_tax_value required" id="areaEducationalSurtaxValueAddModal_invoiceTaxBill_2" name="areaEducationalSurtaxValue" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="地方教育附加费">
                            </div>
                        </div>
                        <div class="form-group has-feedback">
                            <label for="waterBuildTaxAddModal_invoiceTaxBill_2" class="col-sm-4 control-label">水利建设税:</label>
                            <div class="col-sm-2" style="padding-right:5px;">
                                <input type="text" class="form-control ipt_tax" id="waterBuildTaxAddModal_invoiceTaxBill_2" name="waterBuildTax" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="水利建设税">
                            </div>
                            <span class="col-sm-1" style="padding-left: 0px;line-height: 34px;width:1%;">%</span>
                            <div class="col-sm-5" style="padding-right:5px;">
                                <input type="text" class="form-control ipt_tax_value" id="waterBuildTaxValueAddModal_invoiceTaxBill_2" name="waterBuildTaxValue" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="水利建设税">
                            </div>
                        </div>
                        <div class="form-group has-feedback">
                            <label for="corporateIncomeTaxAddModal_invoiceTaxBill_2" class="col-sm-4 control-label">企业所得税:</label>
                            <div class="col-sm-2" style="padding-right:5px;">
                                <input type="text" class="form-control ipt_tax required" id="corporateIncomeTaxAddModal_invoiceTaxBill_2" name="corporateIncomeTax" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="企业所得税">
                            </div>
                            <span class="col-sm-1" style="padding-left: 0px;line-height: 34px;width:1%;">%</span>
                            <div class="col-sm-5" style="padding-right:5px;">
                                <input type="text" class="form-control ipt_tax_value required" id="corporateIncomeTaxValueAddModal_invoiceTaxBill_2" name="corporateIncomeTaxValue" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="企业所得税">
                            </div>
                        </div>
                        <div class="form-group has-feedback">
                            <label for="individualIncomeTaxAddModal_invoiceTaxBill_2" class="col-sm-4 control-label">个人所得税:</label>
                            <div class="col-sm-2" style="padding-right:5px;">
                                <input type="text" class="form-control ipt_tax required" id="individualIncomeTaxAddModal_invoiceTaxBill_2" name="individualIncomeTax" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="个人所得税">
                            </div>
                            <span class="col-sm-1" style="padding-left: 0px;line-height: 34px;width:1%;">%</span>
                            <div class="col-sm-5" style="padding-right:5px;">
                                <input type="text" class="form-control ipt_tax_value required" id="individualIncomeTaxValueAddModal_invoiceTaxBill_2" name="individualIncomeTaxValue" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="个人所得税">
                            </div>
                        </div>
                        <div class="form-group has-feedback">
                            <label for="stampDutyAddModal_invoiceTaxBill_2" class="col-sm-4 control-label">印花税:</label>
                            <div class="col-sm-2" style="padding-right:5px;">
                                <input type="text" class="form-control ipt_tax required" id="stampDutyAddModal_invoiceTaxBill_2" name="stampDuty" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="印花税">
                            </div>
                            <span class="col-sm-1" style="padding-left: 0px;line-height: 34px;width:1%;">%</span>
                            <div class="col-sm-5" style="padding-right:5px;">
                                <input type="text" class="form-control ipt_tax_value required" id="stampDutyValueAddModal_invoiceTaxBill_2" name="stampDutyValue" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="印花税">
                            </div>
                        </div>
                        <div class="form-group has-feedback">
                            <label for="otherTaxAddModal_invoiceTaxBill_2" class="col-sm-4 control-label">其他税:</label>
                            <div class="col-sm-2" style="padding-right:5px;">
                                <input type="text" class="form-control ipt_tax" id="otherTaxAddModal_invoiceTaxBill_2" name="otherTax" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="其他税">
                            </div>
                            <span class="col-sm-1" style="padding-left: 0px;line-height: 34px;width:1%;">%</span>
                            <div class="col-sm-5" style="padding-right:5px;">
                                <input type="text" class="form-control ipt_tax_value" id="otherTaxValueAddModal_invoiceTaxBill_2" name="otherTaxValue" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="其他税">
                            </div>
                        </div>
                    </div>

                    <div id="rightContainer_AddModal" class="form-horizontal" style="float: left; width: 50%;">
                        <div class="form-group has-feedback">
                            <label for="nationalTaxBillNoAddModal_invoiceTaxBill_2" class="col-sm-4 control-label">国税税单号:</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control ipt_content_left required" id="nationalTaxBillNoAddModal_invoiceTaxBill_2" name="nationalTaxBillNo" maxLength="30" autocomplete="off" placeholder="" title="国税税单号">
                            </div>
                        </div>
                        <div class="form-group has-feedback">
                            <label for="landTaxNoAddModal_invoiceTaxBill_2" class="col-sm-4 control-label">地税税单号:</label>
                            <div class="col-sm-8">
                                <textarea class="form-control ipt_content_left required" id="landTaxNoAddModal_invoiceTaxBill_2" name="landTaxNo" autocomplete="off" placeholder="" rows="9" style="resize:none;" title="地税税单号"></textarea>
                            </div>
                        </div>
                        <div class="form-group has-feedback">
                            <label for="taxPeriodAddModal_invoiceTaxBill_2" class="col-sm-4 control-label">税款所属期:</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="taxPeriodAddModal_invoiceTaxBill_2" name="taxPeriod" maxLength="30" autocomplete="off" placeholder="" title="税款所属期">
                            </div>
                        </div>
                        <div class="form-group has-feedback">
                            <label for="remarkAddModal_invoiceTaxBill_2" class="col-sm-4 control-label">备注:</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="remarkAddModal_invoiceTaxBill_2" name="remark" maxLength="30" autocomplete="off" placeholder="" title="备注">
                            </div>
                        </div>
                        <div class="form-group has-feedback">
                            <label for="localSubtotalAddModal_invoiceTaxBill_2" class="col-sm-4 control-label">当地小计:</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control ipt_tax_value required" id="localSubtotalAddModal_invoiceTaxBill_2" name="localSubtotal" maxLength="30" autocomplete="off" placeholder="" title="当地小计">
                            </div>
                        </div>
                    </div>
                    <div style="clear: both;"></div>
                </div>
                <!-- 当地交税 end -->

                <!-- 发票税单 start -->

            </div>
            <div class="modal-footer">
                <button id="addProjectInvoiceModalSubmit" type="button" class="btn btn-primary" data-loading-text="保存&hellip;">保存</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<!-- Edit ProjectInvoice modal dialog -->
<div id="editProjectInvoiceModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" style="width:60%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">发票信息</h4>
            </div>
            <div class="modal-body form-horizontal">
                <div id="invoiceInfoEditModal">
                    <div class="form-group has-feedback">
                        <label for="invoiceNumberEditModal_projectInvoice" class="col-sm-2 control-label">发票号:</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control ipt_content_left required" id="invoiceNumberEditModal_projectInvoice" name="invoiceNumber" maxLength="30" autocomplete="off" placeholder="" title="发票号">
                        </div>
                        <label for="invoiceDateEditModal_projectInvoice" class="col-sm-2 control-label">填开日期:</label>
                        <div class="input-daterange col-md-4" id="invoiceDate_EditModal">
                            <input type="text" class="form-control col-md-12 dateSelect" id="invoiceDateEditModal_projectInvoice" name="invoiceDate" style="border-radius: 4px;" title="填开日期" readonly="readonly"/>
                        </div>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="summaryEditModal_projectInvoice" class="col-sm-2 control-label">摘要:</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control ipt_content_left required" id="summaryEditModal_projectInvoice" name="summary" maxLength="30" autocomplete="off" placeholder="" style="text-align: left;" title="摘要">
                        </div>
                        <label for="taxRateEditModal_projectInvoice" class="col-sm-2 control-label">税率:</label>
                        <div class="col-sm-3" style="width:32%;">
                            <div class="input-group" style="width:98%; float:left;">
                                <div class="input-group-btn">
                                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                        选择税率
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu calcInvoiceTaxSelect" id="calcInvoiceTaxSelectEditModal" data-toggle="taxRateEditModal_projectInvoice">
                                        <li>3</li>
                                        <li>6</li>
                                        <li>11</li>
                                        <li>17</li>
                                    </ul>
                                </div><!-- /btn-group -->
                                <input type="text" class="form-control ipt_tax calcInvoiceTax required" id="taxRateEditModal_projectInvoice" name="taxRate" title="税率" placeholder="输入其他税率">
                            </div><!-- /input-group -->
                            <span class="col-sm-1" style="line-height: 34px;width:5px;padding:0px; float:right;">%</span>
                        </div>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="invoiceAmountEditModal_projectInvoice" class="col-sm-2 control-label">金额:</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control ipt_tax_value calcInvoiceTax required" id="invoiceAmountEditModal_projectInvoice" name="invoiceAmount" maxLength="30" autocomplete="off" placeholder="" title="金额">
                        </div>
                        <label for="taxTotalEditModal_projectInvoice" class="col-sm-2 control-label">税价合计:</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control ipt_tax_value required" id="taxTotalEditModal_projectInvoice" name="taxTotal" maxLength="30" autocomplete="off" placeholder="" title="税价合计">
                        </div>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="taxEditModal_projectInvoice" class="col-sm-2 control-label">税额:</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control ipt_tax_value required" id="taxEditModal_projectInvoice" name="tax" maxLength="30" autocomplete="off" placeholder="" title="税额">
                        </div>
                        <label for="invoiceTypeEditModal_projectInvoice" class="col-sm-2 control-label">发票类型:</label>
                        <div class="col-sm-4">
                            <select id="invoiceTypeEditModal_projectInvoice" class="input-sm col-md-12" title="发票类型" title="发票类型">
                                <option value="1">普通发票</option>
                                <option value="2">专用发票</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="remarkEditModal_projectInvoice" class="col-sm-2 control-label">备注:</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control ipt_content_left" id="remarkEditModal_projectInvoice" name="remark" maxLength="30" autocomplete="off" placeholder="" title="备注">
                        </div>
                        <label for="incomeTaxCalcTypeEditModal_projectInvoice" class="col-sm-2 control-label">所得税:</label>
                        <div class="col-sm-4">
                            <select id="incomeTaxCalcTypeEditModal_projectInvoice" class="input-sm col-md-12 incomeTaxCalcTypeSelect" title="所得税" >
                                <option value="1">按税价计算</option>
                                <option value="2">按金额</option>
                            </select>
                        </div>
                    </div>
                </div>

                <!-- 税单 start -->
                <div id="taxBill_title_EditModal" class="form-group has-feedback" style="margin-bottom: 5px;display: block;">
                    <h4 class="modal-title" style="padding-left: 20px;">税单</h4>
                </div>
                <div id="nonlocal_title_EditModal" class="form-group has-feedback" style="margin-bottom: 5px;display: none;">
                    <ul id="tax_pills_EditModal" class="nav nav-pills" role="tablist" style="display: inline-block;margin-left: 15px;">
                        <li id="shenzhen_tax" role="presentation" class="active">
                            <a href="#">深圳交税</a>
                        </li>
                        <li id="local_tax" role="presentation">
                            <a href="#">当地交税</a>
                        </li>
                    </ul>
                </div>
                <div class="title-line" style="margin-bottom: 10px;"></div>

                <!-- 发票税单 start -->
                <!-- 税单 start -->
                <div id="taxBill_EditModal" style="display: block;">
                    <div class="form-group has-feedback">
                        <label for="addedValueTaxEditModal_invoiceTaxBill" class="col-sm-2 control-label">增值税:</label>
                        <div class="col-sm-1" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax required" id="addedValueTaxEditModal_invoiceTaxBill" name="addedValueTax" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="增值税">
                        </div>
                        <span class="col-sm-1" style="padding-left: 0px;line-height: 34px;width:1px;padding:0px;">%</span>
                        <div class="col-sm-2" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax_value required" id="addedValueTaxValueEditModal_invoiceTaxBill" name="addedValueTaxValue" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="增值税">
                        </div>
                        <label for="constructionTaxEditModal_invoiceTaxBill" class="col-sm-2 control-label">城建税:</label>
                        <div class="col-sm-1" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax required" id="constructionTaxEditModal_invoiceTaxBill" name="constructionTax" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="城建税">
                        </div>
                        <span class="col-sm-1" style="padding-left: 0px;line-height: 34px;width:1px;padding:0px;">%</span>
                        <div class="col-sm-2" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax_value required" id="constructionTaxValueEditModal_invoiceTaxBill" name="constructionTaxValue" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="城建税">
                        </div>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="areaEducationalSurtaxEditModal_invoiceTaxBill" class="col-sm-2 control-label">地方教育附加费:</label>
                        <div class="col-sm-1" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax required" id="areaEducationalSurtaxEditModal_invoiceTaxBill" name="areaEducationalSurtax" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="地方教育附加费">
                        </div>
                        <span class="col-sm-1" style="padding-left: 0px;line-height: 34px;width:1px;padding:0px;">%</span>
                        <div class="col-sm-2" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax_value required" id="areaEducationalSurtaxValueEditModal_invoiceTaxBill" name="areaEducationalSurtaxValue" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="地方教育附加费">
                        </div>
                        <label for="educationalSurtaxEditModal_invoiceTaxBill" class="col-sm-2 control-label">教育费附加:</label>
                        <div class="col-sm-1" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax required" id="educationalSurtaxEditModal_invoiceTaxBill" name="educationalSurtax" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="教育费附加">
                        </div>
                        <span class="col-sm-1" style="padding-left: 0px;line-height: 34px;width:1px;padding:0px;">%</span>
                        <div class="col-sm-2" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax_value required" id="educationalSurtaxValueEditModal_invoiceTaxBill" name="educationalSurtaxValue" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="教育费附加">
                        </div>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="individualIncomeTaxEditModal_invoiceTaxBill" class="col-sm-2 control-label">个人所得税:</label>
                        <div class="col-sm-1" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax required" id="individualIncomeTaxEditModal_invoiceTaxBill" name="individualIncomeTax" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="个人所得税">
                        </div>
                        <span class="col-sm-1" style="padding-left: 0px;line-height: 34px;width:1px;padding:0px;">%</span>
                        <div class="col-sm-2" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax_value required" id="individualIncomeTaxValueEditModal_invoiceTaxBill" name="individualIncomeTaxValue" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="个人所得税">
                        </div>
                        <label for="corporateIncomeTaxEditModal_invoiceTaxBill" class="col-sm-2 control-label">企业所得税:</label>
                        <div class="col-sm-1" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax required" id="corporateIncomeTaxEditModal_invoiceTaxBill" name="corporateIncomeTax" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="企业所得税">
                        </div>
                        <span class="col-sm-1" style="padding-left: 0px;line-height: 34px;width:1px;padding:0px;">%</span>
                        <div class="col-sm-2" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax_value required" id="corporateIncomeTaxValueEditModal_invoiceTaxBill" name="corporateIncomeTaxValue" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="企业所得税">
                        </div>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="otherTaxEditModal_invoiceTaxBill" class="col-sm-2 control-label">其他税:</label>
                        <div class="col-sm-1" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax" id="otherTaxEditModal_invoiceTaxBill" name="otherTax" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="其他税">
                        </div>
                        <span class="col-sm-1" style="padding-left: 0px;line-height: 34px;width:1px;padding:0px;">%</span>
                        <div class="col-sm-2" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax_value" id="otherTaxValueEditModal_invoiceTaxBill" name="otherTaxValue" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="其他税">
                        </div>
                        <label for="stampDutyEditModal_invoiceTaxBill" class="col-sm-2 control-label">印花税:</label>
                        <div class="col-sm-1" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax required" id="stampDutyEditModal_invoiceTaxBill" name="stampDuty" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="印花税">
                        </div>
                        <span class="col-sm-1" style="padding-left: 0px;line-height: 34px;width:1px;padding:0px;">%</span>
                        <div class="col-sm-2" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax_value required" id="stampDutyValueEditModal_invoiceTaxBill" name="stampDutyValue" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="印花税">
                        </div>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="taxPeriodEditModal_invoiceTaxBill" class="col-sm-2 control-label">税款所属期:</label>
                        <div class="col-sm-3" style="width:26%;">
                            <input type="text" class="form-control" id="taxPeriodEditModal_invoiceTaxBill" name="taxPeriod" maxLength="30" autocomplete="off" placeholder="" title="税款所属期">
                        </div>
                        <label for="waterBuildTaxEditModal_invoiceTaxBill" class="col-sm-2 control-label" style="width: 15.7%;">水利建设税:</label>
                        <div class="col-sm-1" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax" id="waterBuildTaxEditModal_invoiceTaxBill" name="waterBuildTax" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="水利建设税">
                        </div>
                        <span class="col-sm-1" style="padding-left: 0px;line-height: 34px;width:1px;padding:0px;">%</span>
                        <div class="col-sm-2" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax_value" id="waterBuildTaxValueEditModal_invoiceTaxBill" name="waterBuildTaxValue" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="水利建设税">
                        </div>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="taxBillTotalEditModal_invoiceTaxBill" class="col-sm-2 control-label">税单合计:</label>
                        <div class="col-sm-3" style="width:26%;">
                            <input type="text" class="form-control required" id="taxBillTotalEditModal_invoiceTaxBill" name="taxBillTotal" maxLength="30" autocomplete="off" placeholder="" title="税单合计">
                        </div>
                        <label for="remarkEditModal_invoiceTaxBill" class="col-sm-2 control-label" style="width: 15.7%;">备注:</label>
                        <div class="col-sm-3" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_content_left" id="remarkEditModal_invoiceTaxBill" name="remark" maxLength="30" autocomplete="off" placeholder="" title="备注">
                        </div>
                    </div>
                </div>
                <!-- 税单 end -->

                <!-- 深圳交税 start -->
                <div id="nonclocal_szlocalTaxEditModal" style="display: none;">
                    <div class="form-group has-feedback">
                        <label for="addedValueTaxEditModal_invoiceTaxBill_1" class="col-sm-2 control-label">增值税:</label>
                        <div class="col-sm-1" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax required" id="addedValueTaxEditModal_invoiceTaxBill_1" name="addedValueTax" maxLength="30" autocomplete="off" placeholder="" style="padding: 0px 8px;" title="增值税">
                        </div>
                        <span class="col-sm-1" style="line-height: 34px;width: 1%;padding: 0px;">%</span>
                        <div class="col-sm-2" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax_value required" id="addedValueTaxValueEditModal_invoiceTaxBill_1" name="addedValueTaxValue" maxLength="30" autocomplete="off" placeholder="" style="padding: 0px 8px;" title="增值税">
                        </div>
                        <label for="educationalSurtaxEditModal_invoiceTaxBill_1" class="col-sm-2 control-label">教育费附加:</label>
                        <div class="col-sm-1" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax required" id="educationalSurtaxEditModal_invoiceTaxBill_1" name="educationalSurtax" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="教育费附加">
                        </div>
                        <span class="col-sm-1" style="line-height: 34px;width: 1%;padding:0px;">%</span>
                        <div class="col-sm-2" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax_value required" id="educationalSurtaxValueEditModal_invoiceTaxBill_1" name="educationalSurtaxValue" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="教育费附加">
                        </div>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="constructionTaxEditModal_invoiceTaxBill_1" class="col-sm-2 control-label">城建税:</label>
                        <div class="col-sm-1" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax required" id="constructionTaxEditModal_invoiceTaxBill_1" name="constructionTax" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="城建税">
                        </div>
                        <span class="col-sm-1" style="line-height: 34px;width: 1%;padding:0px;">%</span>
                        <div class="col-sm-2" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax_value required" id="constructionTaxValueEditModal_invoiceTaxBill_1" name="constructionTaxValue" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="城建税">
                        </div>
                        <label for="corporateIncomeTaxEditModal_invoiceTaxBill_1" class="col-sm-2 control-label">企业所得税:</label>
                        <div class="col-sm-1" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax required" id="corporateIncomeTaxEditModal_invoiceTaxBill_1" name="corporateIncomeTax" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="企业所得税">
                        </div>
                        <span class="col-sm-1" style="line-height: 34px;width: 1%;padding:0px;">%</span>
                        <div class="col-sm-2" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax_value required" id="corporateIncomeTaxValueEditModal_invoiceTaxBill_1" name="corporateIncomeTaxValue" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="企业所得税">
                        </div>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="areaEducationalSurtaxEditModal_invoiceTaxBill_1" class="col-sm-2 control-label">地方教育附加费:</label>
                        <div class="col-sm-1" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax required" id="areaEducationalSurtaxEditModal_invoiceTaxBill_1" name="areaEducationalSurtax" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="地方教育附加费">
                        </div>
                        <span class="col-sm-1" style="line-height: 34px;width: 1%;padding:0px;">%</span>
                        <div class="col-sm-2" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax_value required" id="areaEducationalSurtaxValueEditModal_invoiceTaxBill_1" name="areaEducationalSurtaxValue" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="地方教育附加费">
                        </div>
                        <label for="stampDutyEditModal_invoiceTaxBill_1" class="col-sm-2 control-label">印花税:</label>
                        <div class="col-sm-1" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax required" id="stampDutyEditModal_invoiceTaxBill_1" name="stampDuty" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="印花税">
                        </div>
                        <span class="col-sm-1" style="line-height: 34px;width: 1%;padding:0px;">%</span>
                        <div class="col-sm-2" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax_value required" id="stampDutyValueEditModal_invoiceTaxBill_1" name="stampDutyValue" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="印花税">
                        </div>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="individualIncomeTaxEditModal_invoiceTaxBill_1" class="col-sm-2 control-label">个人所得税:</label>
                        <div class="col-sm-1" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax required" id="individualIncomeTaxEditModal_invoiceTaxBill_1" name="individualIncomeTax" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="个人所得税">
                        </div>
                        <span class="col-sm-1" style="line-height: 34px;width: 1%;padding:0px;">%</span>
                        <div class="col-sm-2" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax_value required" id="individualIncomeTaxValueEditModal_invoiceTaxBill_1" name="individualIncomeTaxValue" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="个人所得税">
                        </div>
                        <label for="otherTaxEditModal_invoiceTaxBill_1" class="col-sm-2 control-label">其他税:</label>
                        <div class="col-sm-1" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax" id="otherTaxEditModal_invoiceTaxBill_1" name="otherTax" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="其他税">
                        </div>
                        <span class="col-sm-1" style="line-height: 34px;width: 1%;padding:0px;">%</span>
                        <div class="col-sm-2" style="padding-right:5px;">
                            <input type="text" class="form-control ipt_tax_value" id="otherTaxValueEditModal_invoiceTaxBill_1" name="otherTaxValue" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="其他税">
                        </div>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="taxPeriodEditModal_invoiceTaxBill_1" class="col-sm-2 control-label">税款所属期:</label>
                        <div class="col-sm-3" style="padding-right:5px;width: 26%;">
                            <input type="text" class="form-control" id="taxPeriodEditModal_invoiceTaxBill_1" name="taxPeriod" maxLength="30" autocomplete="off" placeholder="" title="税款所属期">
                        </div>
                        <label for="szSubtotalEditModal_invoiceTaxBill_1" class="col-sm-2 control-label">深圳小计:</label>
                        <div class="col-sm-3" style="padding-right:5px;width: 26%;">
                            <input type="text" class="form-control ipt_tax_value required" id="szSubtotalEditModal_invoiceTaxBill_1" name="szSubtotal" maxLength="30" autocomplete="off" placeholder="" title="深圳小计">
                        </div>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="waterBuildTaxEditModal_invoiceTaxBill_1" class="col-sm-2 control-label">水利建设税:</label>
                        <div class="col-sm-1" style="padding-right:5px;">
                            <input type="text" class="form-control" id="waterBuildTaxEditModal_invoiceTaxBill_1" name="waterBuildTax" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="水利建设税">
                        </div>
                        <span class="col-sm-1" style="line-height: 34px;width: 1%;padding:0px;">%</span>
                        <div class="col-sm-2" style="padding-right:5px;">
                            <input type="text" class="form-control" id="waterBuildTaxValueEditModal_invoiceTaxBill_1" name="waterBuildTaxValue" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="水利建设税">
                        </div>
                        <label for="taxBillTotalEditModal_invoiceTaxBill_1" class="col-sm-2 control-label">税单合计:</label>
                        <div class="col-sm-3" style="padding-right:5px;width: 26%;">
                            <input type="text" class="form-control ipt_tax_value required" id="taxBillTotalEditModal_invoiceTaxBill_1" name="taxBillTotal" maxLength="30" autocomplete="off" placeholder="" title="税单合计">
                        </div>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="remarkEditModal_invoiceTaxBill_1" class="col-sm-2 control-label">备注:</label>
                        <div class="col-sm-9" style="padding-right:5px;width: 69%">
                            <input type="text" class="form-control ipt_content_left" id="remarkEditModal_invoiceTaxBill_1" name="remark" maxLength="30" autocomplete="off" placeholder="" title="备注">
                        </div>
                        <span class="col-sm-1"></span>
                    </div>
                </div>
                <!-- 深圳交税 end -->

                <!-- 当地交税 start -->
                <div id="nonclocal_localTaxEditModal" style="display: none;">
                    <div id="leftContainer_EditModal" class="form-horizontal" style="float: left; width: 50%;">
                        <div class="form-group has-feedback">
                            <label for="addedValueTaxEditModal_invoiceTaxBill_2" class="col-sm-4 control-label">增值税:</label>
                            <div class="col-sm-2" style="padding-right:5px;">
                                <input type="text" class="form-control ipt_tax required" id="addedValueTaxEditModal_invoiceTaxBill_2" name="addedValueTax" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="增值税">
                            </div>
                            <span class="col-sm-1" style="padding-left: 0px;line-height: 34px;width:1%;">%</span>
                            <div class="col-sm-5" style="padding-right:5px;">
                                <input type="text" class="form-control ipt_tax_value required" id="addedValueTaxValueEditModal_invoiceTaxBill_2" name="addedValueTaxValue" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="增值税">
                            </div>
                        </div>
                        <div class="form-group has-feedback">
                            <label for="constructionTaxEditModal_invoiceTaxBill_2" class="col-sm-4 control-label">城建税:</label>
                            <div class="col-sm-2" style="padding-right:5px;">
                                <input type="text" class="form-control ipt_tax required" id="constructionTaxEditModal_invoiceTaxBill_2" name="constructionTax" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="城建税">
                            </div>
                            <span class="col-sm-1" style="padding-left: 0px;line-height: 34px;width:1%;">%</span>
                            <div class="col-sm-5" style="padding-right:5px;">
                                <input type="text" class="form-control ipt_tax_value required" id="constructionTaxValueEditModal_invoiceTaxBill_2" name="constructionTaxValue" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="城建税">
                            </div>
                        </div>
                        <div class="form-group has-feedback">
                            <label for="educationalSurtaxEditModal_invoiceTaxBill_2" class="col-sm-4 control-label">教育费附加:</label>
                            <div class="col-sm-2" style="padding-right:5px;">
                                <input type="text" class="form-control ipt_tax required" id="educationalSurtaxEditModal_invoiceTaxBill_2" name="educationalSurtax" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="教育费附加">
                            </div>
                            <span class="col-sm-1" style="padding-left: 0px;line-height: 34px;width:1%;">%</span>
                            <div class="col-sm-5" style="padding-right:5px;">
                                <input type="text" class="form-control ipt_tax_value required" id="educationalSurtaxValueEditModal_invoiceTaxBill_2" name="educationalSurtaxValue" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="教育费附加">
                            </div>
                        </div>
                        <div class="form-group has-feedback">
                            <label for="areaEducationalSurtaxEditModal_invoiceTaxBill_2" class="col-sm-4 control-label">地方教育附加费:</label>
                            <div class="col-sm-2" style="padding-right:5px;">
                                <input type="text" class="form-control ipt_tax required" id="areaEducationalSurtaxEditModal_invoiceTaxBill_2" name="areaEducationalSurtax" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="地方教育附加费">
                            </div>
                            <span class="col-sm-1" style="padding-left: 0px;line-height: 34px;width:1%;">%</span>
                            <div class="col-sm-5" style="padding-right:5px;">
                                <input type="text" class="form-control ipt_tax_value required" id="areaEducationalSurtaxValueEditModal_invoiceTaxBill_2" name="areaEducationalSurtaxValue" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="地方教育附加费">
                            </div>
                        </div>
                        <div class="form-group has-feedback">
                            <label for="waterBuildTaxEditModal_invoiceTaxBill_2" class="col-sm-4 control-label">水利建设税:</label>
                            <div class="col-sm-2" style="padding-right:5px;">
                                <input type="text" class="form-control ipt_tax required" id="waterBuildTaxEditModal_invoiceTaxBill_2" name="waterBuildTax" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="水利建设税">
                            </div>
                            <span class="col-sm-1" style="padding-left: 0px;line-height: 34px;width:1%;">%</span>
                            <div class="col-sm-5" style="padding-right:5px;">
                                <input type="text" class="form-control ipt_tax_value required" id="waterBuildTaxValueEditModal_invoiceTaxBill_2" name="waterBuildTaxValue" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="水利建设税">
                            </div>
                        </div>
                        <div class="form-group has-feedback">
                            <label for="corporateIncomeTaxEditModal_invoiceTaxBill_2" class="col-sm-4 control-label">企业所得税:</label>
                            <div class="col-sm-2" style="padding-right:5px;">
                                <input type="text" class="form-control ipt_tax required" id="corporateIncomeTaxEditModal_invoiceTaxBill_2" name="corporateIncomeTax" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="企业所得税">
                            </div>
                            <span class="col-sm-1" style="padding-left: 0px;line-height: 34px;width:1%;">%</span>
                            <div class="col-sm-5" style="padding-right:5px;">
                                <input type="text" class="form-control ipt_tax_value" id="corporateIncomeTaxValueEditModal_invoiceTaxBill_2" name="corporateIncomeTaxValue" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="企业所得税">
                            </div>
                        </div>
                        <div class="form-group has-feedback">
                            <label for="individualIncomeTaxEditModal_invoiceTaxBill_2" class="col-sm-4 control-label">个人所得税:</label>
                            <div class="col-sm-2" style="padding-right:5px;">
                                <input type="text" class="form-control ipt_tax required" id="individualIncomeTaxEditModal_invoiceTaxBill_2" name="individualIncomeTax" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="个人所得税">
                            </div>
                            <span class="col-sm-1" style="padding-left: 0px;line-height: 34px;width:1%;">%</span>
                            <div class="col-sm-5" style="padding-right:5px;">
                                <input type="text" class="form-control ipt_tax_value required" id="individualIncomeTaxValueEditModal_invoiceTaxBill_2" name="individualIncomeTaxValue" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="个人所得税">
                            </div>
                        </div>
                        <div class="form-group has-feedback">
                            <label for="stampDutyEditModal_invoiceTaxBill_2" class="col-sm-4 control-label">印花税:</label>
                            <div class="col-sm-2" style="padding-right:5px;">
                                <input type="text" class="form-control ipt_tax required" id="stampDutyEditModal_invoiceTaxBill_2" name="stampDuty" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="印花税">
                            </div>
                            <span class="col-sm-1" style="padding-left: 0px;line-height: 34px;width:1%;">%</span>
                            <div class="col-sm-5" style="padding-right:5px;">
                                <input type="text" class="form-control ipt_tax_value required" id="stampDutyValueEditModal_invoiceTaxBill_2" name="stampDutyValue" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="印花税">
                            </div>
                        </div>
                        <div class="form-group has-feedback">
                            <label for="otherTaxEditModal_invoiceTaxBill_2" class="col-sm-4 control-label">其他税:</label>
                            <div class="col-sm-2" style="padding-right:5px;">
                                <input type="text" class="form-control ipt_tax" id="otherTaxEditModal_invoiceTaxBill_2" name="otherTax" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="其他税">
                            </div>
                            <span class="col-sm-1" style="padding-left: 0px;line-height: 34px;width:1%;">%</span>
                            <div class="col-sm-5" style="padding-right:5px;">
                                <input type="text" class="form-control ipt_tax_value" id="otherTaxValueEditModal_invoiceTaxBill_2" name="otherTaxValue" maxLength="30" autocomplete="off" placeholder="" style="padding:0px 8px;" title="其他税">
                            </div>
                        </div>
                    </div>

                    <div id="rightContainer_EditModal" class="form-horizontal" style="float: left; width: 50%;">
                        <div class="form-group has-feedback">
                            <label for="nationalTaxBillNoEditModal_invoiceTaxBill_2" class="col-sm-4 control-label">国税税单号:</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control ipt_content_left required" id="nationalTaxBillNoEditModal_invoiceTaxBill_2" name="nationalTaxBillNo" maxLength="30" autocomplete="off" placeholder="" title="国税税单号">
                            </div>
                        </div>
                        <div class="form-group has-feedback">
                            <label for="landTaxNoEditModal_invoiceTaxBill_2" class="col-sm-4 control-label">地税税单号:</label>
                            <div class="col-sm-8">
                                <textarea class="form-control ipt_content_left required" id="landTaxNoEditModal_invoiceTaxBill_2" name="landTaxNo" autocomplete="off" placeholder="" rows="9" style="resize:none;" title="地税税单号"></textarea>
                            </div>
                        </div>
                        <div class="form-group has-feedback">
                            <label for="taxPeriodEditModal_invoiceTaxBill_2" class="col-sm-4 control-label">税款所属期:</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="taxPeriodEditModal_invoiceTaxBill_2" name="taxPeriod" maxLength="30" autocomplete="off" placeholder="" title="税款所属期">
                            </div>
                        </div>
                        <div class="form-group has-feedback">
                            <label for="remarkEditModal_invoiceTaxBill_2" class="col-sm-4 control-label">备注:</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control ipt_content_left" id="remarkEditModal_invoiceTaxBill_2" name="remark" maxLength="30" autocomplete="off" placeholder="" title="备注">
                            </div>
                        </div>
                        <div class="form-group has-feedback">
                            <label for="localSubtotalEditModal_invoiceTaxBill_2" class="col-sm-4 control-label">当地小计:</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control ipt_tax_value required" id="localSubtotalEditModal_invoiceTaxBill_2" name="localSubtotal" maxLength="30" autocomplete="off" placeholder="" title="当地小计">
                            </div>
                        </div>
                    </div>
                    <div style="clear: both;"></div>
                </div>
                <!-- 当地交税 end -->

                <!-- 发票税单 start -->

            </div>
            <div class="modal-footer">
                <button id="editProjectInvoiceModalSubmit" type="button" class="btn btn-primary" data-loading-text="保存&hellip;">保存</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<!-- Remove ProjectInvoice modal dialog -->
<div id="removeProjectInvoiceModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">删除发票信息</h4>
            </div>
            <div class="modal-body form-horizontal">
                <p>确定删除该发票信息？</p>
            </div>
            <div class="modal-footer">
                <button id="removeProjectInvoiceModalSubmit" type="button" class="btn btn-primary" data-loading-text="删除&hellip;">删除</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

