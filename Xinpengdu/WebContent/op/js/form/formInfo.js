// 工程收费
function projectTollTableActionFormatter(value, row) {
    if(hasWritePermission("MODEL_PROJECT_TOLL")) {
        var content = '<div class="actionHolder">';
        if (row.externalGeldId == undefined) {
            content += '<button type="button" class="btn btn-default btn-xs" ' +
                'style="margin-right: 5px;background-color: #286090;color: white;" onClick="openProjectTollRemoveModal(\'' + row.projectTollId + '\',\'projectToll\');">删除</button>';
            content += '</div>';
        }
        return content;
    }
}

function openProjectTollRemoveModal(dataId, dataType) {
    $("#projectTollId_projectToll").val(dataId);
    $("#removeProjectTollModal").modal({
        backdrop: 'static'
    });
}

// 工程发票
function projectInvoiceTableActionFormatter(value, row) {
    if(hasWritePermission("MODEL_PROJECT_INVOICE")) {
        var content = '<div class="actionHolder">';
        if (row.externalInvoiceId == undefined) {
            content += '<button type="button" class="btn btn-default btn-xs" ' +
                'style="margin-right: 5px;background-color: #286090;color: white;" onClick="openProjectInvoiceRemoveModal(\'' + row.invoiceId + '\',\'projectInvoice\');">删除</button>';
            content += '</div>';
        }
        return content;
    }
}

function openProjectInvoiceRemoveModal(dataId, dataType) {
    $("#invoiceId_projectInvoice").val(dataId);
    $("#removeProjectInvoiceModal").modal({
        backdrop: 'static'
    });
}

// 工程收据
function projectReceiptTableActionFormatter(value, row) {
    if(hasWritePermission("MODEL_PROJECT_RECEIPT")) {
        var content = '<div class="actionHolder">';
        content += '<button type="button" class="btn btn-default btn-xs" ' +
            'style="margin-right: 5px;background-color: #286090;color: white;" onClick="openProjectReceiptRemoveModal(\'' + row.receiptId + '\',\'projectReceipt\');">删除</button>';
        content += '</div>';
        return content;
    }
}

function openProjectReceiptRemoveModal(dataId, dataType) {
    $("#receiptId_projectReceipt").val(dataId);
    $("#removeProjectReceiptModal").modal({
        backdrop: 'static'
    });
}

// 银行
function projectBankTableActionFormatter(value, row) {
    if(hasWritePermission("MODEL_PROJECT_BANK")) {
        var content = '<div class="actionHolder">';
        content += '<button type="button" class="btn btn-default btn-xs" ' +
            'style="margin-right: 5px;background-color: #286090;color: white;" onClick="openProjectBankRemoveModal(\'' + row.bankId + '\',\'projectBank\');">删除</button>';
        content += '</div>';
        return content;
    }
}

function openProjectBankRemoveModal(dataId, dataType) {
    $("#bankId_projectBank").val(dataId);
    $("#removeProjectBankModal").modal({
        backdrop: 'static'
    });
}

// 外出证
function projectEvectionTableActionFormatter(value, row) {
    if(hasWritePermission("MODEL_PROJECT_EVECTION")) {
        var content = '<div class="actionHolder">';
        content += '<button type="button" class="btn btn-default btn-xs" ' +
            'style="margin-right: 5px;background-color: #286090;color: white;" onClick="openProjectEvectionRemoveModal(\'' + row.evectionId + '\',\'projectEvection\');">删除</button>';
        content += '</div>';
        return content;
    }
}

function openProjectEvectionRemoveModal(dataId, dataType) {
    $("#evectionId_projectEvection").val(dataId);
    $("#removeProjectEvectionModal").modal({
        backdrop: 'static'
    });
}

// 外出证 延期
function evectionPostponeTableActionFormatter(value, row) {
    if(hasWritePermission("MODEL_EVECTION_POSTPONE")) {
        var content = '<div class="actionHolder">';
        content += '<button type="button" class="btn btn-default btn-xs" ' +
            'style="margin-right: 5px;background-color: #286090;color: white;" onClick="openEvectionPostponeRemoveModal(\'' + row.postponeId + '\',\'evectionPostpone\');">删除</button>';
        content += '</div>';
        return content;
    }
}

function openEvectionPostponeRemoveModal(dataId, dataType) {
    $("#evectionPostponeId_projectEvectionPostpone").val(dataId);
    $("#removeProjectEvectionPostponeModal").modal({
        backdrop: 'static'
    });
}

// 授权人
function projectCertigierTableActionFormatter(value, row) {
    if(hasWritePermission("MODEL_PROJECT_CERTIGIER")) {
        var content = '<div class="actionHolder">';
        content += '<button type="button" class="btn btn-default btn-xs" ' +
            'style="margin-right: 5px;background-color: #286090;color: white;" onClick="openProjectCertigierRemoveModal(\'' + row.certigierId + '\',\'projectCertigier\');">删除</button>';
        content += '</div>';
        return content;
    }
}

function openProjectCertigierRemoveModal(dataId, dataType) {
    $("#certigierId_projectCertigier").val(dataId);
    $("#removeProjectCertigierModal").modal({
        backdrop: 'static'
    });
}

// 材料合同
function materialContractTableActionFormatter(value, row) {
    if(hasWritePermission("MODEL_PROJECT_MATERIALCONTRACT")) {
        var content = '<div class="actionHolder">';
        content += '<button type="button" class="btn btn-default btn-xs" ' +
            'style="margin-right: 5px;background-color: #286090;color: white;" onClick="openMaterialContractRemoveModal(\'' + row.materialContractId + '\',\'materialContract\');">删除</button>';
        content += '</div>';
        return content;
    }
}

function openMaterialContractRemoveModal(dataId, dataType) {
    $("#materialContractId").val(dataId);
    $("#removeMaterialContractModal").modal({
        backdrop: 'static'
    });
}

// 材料支付款
function materialGeldTableActionFormatter(value, row) {
    if(hasWritePermission("MODEL_PROJECT_MATERIALGELD")) {
        var content = '<div class="actionHolder">';
        content += '<button type="button" class="btn btn-default btn-xs" ' +
            'style="margin-right: 5px;background-color: #286090;color: white;" onClick="openMaterialGeldRemoveModal(\'' + row.materialGeldId + '\',\'materialGeld\');">删除</button>';
        content += '</div>';
        return content;
    }
}

function openMaterialGeldRemoveModal(dataId, dataType) {
    $("#materialGeldId_materialGeld").val(dataId);
    $("#removeMaterialGeldModal").modal({
        backdrop: 'static'
    });
}


// 材料发票
function materialInvoiceTableActionFormatter(value, row) {
    if(hasWritePermission("MODEL_PROJECT_MATERIALINVOICE")) {
        var content = '<div class="actionHolder">';
        content += '<button type="button" class="btn btn-default btn-xs" ' +
            'style="margin-right: 5px;background-color: #286090;color: white;" onClick="openMaterialInvoiceRemoveModal(\'' + row.materialInvoiceId + '\',\'materialInvoice\');">删除</button>';
        content += '</div>';
        return content;
    }
}

function openMaterialInvoiceRemoveModal(dataId, dataType) {
    $("#materialInvoiceId_materialInvoice").val(dataId);
    $("#removeMaterialInvoiceModal").modal({
        backdrop: 'static'
    });
}

// 劳务费
function labourServiceFeeTableActionFormatter(value, row) {
    if(hasWritePermission("MODEL_PROJECT_LABOURSERVICEFEE")) {
        var content = '<div class="actionHolder">';
        content += '<button type="button" class="btn btn-default btn-xs" ' +
            'style="margin-right: 5px;background-color: #286090;color: white;" onClick="openLabourServiceFeeRemoveModal(\'' + row.labourServiceFeeId + '\',\'labourServiceFee\');">删除</button>';
        content += '</div>';
        return content;
    }
}

function openLabourServiceFeeRemoveModal(dataId, dataType) {
    $("#labourServiceFeeId").val(dataId);
    $("#removeLabourServiceFeeModal").modal({
        backdrop: 'static'
    });
}

// 劳务支付款
function labourServiceGeldTableActionFormatter(value, row) {
    if(hasWritePermission("MODEL_PROJECT_LABOURSERVICEGELD")) {
        var content = '<div class="actionHolder">';
        content += '<button type="button" class="btn btn-default btn-xs" ' +
            'style="margin-right: 5px;background-color: #286090;color: white;" onClick="openLabourServiceGeldRemoveModal(\'' + row.labourServiceGeldId + '\',\'labourServiceGeld\');">删除</button>';
        content += '</div>';
        return content;
    }
}

function openLabourServiceGeldRemoveModal(dataId, dataType) {
    $("#labourServiceGeldId_labourServiceGeld").val(dataId);
    $("#removeLabourServiceGeldModal").modal({
        backdrop: 'static'
    });
}


// 劳务发票
function labourServiceInvoiceTableActionFormatter(value, row) {
    if(hasWritePermission("MODEL_PROJECT_LABOURSERVICEINVOICE")) {
        var content = '<div class="actionHolder">';
        content += '<button type="button" class="btn btn-default btn-xs" ' +
            'style="margin-right: 5px;background-color: #286090;color: white;" onClick="openLabourServiceInvoiceRemoveModal(\'' + row.labourServiceInvoiceId + '\',\'labourServiceInvoice\');">删除</button>';
        content += '</div>';
        return content;
    }
}

function openLabourServiceInvoiceRemoveModal(dataId, dataType) {
    $("#labourServiceInvoiceId_labourServiceInvoice").val(dataId);
    $("#removeLabourServiceInvoiceModal").modal({
        backdrop: 'static'
    });
}

function invoiceTypeFormatter(value, row){
    if(value=="1"){
        return "普通发票";
    }else if(value=="2"){
        return "专用发票";
    }
}

function isAutoTransferFormatter(value, row){
    if(value=="1"){
        return "是";
    }else if(value=="2"){
        return "否";
    }
}

// 金额为空时,填充为 0
function amountIs0Formatter(value, row) {
    if (value == "") {
        return "0";
    }
    return value;
}

