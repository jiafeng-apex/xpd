$(document).ready(function () {
    $("#addProjectInvoiceModalSubmit").click(function () {
        addProjectInvoice();
    });
    $("#editProjectInvoiceModalSubmit").click(function () {
        editProjectInvoice();
    });
    $("#removeProjectInvoiceModalSubmit").click(function () {
        deleteProjectInvoice();
    });

    $("#tax_pills_AddModal li,#tax_pills_EditModal li").click(function () {
        $(this).siblings('li').removeClass('active');
        $(this).addClass('active');

        var type = 'Add';
        if ($(this).parent().attr("id") != 'tax_pills_AddModal') {
            type = 'Edit';
        }
        var li_index = $(this).index();
        if (li_index == 0) {
            $("#nonclocal_szlocalTax" + type + "Modal").css("display", "block");
            $("#nonclocal_localTax" + type + "Modal").css("display", "none");
        } else {
            $("#nonclocal_szlocalTax" + type + "Modal").css("display", "none");
            $("#nonclocal_localTax" + type + "Modal").css("display", "block");
        }
    });

    // 为输入税率项绑定失去焦点事件（计算税值）
    $("#addProjectInvoiceModal .ipt_tax,#editProjectInvoiceModal .ipt_tax").blur(function () {
        if ($(this).val() != "") {
            // 根据税率计算税值
            calcTaxValueByTax($(this));
        }
    });

    // 发票金额和税率自动计算
    $(".calcInvoiceTax").blur(function(){
        if ($(this).val() != "") {
            var operateType = getOperateType($(this).attr("id"));
            calcInvoiceTax(operateType);
        }
    });

    // 税率选择时的自动计算
    $(".calcInvoiceTaxSelect li").click(function(){
        var operateType = getOperateType($(this).parent().attr("id"));
        calcInvoiceTax(operateType);
    });

    // 所得税改变时进行更新值
    $(".incomeTaxCalcTypeSelect").change(function(){
        var operateType = getOperateType($(this).attr("id"));
        var invoiceAmount = formatAmountValue($("#invoiceAmount" + operateType + "Modal_projectInvoice").val(), false);                   // 金额
        calcTaxValue_invoiceTaxBill(invoiceAmount, operateType);
    });

});

function getProjectInvoice(id) {
    $.post(baseUrl + '/op/projectInvoice/getInfo', {id: id}, function (response) {
        $("#invoiceId_projectInvoice").val(id);
        $("#invoiceNumberEditModal_projectInvoice").val(response.invoiceNumber);
        $("#invoiceDateEditModal_projectInvoice").val(response.invoiceDate);
        $("#summaryEditModal_projectInvoice").val(response.summary);
        $("#taxRateEditModal_projectInvoice").val(response.taxRate);
        $("#invoiceAmountEditModal_projectInvoice").val(response.invoiceAmount);
        $("#taxTotalEditModal_projectInvoice").val(response.taxTotal);
        $("#taxEditModal_projectInvoice").val(response.tax);
        $("#invoiceTypeEditModal_projectInvoice").val(response.invoiceType);
        $("#incomeTaxCalcTypeEditModal_projectInvoice").val(response.incomeTaxCalcType);
        $("#remarkEditModal_projectInvoice").val(response.remark);

        console.log("外部id --- " + response.externalGeldId);
        if(response.externalGeldId != undefined){
            $("#editProjectInvoiceModalSubmit").css("display","none");
            // 如果有外部id，就没有税单信息
            return;
        }else {
            $("#editProjectInvoiceModalSubmit").css("display","inline-block");
        }
        $.each(response.invoiceTaxBill, function (index, element) {
            var tollageType = element.tollageType;
            if (tollageType == 1) {
                $("#invoiceTaxBillId_invoiceTaxBill").val(element.invoiceTaxBillId);
                $("#addedValueTaxEditModal_invoiceTaxBill").val(element.addedValueTax);
                $("#addedValueTaxValueEditModal_invoiceTaxBill").val(element.addedValueTaxValue);
                $("#constructionTaxEditModal_invoiceTaxBill").val(element.constructionTax);
                $("#constructionTaxValueEditModal_invoiceTaxBill").val(element.constructionTaxValue);
                $("#areaEducationalSurtaxEditModal_invoiceTaxBill").val(element.areaEducationalSurtax);
                $("#areaEducationalSurtaxValueEditModal_invoiceTaxBill").val(element.areaEducationalSurtaxValue);
                $("#educationalSurtaxEditModal_invoiceTaxBill").val(element.educationalSurtax);
                $("#educationalSurtaxValueEditModal_invoiceTaxBill").val(element.educationalSurtaxValue);
                $("#individualIncomeTaxEditModal_invoiceTaxBill").val(element.individualIncomeTax);
                $("#individualIncomeTaxValueEditModal_invoiceTaxBill").val(element.individualIncomeTaxValue);
                $("#corporateIncomeTaxEditModal_invoiceTaxBill").val(element.corporateIncomeTax);
                $("#corporateIncomeTaxValueEditModal_invoiceTaxBill").val(element.corporateIncomeTaxValue);
                $("#otherTaxEditModal_invoiceTaxBill").val(element.otherTax);
                $("#otherTaxValueEditModal_invoiceTaxBill").val(element.otherTaxValue);
                $("#stampDutyEditModal_invoiceTaxBill").val(element.stampDuty);
                $("#stampDutyValueEditModal_invoiceTaxBill").val(element.stampDutyValue);
                $("#taxPeriodEditModal_invoiceTaxBill").val(element.taxPeriod);
                $("#waterBuildTaxEditModal_invoiceTaxBill").val(element.waterBuildTax);
                $("#waterBuildTaxValueEditModal_invoiceTaxBill").val(element.waterBuildTaxValue);
                $("#taxBillTotalEditModal_invoiceTaxBill").val(element.taxBillTotal);
                $("#remarkEditModal_invoiceTaxBill").val(element.remark);
            } else if (tollageType == 2) {
                $("#invoiceTaxBillId_invoiceTaxBill_1").val(element.invoiceTaxBillId);
                $("#addedValueTaxEditModal_invoiceTaxBill_1").val(element.addedValueTax);
                $("#addedValueTaxValueEditModal_invoiceTaxBill_1").val(element.addedValueTaxValue);
                $("#educationalSurtaxEditModal_invoiceTaxBill_1").val(element.educationalSurtax);
                $("#educationalSurtaxValueEditModal_invoiceTaxBill_1").val(element.educationalSurtaxValue);
                $("#constructionTaxEditModal_invoiceTaxBill_1").val(element.constructionTax);
                $("#constructionTaxValueEditModal_invoiceTaxBill_1").val(element.constructionTaxValue);
                $("#corporateIncomeTaxEditModal_invoiceTaxBill_1").val(element.corporateIncomeTax);
                $("#corporateIncomeTaxValueEditModal_invoiceTaxBill_1").val(element.corporateIncomeTaxValue);
                $("#areaEducationalSurtaxEditModal_invoiceTaxBill_1").val(element.areaEducationalSurtax);
                $("#areaEducationalSurtaxValueEditModal_invoiceTaxBill_1").val(element.areaEducationalSurtaxValue);
                $("#stampDutyEditModal_invoiceTaxBill_1").val(element.stampDuty);
                $("#stampDutyValueEditModal_invoiceTaxBill_1").val(element.stampDutyValue);
                $("#individualIncomeTaxEditModal_invoiceTaxBill_1").val(element.individualIncomeTax);
                $("#individualIncomeTaxValueEditModal_invoiceTaxBill_1").val(element.individualIncomeTaxValue);
                $("#otherTaxEditModal_invoiceTaxBill_1").val(element.otherTax);
                $("#otherTaxValueEditModal_invoiceTaxBill_1").val(element.otherTaxValue);
                $("#taxPeriodEditModal_invoiceTaxBill_1").val(element.taxPeriod);
                $("#szSubtotalEditModal_invoiceTaxBill_1").val(element.szSubtotal);
                $("#waterBuildTaxEditModal_invoiceTaxBill_1").val(element.waterBuildTax);
                $("#waterBuildTaxValueEditModal_invoiceTaxBill_1").val(element.waterBuildTaxValue);
                $("#taxBillTotalEditModal_invoiceTaxBill_1").val(element.taxBillTotal);
                $("#remarkEditModal_invoiceTaxBill_1").val(element.remark);
            } else if (tollageType == 3) {
                $("#invoiceTaxBillId_invoiceTaxBill_2").val(element.invoiceTaxBillId);
                $("#addedValueTaxEditModal_invoiceTaxBill_2").val(element.addedValueTax);
                $("#addedValueTaxValueEditModal_invoiceTaxBill_2").val(element.addedValueTaxValue);
                $("#constructionTaxEditModal_invoiceTaxBill_2").val(element.constructionTax);
                $("#constructionTaxValueEditModal_invoiceTaxBill_2").val(element.constructionTaxValue);
                $("#educationalSurtaxEditModal_invoiceTaxBill_2").val(element.educationalSurtax);
                $("#educationalSurtaxValueEditModal_invoiceTaxBill_2").val(element.educationalSurtaxValue);
                $("#areaEducationalSurtaxEditModal_invoiceTaxBill_2").val(element.areaEducationalSurtax);
                $("#areaEducationalSurtaxValueEditModal_invoiceTaxBill_2").val(element.areaEducationalSurtaxValue);
                $("#waterBuildTaxEditModal_invoiceTaxBill_2").val(element.waterBuildTax);
                $("#waterBuildTaxValueEditModal_invoiceTaxBill_2").val(element.waterBuildTaxValue);
                $("#corporateIncomeTaxEditModal_invoiceTaxBill_2").val(element.corporateIncomeTax);
                $("#corporateIncomeTaxValueEditModal_invoiceTaxBill_2").val(element.corporateIncomeTaxValue);
                $("#individualIncomeTaxEditModal_invoiceTaxBill_2").val(element.individualIncomeTax);
                $("#individualIncomeTaxValueEditModal_invoiceTaxBill_2").val(element.individualIncomeTaxValue);
                $("#stampDutyEditModal_invoiceTaxBill_2").val(element.stampDuty);
                $("#stampDutyValueEditModal_invoiceTaxBill_2").val(element.stampDutyValue);
                $("#otherTaxEditModal_invoiceTaxBill_2").val(element.otherTax);
                $("#otherTaxValueEditModal_invoiceTaxBill_2").val(element.otherTaxValue);
                $("#nationalTaxBillNoEditModal_invoiceTaxBill_2").val(element.nationalTaxBillNo);
                $("#landTaxNoEditModal_invoiceTaxBill_2").val(element.landTaxNo);
                $("#taxPeriodEditModal_invoiceTaxBill_2").val(element.taxPeriod);
                $("#remarkEditModal_invoiceTaxBill_2").val(element.remark);
                $("#localSubtotalEditModal_invoiceTaxBill_2").val(element.localSubtotal);
            }
        });
    }, 'json');
}

function addProjectInvoice() {
    if (!projectInvoiceFormValidate('Add')) {
        return;
    }
    $.post(baseUrl + '/op/projectInvoice/saveInfo', getProjectInvoiceParams('Add'), function (response) {
        if (response.result) {
            alert("保存成功");
            $("#addProjectInvoiceModal").modal('hide');
            refreshTable('projectInvoice');
        } else {
            alert("保存失败!");
        }
    }, 'json');
}

function editProjectInvoice() {
    if (!projectInvoiceFormValidate('Edit')) {
        return;
    }
    $.post(baseUrl + '/op/projectInvoice/updateInfo', getProjectInvoiceParams('Edit'), function (response) {
        if (response.result) {
            alert("保存成功");
            $("#editProjectInvoiceModal").modal('hide');
            refreshTable('projectInvoice');
        } else {
            alert("保存失败!");
        }
    }, 'json');
}

function getProjectInvoiceParams(op) {
    return {
        data: JSON.stringify({
            projectId: $("#projectId").val(),
            invoiceId: $("#invoiceId_projectInvoice").val(),
            invoiceNumber: $("#invoiceNumber" + op + "Modal_projectInvoice").val(),
            invoiceDate: $("#invoiceDate" + op + "Modal_projectInvoice").val(),
            summary: $("#summary" + op + "Modal_projectInvoice").val(),
            taxRate: $("#taxRate" + op + "Modal_projectInvoice").val(),
            invoiceAmount: $("#invoiceAmount" + op + "Modal_projectInvoice").val(),
            taxTotal: $("#taxTotal" + op + "Modal_projectInvoice").val(),
            tax: $("#tax" + op + "Modal_projectInvoice").val(),
            invoiceType: $("#invoiceType" + op + "Modal_projectInvoice").val(),
            incomeTaxCalcType: $("#incomeTaxCalcType" + op + "Modal_projectInvoice").val(),
            remark: $("#remark" + op + "Modal_projectInvoice").val(),
            invoiceTaxBill: getInvoiceTaxBillParams_local(op),
            invoiceTaxBill_1: getInvoiceTaxBillParams_nonlocal_1(op),
            invoiceTaxBill_2: getInvoiceTaxBillParams_nonlocal_2(op)
        })
    };
}

function getInvoiceTaxBillParams_local(op) {
    if ($("#projectType").val() != 1) {
        return "";
    }
    return JSON.stringify({
        projectId: $("#projectId").val(),
        invoiceId: $("#invoiceId_projectInvoice").val(),
        tollageType: "1",
        invoiceTaxBillId: $("#invoiceTaxBillId_invoiceTaxBill").val(),
        addedValueTax: $("#addedValueTax" + op + "Modal_invoiceTaxBill").val(),
        addedValueTaxValue: $("#addedValueTaxValue" + op + "Modal_invoiceTaxBill").val(),
        constructionTax: $("#constructionTax" + op + "Modal_invoiceTaxBill").val(),
        constructionTaxValue: $("#constructionTaxValue" + op + "Modal_invoiceTaxBill").val(),
        areaEducationalSurtax: $("#areaEducationalSurtax" + op + "Modal_invoiceTaxBill").val(),
        areaEducationalSurtaxValue: $("#areaEducationalSurtaxValue" + op + "Modal_invoiceTaxBill").val(),
        educationalSurtax: $("#educationalSurtax" + op + "Modal_invoiceTaxBill").val(),
        educationalSurtaxValue: $("#educationalSurtaxValue" + op + "Modal_invoiceTaxBill").val(),
        individualIncomeTax: $("#individualIncomeTax" + op + "Modal_invoiceTaxBill").val(),
        individualIncomeTaxValue: $("#individualIncomeTaxValue" + op + "Modal_invoiceTaxBill").val(),
        corporateIncomeTax: $("#corporateIncomeTax" + op + "Modal_invoiceTaxBill").val(),
        corporateIncomeTaxValue: $("#corporateIncomeTaxValue" + op + "Modal_invoiceTaxBill").val(),
        otherTax: $("#otherTax" + op + "Modal_invoiceTaxBill").val(),
        otherTaxValue: $("#otherTaxValue" + op + "Modal_invoiceTaxBill").val(),
        stampDuty: $("#stampDuty" + op + "Modal_invoiceTaxBill").val(),
        stampDutyValue: $("#stampDutyValue" + op + "Modal_invoiceTaxBill").val(),
        taxPeriod: $("#taxPeriod" + op + "Modal_invoiceTaxBill").val(),
        waterBuildTax: $("#waterBuildTax" + op + "Modal_invoiceTaxBill").val(),
        waterBuildTaxValue: $("#waterBuildTaxValue" + op + "Modal_invoiceTaxBill").val(),
        taxBillTotal: $("#taxBillTotal" + op + "Modal_invoiceTaxBill").val(),
        remark: $("#remark" + op + "Modal_invoiceTaxBill").val()
    });
}

function getInvoiceTaxBillParams_nonlocal_1(op) {
    if ($("#projectType").val() != 2) {
        return "";
    }
    return JSON.stringify({
        projectId: $("#projectId").val(),
        invoiceId: $("#invoiceId_projectInvoice").val(),
        tollageType: "2",
        invoiceTaxBillId: $("#invoiceTaxBillId_invoiceTaxBill_1").val(),
        addedValueTax: $("#addedValueTax" + op + "Modal_invoiceTaxBill_1").val(),
        addedValueTaxValue: $("#addedValueTaxValue" + op + "Modal_invoiceTaxBill_1").val(),
        educationalSurtax: $("#educationalSurtax" + op + "Modal_invoiceTaxBill_1").val(),
        educationalSurtaxValue: $("#educationalSurtaxValue" + op + "Modal_invoiceTaxBill_1").val(),
        constructionTax: $("#constructionTax" + op + "Modal_invoiceTaxBill_1").val(),
        constructionTaxValue: $("#constructionTaxValue" + op + "Modal_invoiceTaxBill_1").val(),
        corporateIncomeTax: $("#corporateIncomeTax" + op + "Modal_invoiceTaxBill_1").val(),
        corporateIncomeTaxValue: $("#corporateIncomeTaxValue" + op + "Modal_invoiceTaxBill_1").val(),
        areaEducationalSurtax: $("#areaEducationalSurtax" + op + "Modal_invoiceTaxBill_1").val(),
        areaEducationalSurtaxValue: $("#areaEducationalSurtaxValue" + op + "Modal_invoiceTaxBill_1").val(),
        stampDuty: $("#stampDuty" + op + "Modal_invoiceTaxBill_1").val(),
        stampDutyValue: $("#stampDutyValue" + op + "Modal_invoiceTaxBill_1").val(),
        individualIncomeTax: $("#individualIncomeTax" + op + "Modal_invoiceTaxBill_1").val(),
        individualIncomeTaxValue: $("#individualIncomeTaxValue" + op + "Modal_invoiceTaxBill_1").val(),
        otherTax: $("#otherTax" + op + "Modal_invoiceTaxBill_1").val(),
        otherTaxValue: $("#otherTaxValue" + op + "Modal_invoiceTaxBill_1").val(),
        taxPeriod: $("#taxPeriod" + op + "Modal_invoiceTaxBill_1").val(),
        szSubtotal: $("#szSubtotal" + op + "Modal_invoiceTaxBill_1").val(),
        waterBuildTax: $("#waterBuildTax" + op + "Modal_invoiceTaxBill_1").val(),
        waterBuildTaxValue: $("#waterBuildTaxValue" + op + "Modal_invoiceTaxBill_1").val(),
        taxBillTotal: $("#taxBillTotal" + op + "Modal_invoiceTaxBill_1").val(),
        remark: $("#remark" + op + "Modal_invoiceTaxBill_1").val()
    });
}

function getInvoiceTaxBillParams_nonlocal_2(op) {
    if ($("#projectType").val() != 2) {
        return "";
    }
    return JSON.stringify({
        projectId: $("#projectId").val(),
        invoiceId: $("#invoiceId_projectInvoice").val(),
        tollageType: "3",
        invoiceTaxBillId: $("#invoiceTaxBillId_invoiceTaxBill_2").val(),
        addedValueTax: $("#addedValueTax" + op + "Modal_invoiceTaxBill_2").val(),
        addedValueTaxValue: $("#addedValueTaxValue" + op + "Modal_invoiceTaxBill_2").val(),
        constructionTax: $("#constructionTax" + op + "Modal_invoiceTaxBill_2").val(),
        constructionTaxValue: $("#constructionTaxValue" + op + "Modal_invoiceTaxBill_2").val(),
        educationalSurtax: $("#educationalSurtax" + op + "Modal_invoiceTaxBill_2").val(),
        educationalSurtaxValue: $("#educationalSurtaxValue" + op + "Modal_invoiceTaxBill_2").val(),
        areaEducationalSurtax: $("#areaEducationalSurtax" + op + "Modal_invoiceTaxBill_2").val(),
        areaEducationalSurtaxValue: $("#areaEducationalSurtaxValue" + op + "Modal_invoiceTaxBill_2").val(),
        waterBuildTax: $("#waterBuildTax" + op + "Modal_invoiceTaxBill_2").val(),
        waterBuildTaxValue: $("#waterBuildTaxValue" + op + "Modal_invoiceTaxBill_2").val(),
        corporateIncomeTax: $("#corporateIncomeTax" + op + "Modal_invoiceTaxBill_2").val(),
        corporateIncomeTaxValue: $("#corporateIncomeTaxValue" + op + "Modal_invoiceTaxBill_2").val(),
        individualIncomeTax: $("#individualIncomeTax" + op + "Modal_invoiceTaxBill_2").val(),
        individualIncomeTaxValue: $("#individualIncomeTaxValue" + op + "Modal_invoiceTaxBill_2").val(),
        stampDuty: $("#stampDuty" + op + "Modal_invoiceTaxBill_2").val(),
        stampDutyValue: $("#stampDutyValue" + op + "Modal_invoiceTaxBill_2").val(),
        otherTax: $("#otherTax" + op + "Modal_invoiceTaxBill_2").val(),
        otherTaxValue: $("#otherTaxValue" + op + "Modal_invoiceTaxBill_2").val(),
        nationalTaxBillNo: $("#nationalTaxBillNo" + op + "Modal_invoiceTaxBill_2").val(),
        landTaxNo: $("#landTaxNo" + op + "Modal_invoiceTaxBill_2").val(),
        taxPeriod: $("#taxPeriod" + op + "Modal_invoiceTaxBill_2").val(),
        remark: $("#remark" + op + "Modal_invoiceTaxBill_2").val(),
        localSubtotal: $("#localSubtotal" + op + "Modal_invoiceTaxBill_2").val()
    });
}

function deleteProjectInvoice() {
    var id = $("#invoiceId_projectInvoice").val();
    $.post(baseUrl + '/op/projectInvoice/delete', {id: id}, function (response) {
        if (response.result) {
            alert("删除成功");
            $("#removeProjectInvoiceModal").modal('hide');
            refreshTable('projectInvoice');
        } else {
            alert("删除失败!");
        }
    }, 'json');
}

function isFormatIptData_projectInvoice(objId) {
    var index = objId.indexOf("AddModal");
    if (index <= 0) {
        index = objId.indexOf("EditModal");
    }
    var objField = objId.substring(0, index);

    if (objField == "invoiceNumber" || objField == "invoiceDate" || objField == "summary" || objField == "invoiceType" || objField == "remark") {
        return false;
    }
    return true;
}


// 发票表单验证
function projectInvoiceFormValidate(op) {
    var projectType = $("#projectType").val();
    var formInfos;
    if (projectType == 1) {
        formInfos = $("#invoiceInfo" + op + "Modal .required,#taxBill_" + op + "Modal .required");
    } else {
        formInfos = $("#invoiceInfo" + op + "Modal .required,#nonclocal_szlocalTax" + op + "Modal .required,#nonclocal_localTax" + op + "Modal .required");
    }
    for (var i = 0; i < formInfos.length; i++) {
        //console.log(formInfos[i].id + "---" + formInfos[i].title);
        var idName = formInfos[i].id;
        var titleName = formInfos[i].title;
        var $ipt = $("#" + idName);
        var iptValue = $ipt.val();
        if (iptValue == "") {
            alert("请输入" + titleName + "!");
            $ipt.focus();
            return false;
        }
    }
    return true;
}

// 根据发票金额来计算税率
function calcTaxValue_invoiceTaxBill(invoiceAmount, op) {
    var taxTotal = formatAmountValue($("#taxTotal" + op + "Modal_projectInvoice").val(),false); // 税价合计
    // 工程类型
    var projectType = $("#projectType").val();
    if (projectType == 1) { // 如果是本地工程
        /**
         // 工程发票中，个人所得税、企来所得税、印花税，这三个是以输入金额为基数，其他的都是以增值税为基数
         税单合计=增值税+城建税+地方教育费+教育附加+个人所得+企业所得+其他税+印花税+水利建设税
         */
        // 获取税率
        var addedValueTax = $("#addedValueTax" + op + "Modal_invoiceTaxBill").val();                // 增值税
        var corporateIncomeTax = $("#corporateIncomeTax" + op + "Modal_invoiceTaxBill").val();     // 企业所得税
        var individualIncomeTax = $("#individualIncomeTax" + op + "Modal_invoiceTaxBill").val();    // 个人所得税
        var stampDuty = $("#stampDuty" + op + "Modal_invoiceTaxBill").val();              // 印花税
        var constructionTax = $("#constructionTax" + op + "Modal_invoiceTaxBill").val();   // 城建税
        var educationalSurtax = $("#educationalSurtax" + op + "Modal_invoiceTaxBill").val();   // 教育费附加
        var areaEducationalSurtax = $("#areaEducationalSurtax" + op + "Modal_invoiceTaxBill").val();   // 地方教育附加
        var waterBuildTax = $("#waterBuildTax" + op + "Modal_invoiceTaxBill").val();   // 水利建设税
        var otherTax = $("#otherTax" + op + "Modal_invoiceTaxBill").val();   // 其他税

        // 根据金额来计算
        var addedValueTaxValue = invoiceAmount * addedValueTax / 100;  // 增值税
        $("#addedValueTaxValue" + op + "Modal_invoiceTaxBill").val(formatAmountValue(addedValueTaxValue, true));

        // 印花税根据税价合计来计算
        var stampDutyValue = taxTotal * stampDuty / 100;  // 印花税
        $("#stampDutyValue" + op + "Modal_invoiceTaxBill").val(formatAmountValue(stampDutyValue, true));

        // 所得税计算方式
        var incomeTaxCalcType = $("#incomeTaxCalcType" + op + "Modal_projectInvoice").val();
        var incomeTaxCalcBasic = invoiceAmount;  // 按金额来计算
        if(incomeTaxCalcType == 1){ // 按税价合计来计算
            incomeTaxCalcBasic = taxTotal // 税价合计
        }
        var corporateIncomeTaxValue = incomeTaxCalcBasic * corporateIncomeTax / 100;  // 企业所得税
        $("#corporateIncomeTaxValue" + op + "Modal_invoiceTaxBill").val(formatAmountValue(corporateIncomeTaxValue, true));
        var individualIncomeTaxValue = incomeTaxCalcBasic * individualIncomeTax / 100;  // 个人所得税
        $("#individualIncomeTaxValue" + op + "Modal_invoiceTaxBill").val(formatAmountValue(individualIncomeTaxValue, true));

        // 根据增值税来计算
        var constructionTaxValue = addedValueTaxValue * constructionTax / 100;  // 城建税
        $("#constructionTaxValue" + op + "Modal_invoiceTaxBill").val(formatAmountValue(constructionTaxValue, true));
        var educationalSurtaxValue = addedValueTaxValue * educationalSurtax / 100;  // 教育费附加
        $("#educationalSurtaxValue" + op + "Modal_invoiceTaxBill").val(formatAmountValue(educationalSurtaxValue, true));
        var areaEducationalSurtaxValue = addedValueTaxValue * areaEducationalSurtax / 100;  // 地方教育附加
        $("#areaEducationalSurtaxValue" + op + "Modal_invoiceTaxBill").val(formatAmountValue(areaEducationalSurtaxValue, true));
        var waterBuildTaxValue = addedValueTaxValue * waterBuildTax / 100;  // 水利建设税
        $("#waterBuildTaxValue" + op + "Modal_invoiceTaxBill").val(formatAmountValue(waterBuildTaxValue, true));
        var otherTaxValue = addedValueTaxValue * otherTax / 100;  // 其他税
        $("#otherTaxValue" + op + "Modal_invoiceTaxBill").val(formatAmountValue(otherTaxValue, true));

        // 计算税单
        calcTaxBillTotal_invoiceTaxBill();
    } else {  // 外地工程
        // 获取税率
        var addedValueTax_1 = $("#addedValueTax" + op + "Modal_invoiceTaxBill_1").val();                // 增值税
        var corporateIncomeTax_1 = $("#corporateIncomeTax" + op + "Modal_invoiceTaxBill_1").val();     // 企业所得税
        var individualIncomeTax_1 = $("#individualIncomeTax" + op + "Modal_invoiceTaxBill_1").val();    // 个人所得税
        var stampDuty_1 = $("#stampDuty" + op + "Modal_invoiceTaxBill_1").val();              // 印花税
        var constructionTax_1 = $("#constructionTax" + op + "Modal_invoiceTaxBill_1").val();   // 城建税
        var educationalSurtax_1 = $("#educationalSurtax" + op + "Modal_invoiceTaxBill_1").val();   // 教育费附加
        var areaEducationalSurtax_1 = $("#areaEducationalSurtax" + op + "Modal_invoiceTaxBill_1").val();   // 地方教育附加
        var waterBuildTax_1 = $("#waterBuildTax" + op + "Modal_invoiceTaxBill_1").val();   // 水利建设税
        var otherTax_1 = $("#otherTax" + op + "Modal_invoiceTaxBill_1").val();   // 其他税

        // 根据金额来计算
        var addedValueTaxValue_1 = invoiceAmount * addedValueTax_1 / 100;  // 增值税
        $("#addedValueTaxValue" + op + "Modal_invoiceTaxBill_1").val(formatAmountValue(addedValueTaxValue_1, true));

        // 印花税根据税价合计来计算
        var stampDutyValue_1 = taxTotal * stampDuty_1 / 100;  // 印花税
        $("#stampDutyValue" + op + "Modal_invoiceTaxBill_1").val(formatAmountValue(stampDutyValue_1, true));

        // 所得税计算方式
        var incomeTaxCalcType = $("#incomeTaxCalcType" + op + "Modal_projectInvoice").val();
        var incomeTaxCalcBasic = invoiceAmount;  // 按金额来计算
        if (incomeTaxCalcType == 1) { // 按税价合计来计算
            incomeTaxCalcBasic = formatAmountValue($("#taxTotal" + op + "Modal_projectInvoice").val(), false); // 发票金额
        }
        var corporateIncomeTaxValue_1 = incomeTaxCalcBasic * corporateIncomeTax_1 / 100;  // 企业所得税
        $("#corporateIncomeTaxValue" + op + "Modal_invoiceTaxBill_1").val(formatAmountValue(corporateIncomeTaxValue_1, true));
        var individualIncomeTaxValue_1 = incomeTaxCalcBasic * individualIncomeTax_1 / 100;  // 个人所得税
        $("#individualIncomeTaxValue" + op + "Modal_invoiceTaxBill_1").val(formatAmountValue(individualIncomeTaxValue_1, true));

        // 根据增值税来计算
        var constructionTaxValue_1 = addedValueTaxValue_1 * constructionTax_1 / 100;  // 城建税
        $("#constructionTaxValue" + op + "Modal_invoiceTaxBill_1").val(formatAmountValue(constructionTaxValue_1, true));
        var educationalSurtaxValue_1 = addedValueTaxValue_1 * educationalSurtax_1 / 100;  // 教育费附加
        $("#educationalSurtaxValue" + op + "Modal_invoiceTaxBill_1").val(formatAmountValue(educationalSurtaxValue_1, true));
        var areaEducationalSurtaxValue_1 = addedValueTaxValue_1 * areaEducationalSurtax_1 / 100;  // 地方教育附加
        $("#areaEducationalSurtaxValue" + op + "Modal_invoiceTaxBill_1").val(formatAmountValue(areaEducationalSurtaxValue_1, true));
        var waterBuildTaxValue_1 = addedValueTaxValue_1 * waterBuildTax_1 / 100;  // 水利建设税
        $("#waterBuildTaxValue" + op + "Modal_invoiceTaxBill_1").val(formatAmountValue(waterBuildTaxValue_1, true));
        var otherTaxValue_1 = addedValueTaxValue_1 * otherTax_1 / 100;  // 其他税
        $("#otherTaxValue" + op + "Modal_invoiceTaxBill_1").val(formatAmountValue(otherTaxValue_1, true));


        // 获取税率
        var addedValueTax_2 = $("#addedValueTax" + op + "Modal_invoiceTaxBill_2").val();                // 增值税
        var corporateIncomeTax_2 = $("#corporateIncomeTax" + op + "Modal_invoiceTaxBill_2").val();     // 企业所得税
        var individualIncomeTax_2 = $("#individualIncomeTax" + op + "Modal_invoiceTaxBill_2").val();    // 个人所得税
        var stampDuty_2 = $("#stampDuty" + op + "Modal_invoiceTaxBill_2").val();              // 印花税
        var constructionTax_2 = $("#constructionTax" + op + "Modal_invoiceTaxBill_2").val();   // 城建税
        var educationalSurtax_2 = $("#educationalSurtax" + op + "Modal_invoiceTaxBill_2").val();   // 教育费附加
        var areaEducationalSurtax_2 = $("#areaEducationalSurtax" + op + "Modal_invoiceTaxBill_2").val();   // 地方教育附加
        var waterBuildTax_2 = $("#waterBuildTax" + op + "Modal_invoiceTaxBill_2").val();   // 水利建设税
        var otherTax_2 = $("#otherTax" + op + "Modal_invoiceTaxBill_2").val();   // 其他税

        // 根据税率来计算
        var addedValueTaxValue_2 = invoiceAmount * addedValueTax_2 / 100;  // 增值税
        $("#addedValueTaxValue" + op + "Modal_invoiceTaxBill_2").val(formatAmountValue(addedValueTaxValue_2, true));
        var stampDutyValue_2 = invoiceAmount * stampDuty_2 / 100;  // 印花税
        $("#stampDutyValue" + op + "Modal_invoiceTaxBill_2").val(formatAmountValue(stampDutyValue_2, true));

        // 所得税的计算方式
        var corporateIncomeTaxValue_2 = incomeTaxCalcBasic * corporateIncomeTax_2 / 100;  // 企业所得税
        $("#corporateIncomeTaxValue" + op + "Modal_invoiceTaxBill_2").val(formatAmountValue(corporateIncomeTaxValue_2, true));
        var individualIncomeTaxValue_2 = incomeTaxCalcBasic * individualIncomeTax_2 / 100;  // 个人所得税
        $("#individualIncomeTaxValue" + op + "Modal_invoiceTaxBill_2").val(formatAmountValue(individualIncomeTaxValue_2, true));

        // 根据增值税来计算
        var constructionTaxValue_2 = addedValueTaxValue_2 * constructionTax_2 / 100;  // 城建税
        $("#constructionTaxValue" + op + "Modal_invoiceTaxBill_2").val(formatAmountValue(constructionTaxValue_2, true));
        var educationalSurtaxValue_2 = addedValueTaxValue_2 * educationalSurtax_2 / 100;  // 教育费附加
        $("#educationalSurtaxValue" + op + "Modal_invoiceTaxBill_2").val(formatAmountValue(educationalSurtaxValue_2, true));
        var areaEducationalSurtaxValue_2 = addedValueTaxValue_2 * areaEducationalSurtax_2 / 100;  // 地方教育附加
        $("#areaEducationalSurtaxValue" + op + "Modal_invoiceTaxBill_2").val(formatAmountValue(areaEducationalSurtaxValue_2, true));
        var waterBuildTaxValue_2 = addedValueTaxValue_2 * waterBuildTax_2 / 100;  // 水利建设税
        $("#waterBuildTaxValue" + op + "Modal_invoiceTaxBill_2").val(formatAmountValue(waterBuildTaxValue_2, true));
        var otherTaxValue_2 = addedValueTaxValue_2 * otherTax_2 / 100;  // 其他税
        $("#otherTaxValue" + op + "Modal_invoiceTaxBill_2").val(formatAmountValue(otherTaxValue_2, true));

        // 计算税单
        calcTaxBillTotal_invoiceTaxBill(op, "1");
        calcTaxBillTotal_invoiceTaxBill(op, "2");

    }
}

// 计算税单 (深圳小计,当即小计,税单合计)
function calcTaxBillTotal_invoiceTaxBill(op,type) {
    var op_type = 0;
    if (type != "") {
        op_type = parseInt(type);
        type = "_" + type;
    }
    // 税单合计=增值税+城建税+地方教育费+教育附加+个人所得+企业所得+其他税+印花税+水利建设税
    var addedValueTax = formatAmountValue($("#addedValueTaxValue" + op + "Modal_invoiceTaxBill" + type).val(), false);                   // 增值税
    var constructionTax = formatAmountValue($("#constructionTaxValue" + op + "Modal_invoiceTaxBill" + type).val(), false);               // 城建税
    var educationalSurtax = formatAmountValue($("#educationalSurtaxValue" + op + "Modal_invoiceTaxBill" + type).val(), false);           // 教育费附加
    var areaEducationalSurtax = formatAmountValue($("#areaEducationalSurtaxValue" + op + "Modal_invoiceTaxBill" + type).val(), false);   // 地方教育附加
    var corporateIncomeTax = formatAmountValue($("#corporateIncomeTaxValue" + op + "Modal_invoiceTaxBill" + type).val(), false);         // 企业所得税
    var individualIncomeTax = formatAmountValue($("#individualIncomeTaxValue" + op + "Modal_invoiceTaxBill" + type).val(), false);       // 个人所得税
    var stampDuty = formatAmountValue($("#stampDutyValue" + op + "Modal_invoiceTaxBill" + type).val(), false);                           // 印花税
    var otherTax = formatAmountValue($("#otherTaxValue" + op + "Modal_invoiceTaxBill" + type).val(), false);                             // 其他税
    var waterBuildTax = formatAmountValue($("#waterBuildTaxValue" + op + "Modal_invoiceTaxBill" + type).val(), false);                   // 水利建设税

    var taxBillTotal = formatValue(addedValueTax) + formatValue(constructionTax) + formatValue(educationalSurtax) + formatValue(areaEducationalSurtax)
        + formatValue(corporateIncomeTax) + formatValue(individualIncomeTax) + formatValue(stampDuty) + formatValue(otherTax) + formatValue(waterBuildTax);
    if (op_type == 0) {
        $("#taxBillTotal" + op + "Modal_invoiceTaxBill" + type).val(formatAmountValue(taxBillTotal, true));   // 税单合计
    } else if (op_type == 1) {
        $("#szSubtotal" + op + "Modal_invoiceTaxBill_1").val(formatAmountValue(taxBillTotal, true));               // 深圳小计
    } else if (op_type == 2) {
        $("#localSubtotal" + op + "Modal_invoiceTaxBill_2").val(formatAmountValue(taxBillTotal, true));        // 当地小计
    }
    if(op_type != 0){
        var szSubtotal = formatAmountValue($("#szSubtotal" + op + "Modal_invoiceTaxBill_1").val(), false);         // 深圳小计
        var localSubtotal = formatAmountValue($("#localSubtotal" + op + "Modal_invoiceTaxBill_2").val(), false);   // 当地小计
        var taxBillTotal_1 = formatValue(szSubtotal) + formatValue(localSubtotal);
        $("#taxBillTotal" + op + "Modal_invoiceTaxBill_1").val(formatAmountValue(taxBillTotal_1, true));             // 税单合计
    }

}

function calcTaxValueByTax($taxObj) {
    var taxId = $taxObj.attr("id");
    var opType = "AddModal";   // 操作类型
    // 判断是Add还是Edit，并获取所在位置
    var index = taxId.indexOf("AddModal");
    var operateType = "Add";
    if (index <= 0) {
        opType = "EditModal";
        index = taxId.indexOf("EditModal");
        operateType = "Edit";
    }
    var fieldName = taxId.substring(0, index);
    // value的id名字
    var taxValueId = taxId.substring(0, index) + "Value" + taxId.substring(index);
    console.log(taxValueId);
    var tax = $taxObj.val();   // 税率

    // 工程类型
    var projectType = $("#projectType").val();
    var acountTotal;
    // 工程发票中，个人所得税、企来所得税、印花税，这三个是以输入金额为基数，其他的都是以增值税为基数
    if (fieldName == "addedValueTax" || fieldName == "corporateIncomeTax" || fieldName == "individualIncomeTax" || fieldName == "stampDuty") {
        // 如果是个人所得税和企业所得税，并且是按税价计算，需要获取税价合计的值, 印花税也是按照税价合计来算的
        if(((fieldName == "corporateIncomeTax" || fieldName == "individualIncomeTax") && $("#incomeTaxCalcType" + operateType + "Modal_projectInvoice").val() ==1) || fieldName == "stampDuty"){
            // 税价合计
            var taxTotalIdName = "taxTotal" + opType + "_projectInvoice";   // 税价合计的id
            acountTotal = $("#" + taxTotalIdName).val(); // 税价合计的值
            if (acountTotal == "") {
                alert("请输入税价合计!");
                $("#" + taxTotalIdName).focus();
                return;
            }
        } else {
            // 发票金额
            var invoiceAmountIdName = "invoiceAmount" + opType + "_projectInvoice";   // 发票金额的id
            acountTotal = $("#" + invoiceAmountIdName).val(); // 发票金额的值
            if (acountTotal == "") {
                alert("请输入发票金额!");
                $("#" + invoiceAmountIdName).focus();
                return;
            }
        }
    } else {  // 按增值税来计算
        var addedValueTaxIdName = "addedValueTax" + "Value" + taxId.substring(index);   // 增值税的id
        acountTotal = $("#" + addedValueTaxIdName).val(); // 增值税的值
        if (acountTotal == "") {
            alert("请输入增值税!");
            $("#" + addedValueTaxIdName).focus();
            return;
        }
    }

    var acountTotal_format = formatAmountValue(acountTotal, false);
    var taxValue = acountTotal_format * tax / 100;  // 税值
    $("#" + taxValueId).val(formatAmountValue(taxValue, true));

    // 如果输入的是增值税，需要再重新计算以增值税为基数的税额
    if(fieldName == "addedValueTax"){
        var invoiceAmount = formatAmountValue($("#invoiceAmount" + operateType + "Modal_projectInvoice").val(),false); // 发票金额
        calcTaxValue_invoiceTaxBill(invoiceAmount, operateType);
    }

    // 计算税单合计
    if (projectType == 1) { // 如果是本地工程
        calcTaxBillTotal_invoiceTaxBill(operateType, "");
    } else {  // 外地工程
        calcTaxBillTotal_invoiceTaxBill(operateType, "1");
        calcTaxBillTotal_invoiceTaxBill(operateType, "2");
    }
}

function calcInvoiceTax(op) {
    // 公式，税单里增值税=金额*税率？%，发票税额=金额*税率？%，发票里税价合计=金额+税额
    var invoiceAmount = formatAmountValue($("#invoiceAmount" + op + "Modal_projectInvoice").val(), false);                   // 金额
    var taxRate = $("#taxRate" + op + "Modal_projectInvoice").val();                // 税率
    var tax = formatValue(invoiceAmount) * formatValue(taxRate) / 100;// 税额
    $("#tax" + op + "Modal_projectInvoice").val(formatAmountValue(tax, true)); // 税额
    var taxTotal = formatValue(invoiceAmount) + formatValue(tax); // 税价合计
    $("#taxTotal" + op + "Modal_projectInvoice").val(formatAmountValue(taxTotal, true)); // 税价合计
    calcTaxValue_invoiceTaxBill(invoiceAmount, op);
}




function popInvoiceTypeModal(op) {
    $("#invoiceId_projectInvoice").val(""); // 把发票的id置空

    $("#tax_pills_" + op + "Modal").find('li').eq(0).siblings('li').removeClass('active');
    $("#tax_pills_" + op + "Modal").find('li').eq(0).addClass('active');
    var projectType = $("#projectType").val();
    if (projectType == 1) {
        $("#taxBill_title_" + op + "Modal").css("display", "block");
        $("#nonlocal_title_" + op + "Modal").css("display", "none");

        $("#taxBill_" + op + "Modal").css("display", "block");
        $("#nonclocal_szlocalTax" + op + "Modal").css("display", "none");
        $("#nonclocal_localTax" + op + "Modal").css("display", "none");
    } else {
        $("#taxBill_title_" + op + "Modal").css("display", "none");
        $("#nonlocal_title_" + op + "Modal").css("display", "block");

        $("#taxBill_" + op + "Modal").css("display", "none");
        $("#nonclocal_szlocalTax" + op + "Modal").css("display", "block");
        $("#nonclocal_localTax" + op + "Modal").css("display", "none");
    }
    // 设置发票税率的默认值(在同一工程里面，添加第二张发票的实施调用第一条发票的税率值)
    setDefaultValue_invoiceTaxBill();
}

// 设置默认费率
function setDefaultValue_invoiceTaxBill() {
    $.post(baseUrl + '/op/projectInvoice/getNewInfo', {projectId: $("#projectId").val()}, function (response) {
        if(!response.result){
            return;
        }
        $.each(response.invoiceTaxBill, function (index, element) {
            var tollageType = element.tollageType;
            if (tollageType == 1) {
                $("#addedValueTaxAddModal_invoiceTaxBill").val(element.addedValueTax);
                $("#constructionTaxAddModal_invoiceTaxBill").val(element.constructionTax);
                $("#areaEducationalSurtaxAddModal_invoiceTaxBill").val(element.areaEducationalSurtax);
                $("#educationalSurtaxAddModal_invoiceTaxBill").val(element.educationalSurtax);
                $("#individualIncomeTaxAddModal_invoiceTaxBill").val(element.individualIncomeTax);
                $("#corporateIncomeTaxAddModal_invoiceTaxBill").val(element.corporateIncomeTax);
                $("#otherTaxAddModal_invoiceTaxBill").val(element.otherTax);
                $("#stampDutyAddModal_invoiceTaxBill").val(element.stampDuty);
                $("#waterBuildTaxAddModal_invoiceTaxBill").val(element.waterBuildTax);
            } else if (tollageType == 2) {
                $("#addedValueTaxAddModal_invoiceTaxBill_1").val(element.addedValueTax);
                $("#educationalSurtaxAddModal_invoiceTaxBill_1").val(element.educationalSurtax);
                $("#constructionTaxAddModal_invoiceTaxBill_1").val(element.constructionTax);
                $("#corporateIncomeTaxAddModal_invoiceTaxBill_1").val(element.corporateIncomeTax);
                $("#areaEducationalSurtaxAddModal_invoiceTaxBill_1").val(element.areaEducationalSurtax);
                $("#stampDutyAddModal_invoiceTaxBill_1").val(element.stampDuty);
                $("#individualIncomeTaxAddModal_invoiceTaxBill_1").val(element.individualIncomeTax);
                $("#otherTaxAddModal_invoiceTaxBill_1").val(element.otherTax);
                $("#waterBuildTaxAddModal_invoiceTaxBill_1").val(element.waterBuildTax);
            } else if (tollageType == 3) {
                $("#addedValueTaxAddModal_invoiceTaxBill_2").val(element.addedValueTax);
                $("#constructionTaxAddModal_invoiceTaxBill_2").val(element.constructionTax);
                $("#educationalSurtaxAddModal_invoiceTaxBill_2").val(element.educationalSurtax);
                $("#areaEducationalSurtaxAddModal_invoiceTaxBill_2").val(element.areaEducationalSurtax);
                $("#waterBuildTaxAddModal_invoiceTaxBill_2").val(element.waterBuildTax);
                $("#corporateIncomeTaxAddModal_invoiceTaxBill_2").val(element.corporateIncomeTax);
                $("#individualIncomeTaxAddModal_invoiceTaxBill_2").val(element.individualIncomeTax);
                $("#stampDutyAddModal_invoiceTaxBill_2").val(element.stampDuty);
                $("#otherTaxAddModal_invoiceTaxBill_2").val(element.otherTax);
            }
        });
    }, 'json');
}
