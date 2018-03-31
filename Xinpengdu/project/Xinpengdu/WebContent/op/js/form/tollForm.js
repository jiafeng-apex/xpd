// 文字分散对齐   text-align: justify;text-align-last: justify;

var localBankDeposit_global = 0; // 之前的当地银行存款总和
$(document).ready(function () {

    $("#addProjectTollModalSubmit").click(function () {
        addProjectToll();
    });
    $("#editProjectTollModalSubmit").click(function () {
        editProjectToll();
    });
    $("#removeProjectTollModalSubmit").click(function () {
        deleteProjectToll();
    });

    // 选择摘要下拉列表中的数据赋值给摘要文本框（摘要可选可输，下拉框和文本框混合显示的）
    $(".summarySelect_toll").change(function () {
        var idName = $(this).attr("id");
        // 判断是Add还是Edit，并获取所在位置
        var index = idName.indexOf("AddModal");
        if (index <= 0) {
            index = idName.indexOf("EditModal");
        }
        var summaryIdName = "summary" + idName.substring(index);
        $("#" + summaryIdName).val($(this).val());
    });

    //绑定自动计算
    $("#addProjectTollModal .autoCalc,#editProjectTollModal .autoCalc").bind('input propertychange', function () {
        // 如果输入值不为空
        if ($(this).value == "") {
            return;
        }
        var thisId = $(this).attr("id");

        var opType = "AddModal";   // 操作类型
        var operateType = "Add";
        // 判断是Add还是Edit，并获取所在位置
        var index = thisId.indexOf("AddModal");
        if (index <= 0) {
            opType = "EditModal";
            operateType = "Edit";
            index = thisId.indexOf("EditModal");
        }
        var fieldName = thisId.substring(0, index);

        // 自动计算余额 （汇回公司款不参与自动计算余额，但如果是外地工程，需要自动计算当地银行存款）
        if ($("#automaticCalculation" + opType + "_projectToll").val() == "1" && fieldName != "companyFunds") {
            calcBalance(operateType);
        }
        // 工程类型
        var projectType = $("#projectType").val();
        // 如果工程类型为外地工程(2)，并且输入项是汇入金额/汇出金额/汇回公司款，就自动计算当地银行存款
        if (projectType == 2 && fieldName == "companyFunds") {
            calcLocalBankDeposit(operateType);
        }

    });


    // 选择自动计算
    $(".automaticCalculationToll").change(function () {
        var thisId = $(this).attr("id");
        var opType = "AddModal";   // 操作类型
        var operateType = "Add";
        // 判断是Add还是Edit，并获取所在位置
        var index = thisId.indexOf("AddModal");
        if (index <= 0) {
            opType = "EditModal";
            operateType = "Edit";
            index = thisId.indexOf("EditModal");
        }

        // 如果选择是，就进行自动计算余额
        if ($(this).val() == "1") {
            if ($("#importAmount" + opType + "_projectToll").val() != "") {
                calcTollInfo(operateType);   //计算收费信息
                calcBalance(operateType);    //计算余额
            }
        }
    });

    // 为输入金额项绑定按下按键事件（只能输入数字和小数点）
    $("input[id$='Modal_projectToll']").keyup(function () {
        if (isFormatIptData_projectToll($(this).attr("id"))) {
            clearNoNumOfAlert($(this));
        }
    });

    // 为输入金额项绑定获得焦点事件(去除千分号)
    $("input[id$='Modal_projectToll']").focus(function () {
        if ($(this).val() != "" && isFormatIptData_projectToll($(this).attr("id"))) {
            console.log("focus: " + $(this).val());
            $(this).val(formatAmountValue($(this).val(), false));
        }
    });

    // 为输入金额项绑定失去焦点事件（添加千分号）
    $("input[id$='Modal_projectToll']").blur(function () {
        if ($(this).val() != "" && isFormatIptData_projectToll($(this).attr("id"))) {
            console.log("blur: " + $(this).val());
            $(this).val(formatAmountValue($(this).val(), true));
            // 如果是汇入金额、汇出金额，需要再次确认输入的值
            var idName = $(this).attr("id");

            var index = idName.indexOf("AddModal");
            var operateType = "Add";
            if (index <= 0) {
                operateType = "Edit";
                index = idName.indexOf("EditModal");
            }
            var objField = idName.substring(0, index);
            if (objField == "importAmount" || objField == "exportAmount") {
                 // 再次输入金额
                againInputAmount($(this));
            }
        }
    });

});

function getProjectToll(id) {
    $.post(baseUrl + '/op/projectToll/getInfo', {id: id}, function (response) {
        $("#projectTollId_projectToll").val(response.projectTollId);
        $("#projectRateId_projectToll").val(response.projectRateId);

        $("#projectTollDateEditModal_projectToll").val(response.projectTollDate);
        $("#automaticCalculationEditModal_projectToll").val(response.automaticCalculation);
        $("#summaryEditModal_projectToll").val(response.summary);
        $("#importAmountEditModal_projectToll").val(response.importAmount);
        $("#exportAmountEditModal_projectToll").val(response.exportAmount);
        $("#importAmountEditModal_projectToll_H").val(formatAmountValue(response.importAmount, false));
        $("#exportAmountEditModal_projectToll_H").val(formatAmountValue(response.exportAmount, false));
        $("#materialGeldEditModal_projectToll").val(response.materialGeld);
        $("#labourServiceFeeEditModal_projectToll").val(response.labourServiceFee);
        $("#manageCostEditModal_projectToll").val(response.manageCost);
        $("#warrantyAmountEditModal_projectToll").val(response.warrantyAmount);
        $("#backWarrantyAmountEditModal_projectToll").val(response.backWarrantyAmount);
        $("#otherAmountEditModal_projectToll").val(response.otherAmount);
        $("#vatSalesTaxEditModal_projectToll").val(response.vatSalesTax);
        $("#vatIncomeTaxEditModal_projectToll").val(response.vatIncomeTax);
        $("#cityBuildTaxEditModal_projectToll").val(response.cityBuildTax);
        $("#educationSurchargeEditModal_projectToll").val(response.educationSurcharge);
        $("#localEducationAttachedEditModal_projectToll").val(response.localEducationAttached);
        $("#stampDutyEditModal_projectToll").val(response.stampDuty);
        $("#individualIncomeTaxEditModal_projectToll").val(response.individualIncomeTax);
        $("#corporateIncomeTaxEditModal_projectToll").val(response.corporateIncomeTax);
        $("#waterBuildIncomeEditModal_projectToll").val(response.waterBuildIncome);
        $("#otherTaxEditModal_projectToll").val(response.otherTax);
        $("#supplementaryBusinessTaxEditModal_projectToll").val(response.supplementaryBusinessTax);
        $("#interestEditModal_projectToll").val(response.interest);
        $("#companyFundsEditModal_projectToll").val(response.companyFunds);
        $("#localBankDepositEditModal_projectToll").val(response.localBankDeposit);
        $("#localBankDepositBakEditModal_projectToll").val(response.localBankDepositBak);
        $("#balanceEditModal_projectToll").val(response.balance);
        $("#balanceBakEditModal_projectToll").val(response.balanceBak);
        console.log("外部id --- " + response.externalGeldId);
        if(response.externalGeldId != "" && response.externalGeldId != undefined  && response.externalGeldId != "undefined"){
            $("#editProjectTollModalSubmit").css("display","none");
        }else {
            $("#editProjectTollModalSubmit").css("display","inline-block");
        }
        getLatelyTollSummary("Edit");   // 获取最近的五个工程收费摘要
        getLocalBankDepositTotal();     // 获取汇入前当地银行存款
    }, 'json');
}

function addProjectToll() {
    // 判断是否有二次确认款弹出
    if(isPopAgainInputAmountModal){
        return;
    }
    // 如果是自动计算余额,再进行计算自动继续计算
    if ($("#automaticCalculationAddModal_projectToll").val() == "1") {
        if ($("#importAmountAdd_projectToll").val() != "") {
            //calcTollInfo('Add');   //计算收费信息
            calcBalance('Add');    //计算余额
        }
    }
    if (!projectTollFormValidate('Add')) {
        return;
    }
    $.post(baseUrl + '/op/projectToll/saveInfo', getProjectTollParams('Add'), function (response) {
        if (response.result) {
            alert("保存成功");
            $("#addProjectTollModal").modal('hide');
            refreshTable('projectToll');
        } else {
            alert("保存失败!");
        }
    }, 'json');
}

function editProjectToll() {
    if(isPopAgainInputAmountModal){
        return;
    }
    // 如果是自动计算余额,再进行计算自动继续计算
    if ($("#automaticCalculationEditModal_projectToll").val() == "1") {
        if ($("#importAmountAdd_projectToll").val() != "") {
            //calcTollInfo('Edit');   //计算收费信息
            calcBalance('Edit');    //计算余额
        }
    }
    if (!projectTollFormValidate('Edit')) {
        return;
    }
    $.post(baseUrl + '/op/projectToll/updateInfo', getProjectTollParams('Edit'), function (response) {
        if (response.result) {
            alert("保存成功");
            $("#editProjectTollModal").modal('hide');
            refreshTable('projectToll');
        } else {
            alert("保存失败!");
        }
    }, 'json');
}

function getProjectTollParams(op) {
    calcBalance(op);
    return {
        data: JSON.stringify({
            projectId: $("#projectId").val(),
            projectTollId: $("#projectTollId_projectToll").val(),
            projectRateId: $("#projectRateId_projectToll").val(),

            projectTollDate: $("#projectTollDate" + op + "Modal_projectToll").val(),
            automaticCalculation: $("#automaticCalculation" + op + "Modal_projectToll").val(),
            summary: $("#summary" + op + "Modal_projectToll").val(),
            importAmount: $("#importAmount" + op + "Modal_projectToll").val(),
            exportAmount: $("#exportAmount" + op + "Modal_projectToll").val(),
            materialGeld: $("#materialGeld" + op + "Modal_projectToll").val(),
            labourServiceFee: $("#labourServiceFee" + op + "Modal_projectToll").val(),
            manageCost: $("#manageCost" + op + "Modal_projectToll").val(),
            warrantyAmount: $("#warrantyAmount" + op + "Modal_projectToll").val(),
            backWarrantyAmount: $("#backWarrantyAmount" + op + "Modal_projectToll").val(),
            otherAmount: $("#otherAmount" + op + "Modal_projectToll").val(),
            vatSalesTax: $("#vatSalesTax" + op + "Modal_projectToll").val(),
            vatIncomeTax: $("#vatIncomeTax" + op + "Modal_projectToll").val(),
            cityBuildTax: $("#cityBuildTax" + op + "Modal_projectToll").val(),
            educationSurcharge: $("#educationSurcharge" + op + "Modal_projectToll").val(),
            localEducationAttached: $("#localEducationAttached" + op + "Modal_projectToll").val(),
            stampDuty: $("#stampDuty" + op + "Modal_projectToll").val(),
            individualIncomeTax: $("#individualIncomeTax" + op + "Modal_projectToll").val(),
            corporateIncomeTax: $("#corporateIncomeTax" + op + "Modal_projectToll").val(),
            waterBuildIncome: $("#waterBuildIncome" + op + "Modal_projectToll").val(),
            otherTax: $("#otherTax" + op + "Modal_projectToll").val(),
            supplementaryBusinessTax: $("#supplementaryBusinessTax" + op + "Modal_projectToll").val(),
            interest: $("#interest" + op + "Modal_projectToll").val(),
            companyFunds: $("#companyFunds" + op + "Modal_projectToll").val(),
            localBankDeposit: $("#localBankDeposit" + op + "Modal_projectToll").val(),
            localBankDepositBak: $("#localBankDepositBak" + op + "Modal_projectToll").val(),
            balance: $("#balance" + op + "Modal_projectToll").val(),
            balanceBak: $("#balanceBak" + op + "Modal_projectToll").val()
        })
    };
}

function deleteProjectToll() {
    var id = $("#projectTollId_projectToll").val();
    $.post(baseUrl + '/op/projectToll/delete', {id: id}, function (response) {
        if (response.result) {
            alert("删除成功");
            $("#removeProjectTollModal").modal('hide');
            refreshTable('projectToll');
        } else {
            alert("删除失败!");
        }
    }, 'json');
}

// 自动计算当地银行存款(根据传入的值来计算)
function calcLocalBankDeposit(op) {
    // 当地银行存款=汇入前当地银行存款+汇入金额-汇出金额-汇回公司款
    //var localBankDeposit = convertValue("localBankDeposit" + op + "Modal_projectToll");     // 当地银行存款
    var importAmount = convertValue("importAmount" + op + "Modal_projectToll");             // 汇入金额
    var exportAmount = convertValue("exportAmount" + op + "Modal_projectToll");             // 汇出金额
    var companyFunds = convertValue("companyFunds" + op + "Modal_projectToll");             // 汇回公司款
    var lbdValue = localBankDeposit_global + importAmount - exportAmount - companyFunds;
    var lbdBakValue = importAmount - exportAmount - companyFunds;
    $("#localBankDeposit" + op + "Modal_projectToll").val(formatAmountValue(lbdValue, true));
    $("#localBankDepositBak" + op + "Modal_projectToll").val(formatAmountValue(lbdBakValue, true));
}


// 自动计算管理费、扣营业税及附加税、扣个人所得税、扣企业所得税、扣印花税、扣利息、扣其他款、质保金
function calcTollInfo(op) {
    var suffixText = op + "Modal_projectToll";

    var corporateIncomeTax = $("#corporateIncomeTax").val();                // 企业所得税
    var individualIncomeTax = $("#individualIncomeTax").val();              // 个人所得税
    var manageRate = $("#manageRate").val();                                // 管理费率
    var warrantyRate = $("#warrantyRate").val();                            // 质保金额
    var vatSalesTax = $("#vatSalesTax").val();                              // 增值税销项税
    var stampDutyRate = $("#stampDutyRate").val();                          // 印花税税率
    var cityBuildTax = $("#cityBuildTax").val();                            // 城市维建税
    var localEducationAttached = $("#localEducationAttached").val();        // 地方教育附加
    var educationSurcharge = $("#educationSurcharge").val();                // 教育费附加
    var waterBuildIncome = $("#waterBuildIncome").val();                    // 水利建设收入
    var otherTaxRate = $("#otherTaxRate").val();                            // 其他税税率
    var supplementaryBusinessTax = $("#supplementaryBusinessTax").val();    // 营业税及附加

    // 增值税销项税，管理费，质保金，企业所得税，个人所得税，印花税，营业税及附加 这7个是按照汇入金额
    // 城市维建税，地方教育附加，教育费附加，水利建设收入，其他税率 这5个是按照增值税销项税为基数
    $("#vatSalesTax" + suffixText).val(calcTollRate(vatSalesTax, op));                                              // 增值税销项税
    $("#manageCost" + suffixText).val(calcTollRate(manageRate, op));                                                // 扣管理费
    $("#warrantyAmount" + suffixText).val(calcTollRate(warrantyRate, op));                                          // 扣质保金
    $("#corporateIncomeTax" + suffixText).val(calcTollRate(corporateIncomeTax, op));                                // 扣企业所得税
    $("#individualIncomeTax" + suffixText).val(calcTollRate(individualIncomeTax, op));                              // 扣个人所得税
    $("#stampDuty" + suffixText).val(calcTollRate(stampDutyRate, op));                                              // 扣印花税
    $("#supplementaryBusinessTax" + suffixText).val(calcTollRate(supplementaryBusinessTax, op));                    // 扣营业税及附加税

    $("#cityBuildTax" + suffixText).val(calcTollRate4vatSalesTax(cityBuildTax, op));                                // 城市维护建设税
    $("#localEducationAttached" + suffixText).val(calcTollRate4vatSalesTax(localEducationAttached, op));            // 地方教育附加
    $("#educationSurcharge" + suffixText).val(calcTollRate4vatSalesTax(educationSurcharge, op));                    // 教育费附加
    $("#waterBuildIncome" + suffixText).val(calcTollRate4vatSalesTax(waterBuildIncome, op));                        // 水利建设专项收入
    $("#otherTax" + suffixText).val(calcTollRate4vatSalesTax(otherTaxRate, op));                                    // 其他税

}

// 计算汇入金额*各自的费率
function calcTollRate(rate, op) {
    var importAmount = formatAmountValue($("#importAmount" + op + "Modal_projectToll").val(), false);
    if (rate != undefined) {
        return formatAmountValue(importAmount * rate / 100, true);
    }
    return "";
}

// 计算增值税销项税*各自的费率
function calcTollRate4vatSalesTax(rate, op) {
    var vatSalesTax = formatAmountValue($("#vatSalesTax" + op + "Modal_projectToll").val(), false);
    if (rate != undefined) {
        return formatAmountValue(vatSalesTax * rate / 100, true);
    }
    return "";
}

// 计算增值进项税*各自的费率
function calcTollRate4vatIncomeTax(rate, op) {
    var vatIncomeTax = formatAmountValue($("#vatIncomeTax" + op + "Modal_projectToll").val(), false);
    if (rate != undefined) {
        return formatAmountValue(vatIncomeTax * rate / 100, true);
    }
    return "";
}

// 自动计算余额
function calcBalance(op) {
    var suffixText = op + "Modal_projectToll";
    var importAmount = convertValue("importAmount" + suffixText);                           // 汇入金额
    var exportAmount = convertValue("exportAmount" + suffixText);                           // 汇出金额
    var materialGeld = convertValue("materialGeld" + suffixText);                           // 材料费
    var labourServiceFee = convertValue("labourServiceFee" + suffixText);                   // 劳务费
    var vatSalesTax = convertValue("vatSalesTax" + suffixText);                             // 增值税销项税
    var vatIncomeTax = convertValue("vatIncomeTax" + suffixText);                           // 增值税进项税
    var cityBuildTax = convertValue("cityBuildTax" + suffixText);                           // 城市维护建设税
    var educationSurcharge = convertValue("educationSurcharge" + suffixText);               // 教育费附加
    var localEducationAttached = convertValue("localEducationAttached" + suffixText);       // 地方教育附加
    var waterBuildIncome = convertValue("waterBuildIncome" + suffixText);                   // 水利建设专项收入
    var otherTax = convertValue("otherTax" + suffixText);                                   // 其他税
    var warrantyAmount = convertValue("warrantyAmount" + suffixText);                       // 扣质保金
    var manageCost = convertValue("manageCost" + suffixText);                               // 管理费
    var supplementaryBusinessTax = convertValue("supplementaryBusinessTax" + suffixText);   // 扣营业税及附加税
    var individualIncomeTax = convertValue("individualIncomeTax" + suffixText);             // 扣个人所得税
    var corporateIncomeTax = convertValue("corporateIncomeTax" + suffixText);               // 扣企业所得税
    var stampDuty = convertValue("stampDuty" + suffixText);                                 // 扣印花税
    var interest = convertValue("interest" + suffixText);                                   // 扣利息
    var otherAmount = convertValue("otherAmount" + suffixText);                             // 扣其他款
    var backWarrantyAmount = convertValue("backWarrantyAmount" + suffixText);               // 已退质保金
    // 本行余额= 汇入金额 - 汇出金额 - (材料费+劳务费+扣质保金+扣管理费+ 扣营业税及附加税 + 扣个人所得税+ 扣企业所得税 + 扣印花税+ 扣利息+扣其他款+增值税销项税-增值税进项税+城市维护建设税+教育费附加+地方教育附加+水利建设专项收入+其他税)+ 已退质保金
    var balanceBak = importAmount - exportAmount - materialGeld - labourServiceFee - warrantyAmount - manageCost - supplementaryBusinessTax - individualIncomeTax -
        corporateIncomeTax - stampDuty - interest - otherAmount - vatSalesTax + vatIncomeTax - cityBuildTax - educationSurcharge - localEducationAttached -
        waterBuildIncome - otherTax + backWarrantyAmount;
    balanceBak = balanceBak.toFixed(2);
    $("#balanceBak" + suffixText).val(formatAmountValue(balanceBak, true));
}

// 转换金额值
function convertValue(idName) {
    return parseFloat($("#" + idName).val() != "" ? $("#" + idName).val().replace(/,/g, "") : 0);
}

// 表单验证（工程收费中的项都不是必填项）
function projectTollFormValidate(op) {
    var $projectTollDate = $("#projectTollDate" + op + "Modal_projectToll");
    if ($projectTollDate.val() == "") {
        alert("请选择日期!");
        $projectTollDate.focus();
        return false;
    }
    var $summary = $("#summary" + op + "Modal_projectToll");
    if ($summary.val() == "") {
        alert("请输入摘要!");
        $summary.focus();
        return false;
    }
    return true;
}

function isFormatIptData_projectToll(objId) {
    var index = objId.indexOf("AddModal");
    if (index <= 0) {
        index = objId.indexOf("EditModal");
    }
    var objField = objId.substring(0, index);
    if (objField == "projectTollDate" || objField == "summary") {
        return false;
    }
    return true;
}

// 获取最近的摘要
function getLatelyTollSummary(op) {
    $.post(baseUrl + '/op/projectToll/getLatelyTollSummary', function (response) {
        $("#summarySelect" + op + "Modal_projectToll").empty();
        $("#summarySelect" + op + "Modal_projectToll").append('<option value="">请选择摘要</option>');
        $.each(response.latelySummary, function (index, element) {
            $("#summarySelect" + op + "Modal_projectToll").append('<option value="' + element + '">' + element + '</option>');
        });
    }, 'json');
}

// 获取汇入前当地银行存款
function getLocalBankDepositTotal() {
    var data = $('#projectBank_table').datagrid('getData');
    if (data.total > 1) {
        // 获取第二行数据
        var rowData = data.rows[1];
        localBankDeposit_global = rowData.localBankDeposit;
        console.log("本地银行总和:" + rowData.localBankDeposit);
    }
}

