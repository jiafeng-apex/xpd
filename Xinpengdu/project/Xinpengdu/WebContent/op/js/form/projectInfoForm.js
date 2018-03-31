var isFirstLoadMaterialContract = false;
var isFirstLoadLabourServiceFee = false;
var isFirstClickMaterialContract = true;
var isFirstClickLabourServiceFee = true;
var $againInputAmount_obj;
var againInputAmount_originalValue = "";
var isAddBankInfo_global;   // 是否修改了 添加银行信息 标识
var isSaveProjectRate_global = true;   // 是否保存了费率 标识
var isPopAgainInputAmountModal = false;     // 是否弹出了再次输入金额的框
$(document).ready(function () {


    $(".form-horizontal .control-label").each(function () {
        $(this).html($(this).html().replace("：","").replace(":",""));
    });

    // 加载发票同步时间
    //for (var i = 1; i <= 31; i++) {
    //    $("#invoiceSyncDate").append('<option value="' + i + '">' + i + '</option>');
    //}

    // 先获取工程相关的信息
    loadProjectInfo();
    loadProjectOthersInfo();

    if ($("#projectId").val() == "") {
        $("#isFinish").val(2);  // 是否完工，默认为否
        $("#materialContract_project").css("display", "none");
        $("#labourServiceFee_project").css("display", "none");
        $(".databox").css("display", "none");
        $("#projectBasicInfo").css("display", "block");
    }else {
        // 禁用费率输入框
        $(".projectRate_table input").attr("readOnly","true");
        isSaveProjectRate_global = true;    // 修改是否保存费率的标识
    }

    // 返回按钮的点击事件
    //$("#returnPrjectList").click(function () {
    //    window.location.href = baseUrl + '/op/projectInfo/list';
    //});

    // 更新费率按钮的点击事件
    $("#updateProjectRate_info").click(function(){
        if(isSaveProjectRate_global){
            // 启用费率输入框
            $(".projectRate_table input").removeAttr("readOnly");
            isSaveProjectRate_global = false;
        }else{
            // 禁用费率输入框
            $(".projectRate_table input").attr("readOnly","true");
            isSaveProjectRate_global = true;
        }
    });

    // 选项卡
    $("#project_pills li").click(function () {
        var li_index = $(this).index();
        var cla=$(this).attr("class").split(" ");
        window.console.log(cla);
        var className;
        for(var c=0;c<cla.length;c++){
            if(cla[c].startsWith("li_")){
                className = cla[c];
                break;
            }
        }
        window.console.log(className);
        var li_num=className.split("_")[1];

        $(this).siblings('li').removeClass('active');  // 删除其他兄弟元素的样式
        $(this).addClass('active');                    // 添加当前元素的样式

        // 第一个box中添加按钮的显示和隐藏
        var btnObj = $(this).parent().parent().parent().find(".btn_content").find(".btn_" + li_num);
        $(this).parent().parent().parent().find(".btn_content").children().css("display", "none");
        //$('.btn_content').children().css("display", "none");
        //btnObj.siblings('div').css("display", "none");  // 隐藏其他兄弟元素的样式
        btnObj.css("display", "block");
        // 第一个box中tab的显示和隐藏
        var divObj = $(this).parent().parent().parent().find(".tab_content").find(".tab_" + li_num);
        $(this).parent().parent().parent().find(".tab_content").children().css("display", "none");
        //$('.tab_content').children().css("display", "none");
        //divObj.siblings('div').css("display", "none");  // 隐藏其他兄弟元素的样式
        divObj.css("display", "block");

        // 第二个box中显示对应的ul
        var $data_pills_current_ul = $("#data_pills").find("ul").eq(li_index);
        $data_pills_current_ul.siblings('ul').css("display", "none");
        $data_pills_current_ul.css("display", "inline-block");

        // 使第二个box中ul下的li选中第一个
        var $data_pills_current_ul_li = $data_pills_current_ul.find("li").eq(0);

        var isResizeTable = true;
        if (divObj.attr("id") == "project_materialContract") {
            // 材料合同
            loadEasyUITable($('#materialContract_table'), $('#projectId').val(), 'materialContractId');
            // 第一次不需要ResizeTable
            if (isFirstClickMaterialContract) {
                isResizeTable = false;
            }
            isFirstClickMaterialContract = false;
            getMaterialContractStat($('#projectId').val());
            $("#stat_materialContractStat_div").show();
            $("#stat_labourServiceFeeStat_div").hide();
        } else if (divObj.attr("id") == "project_labourServiceFee") {
            // 劳务费
            loadEasyUITable($('#labourServiceFee_table'), $('#projectId').val(), 'labourServiceFeeId');
            // 第一次不需要ResizeTable
            if (isFirstClickLabourServiceFee) {
                isResizeTable = false;
            }
            isFirstClickLabourServiceFee = false;
            getLabourserviceinvoiceStat($('#projectId').val());
            $("#stat_materialContractStat_div").hide();
            $("#stat_labourServiceFeeStat_div").show();
        }else{
            $("#stat_materialContractStat_div").hide();
            $("#stat_labourServiceFeeStat_div").hide();
        }
        changeSecondBoxTab($data_pills_current_ul_li, isResizeTable);

        if($(this).attr("id") == "projectInfo_project"){
            // 刷新工程收费表格
            refreshTable('projectToll');
        }
    });

    $("#data_pills li").click(function () {
        changeSecondBoxTab($(this), true);
    });


    // 设置选择时间初始值 ， 默认一个月
    var signedDate = formatDate(moment(), 'day');
    // 开始与结束日期的id
    $("#signedDate").attr("value", signedDate);

    // 日期
    $(".dateSelect").datetimepicker({
        language: 'zh-CN',
        format: 'yyyy-mm-dd',
        pickerPosition: "bottom-right",
        startView: 2,
        minView: 2,
        todayBtn: 2,
        autoclose: 1
    });
    $(".dateSelect").addClass("ipt_content_left")

    // 保存工程基本信息
    $("#saveProjectInfo_info").click(function () {
        if ($("#projectId").val() == "") {
            addProjectInfo();
        } else {
            editProjectInfo();
        }
    });

    // 添加按钮的切换
    $(".btn_content button").click(function () {
        $(".again_input_H").val("");
        var currentIdName = $(this).attr("id");
        var modalIdName = "add" + currentIdName.split("_")[0].substring(3) + "Modal";
        var $modal = $("#" + modalIdName);
        $('#' + modalIdName + ' input[type=text]').val("");
        // 如果是添加发票，需要根据工程类型来显示(1是本地，2是外地)
        if (currentIdName == "addProjectInvoice_invoice") {
            popInvoiceTypeModal('Add');
        }
        // 添加工程收费
        if (currentIdName == "addProjectToll_toll") {
            if(!isSaveProjectRate_global){  // 需要先保存工程翡冷翠
                alert("请先保存工程费率信息!");
                return;
            }
            $("#balanceAddModal_projectToll").val("0");
            getLatelyTollSummary("Add");    // 获取最近的五个工程收费摘要
            getLocalBankDepositTotal();         // 获取工程汇入金额总和
        }
        // 添加材料支付款 添加材料发票
        if (currentIdName == "addMaterialGeld_toll" || currentIdName == "addMaterialInvoice_invoice") {
            var id = $("#materialContractId").val();
            //console.log(id);
            if(id=="" || id==null || id==0){
                alert("请选择一条材料合同！");
                return;
            }
        }
        // 添加劳务支付款 添加劳务费发票
        if (currentIdName == "addLabourServiceGeld_toll" || currentIdName == "addLabourServiceInvoice_invoice") {
            var id = $("#labourServiceFeeId").val();
            if(id=="" || id==null || id==0){
                alert("请选择一条劳务费！");
                return;
            }
        }
        // 如果是添加银行的按钮, 判断是否能添加银行,能添加时只能添加一条
        if(currentIdName == "addProjectBank_bank") {
            if (isAddBankInfo_global == 1) {
                var data = $('#projectBank_table').datagrid('getData');
                if (data.total >= 1) {
                    alert("只能添加一条银行信息!");
                    return;
                }
            } else {
                alert("不能添加银行信息!若有更新工程基本信息,请先进行保存!");
                return;
            }
        }
        $modal.modal({
            backdrop: 'static'
        });
    });

    //同步发票按钮 点击事件
    $("#syncLabourServiceInvoice_invoice,#syncMaterialInvoice_invoice").click(function () {
        $(".again_input_H").val("");
        var currentIdName = $(this).attr("id");
        var targetModalId="";
        var syncAmount=0;
        var syncTaxAmount=0;
        var syncTaxPriceAmount=0;
        // 同步劳务发票
        var labourServiceInvoiceIds = [];
        if (currentIdName == "syncLabourServiceInvoice_invoice") {
            targetModalId="syncLabourServiceInvoiceModal";

            var checkedItems=[];
            var allItems = $("#labourServiceInvoice_table").datagrid("getRows");
            $.each(allItems, function (index, item) {
                if ($("input:checkbox[name='labourServiceInvoice_ck']")[index].checked == true) {
                    checkedItems.push(item);
                }
            });

            if(checkedItems==null || checkedItems==""){
                alert("请选择要同步劳务发票！");
                return;
            }else {
                $.each(allItems, function (index, item) {
                    labourServiceInvoiceIds.push(item.labourServiceInvoiceId);
                    syncAmount+=parseFloat(formatAmountValue(item.amount, false));
                    syncTaxAmount+=parseFloat(formatAmountValue(item.taxAmount, false));
                    syncTaxPriceAmount+=parseFloat(formatAmountValue(item.taxPriceAmount, false));
                });
                //console.log("labourServiceInvoiceIds："+ labourServiceInvoiceIds.join(";"));
                $("#syncLabourServiceInvoiceIds").val(labourServiceInvoiceIds.join(";"));
            }
        }

        // 同步材料发票
        var materialInvoiceIds = [];
        if (currentIdName == "syncMaterialInvoice_invoice") {
            targetModalId="syncMaterialInvoiceModal";
            var checkedItems=[];
            var allItems = $("#materialInvoice_table").datagrid("getRows");
            $.each(allItems, function (index, item) {
                if ($("input:checkbox[name='materialInvoice_ck']")[index].checked == true) {
                    checkedItems.push(item);
                }
            });

            if(checkedItems==null || checkedItems=="" || checkedItems.length<=0){
                alert("请选择要同步的材料发票！");
            }else{
                $.each(checkedItems, function (index, item) {
                    materialInvoiceIds.push(item.materialInvoiceId);
                    syncAmount += parseFloat(formatAmountValue(item.amount, false));
                    syncTaxAmount += parseFloat(formatAmountValue(item.taxAmount, false));
                    syncTaxPriceAmount += parseFloat(formatAmountValue(item.taxPrice, false));
                });
                console.log("materialInvoiceIds："+ materialInvoiceIds.join(";"));
                $("#syncMaterialInvoiceIds").val(materialInvoiceIds.join(";"));
            }
        }

        var business_Name=$("#business_Name").val();
        if(labourServiceInvoiceIds.length>0 || materialInvoiceIds.length>0 ){
            var d = new Date(),syncDate = '';
            syncDate += d.getFullYear()+'-';
            syncDate += (d.getMonth() + 1)+'-';
            syncDate += d.getDate();

            $("#"+targetModalId).find('p[name="syncDate"]').html(syncDate);
            $("#"+targetModalId).find('p[name="syncAmount"]').html(formatAmountValue(syncAmount,true));
            $("#"+targetModalId).find('p[name="syncTaxAmount"]').html(formatAmountValue(syncTaxAmount,true));
            $("#"+targetModalId).find('p[name="syncTaxPriceAmount"]').html(formatAmountValue(syncTaxPriceAmount,true));
            $("#"+targetModalId).find('input[name="syncRemark"]').val("发票抵扣("+business_Name+" + "+formatAmountValue(syncTaxPriceAmount,true)+")");

            $modal= $("#" + targetModalId);
            $modal.modal({
                backdrop: 'static'
            });
        }
    });


    // 电话号码只能输入数字
    $(".tellPhone_check").keyup(function () {
        this.value = this.value.replace(/[^\d]/g, "");
        if (this.value.length > 11) {
            this.value = this.value.substring(0, 11);
        }
    });

    // 为输入金额项绑定按下按键事件（只能输入数字和小数点）
    $(".amount_keyup_event").keyup(function () {
        clearNoNumOfAlert($("#" + this.id));
    });

    // 为输入金额项绑定失去焦点事件（添加千分号）
    $(".amount_blur_event").blur(function () {
        if (this.value != "") {
            this.value = formatAmountValue(this.value, true);
        }
    });

    // 为输入金额项绑定获得焦点事件(去除千分号)
    $(".amount_focus_event").focus(function () {
        if (this.value != "") {
            this.value = formatAmountValue(this.value, false);
        }
    });

    $("#againInputAmountValue").bind("keypress", function (event) {
        if (event.keyCode == "13") {
            $("#againInputAmountModalSubmit").click();
        }
    });

    // 为每个需要再次确认的金额输入框后添加一个隐藏域，来保存用户输入的内容
    $(".again_input").each(function(){
        var idValue = this.id + "_H";
        var appendStr = '<input type="hidden" class="again_input_H" id="'+idValue+'" value="'+this.value+'" />';
        $(this).after(appendStr);
    });

    $('.again_input').bind('keypress', function (event) {
        if (event.keyCode == "13") {
            againInputAmount($(this));
        }
    });

        // 当模态框对用户可见时触发（将等待 CSS 过渡效果完成）。
    $('#againInputAmountModal').on('shown.bs.modal',function(e){
        $('#againInputAmountValue').focus(); //通过ID找到对应输入框，让其获得焦点
    });

    // 当模态框完全对用户隐藏时触发。
    $('#addProjectTollModal,#editProjectTollModal').on('hidden.bs.modal',function(e){
        $('#againInputAmountModal').modal('hide');  // 关闭再次确认输入金额弹出框
    });

    // 再次输入金额后确认
    $("#againInputAmountModalSubmit").click(function() {
        var amountValue = $("#againInputAmountValue").val();
        if (amountValue != "") {
            console.log("输入值：" + againInputAmount_originalValue + ", 确认值：" + amountValue);
            if (amountValue != againInputAmount_originalValue) {
                $('#againInputAmountModal .againInputAmountDiff').fadeIn();
            } else {
                // 更改备用对象的值
                var idName_H = $againInputAmount_obj.attr("id") + "_H";
                $("#" + idName_H).val(amountValue);

                // 关闭再次确认窗口
                $('#againInputAmountModal').modal('hide');
                isPopAgainInputAmountModal = false;

                // 操作类型，是Add还是Edit
                var operateType = getOperateType($againInputAmount_obj.attr("id"));
                var fieldName = getFieldName($againInputAmount_obj.attr("id"));
                // 如果是汇入需要自动计算
                if (fieldName == "importAmount") {
                    var autoCalcValue = $("#automaticCalculation" + operateType + "Modal_projectToll").val();
                    if (autoCalcValue == 1) {
                        calcTollInfo(operateType); // 自动计算收费信息
                    }
                    calcBalance(operateType);
                }
                // 汇入金额和汇出金额
                // 如果是外地工程,并且添加有银行信息,需要自动计算本地银行存款
                if($("#projectType").val() == 2 && $("#isAddBankInfo").val() == 1 &&  (fieldName == "importAmount" || fieldName == "exportAmount")){
                    calcLocalBankDeposit(operateType);
                }
            }
        } else {
            $('#againInputAmountModal').modal('hide');
            isPopAgainInputAmountModal = false;
            $againInputAmount_obj.focus();
        }
    });

    // 文本框绑定enter按钮
    $("#againInputAmountValue").bind("keypress",function(event){
        if(event.keyCode == "13"){
            $("#againInputAmountModalSubmit").click();
        }
    });

    //组合框 选择事件处理
    $(".input-group-btn li").click(function(){
        var selValue=$(this).html();
        var inputId=$(this).parent().attr("data-toggle");
        $("#"+inputId).val(selValue);
    });

});

// 再次输入金额
function againInputAmount($againInputAmountObj) {
    $("#againInputAmountValue").val("");
    $('#againInputAmountModal .againInputAmountDiff').fadeOut();

    if ($againInputAmountObj.val() != "") {
        // 把值保存到全局变量中
        var amountValue = formatAmountValue($againInputAmountObj.val(), false);
        //获取备用值
        var idName_H = $againInputAmountObj.attr("id") + "_H";
        var idValue_H = $("#" + idName_H).val();
        // 如果备用值和用户输入的值一致，就不再弹出确认输入框
        if (idValue_H == amountValue) {
            return;
        }

        // 把值和对象保存到全局变量中
        $againInputAmount_obj = $againInputAmountObj;
        againInputAmount_originalValue = amountValue;

        $("#againInputAmountTitle").html("请确认" + $againInputAmountObj.attr("title"));
        $('#againInputAmountModal').modal({
            backdrop: 'static'
        });
        isPopAgainInputAmountModal = true;
    }
}

// 第二个box中添加按钮和tab的显示与隐藏
function changeSecondBoxTab($click_li_obj, isResizeTable) {
    $("#stat_projectStat_div").hide();
    $("#stat_invoiceStat_div").hide();

    // 使第二个box中ul下的li选中第一个
    $click_li_obj.siblings('li').removeClass('active');
    $click_li_obj.addClass('active');

    // 获取第二个box中li在data_pills的位置
    var data_pills_li_index = 0;
    $("#data_pills").find('li').each(function (index) {
        if ($(this).attr("id") == $click_li_obj.attr("id")) {
            //data_pills_li_index = index;
            var cla=$click_li_obj.attr("class").split(" ");
            var className;
            for(var c=0;c<cla.length;c++){
                if(cla[c].startsWith("li_")){
                    className = cla[c];
                    break;
                }
            }
            data_pills_li_index=className.split("_")[1];

            if($(this).attr("id")=="projectInfo_toll"){
                $("#stat_projectStat_div").show();
                $("#stat_invoiceStat_div").hide();
            }else if($(this).attr("id")=="projectInfo_invoice"){
                $("#stat_projectStat_div").hide();
                $("#stat_invoiceStat_div").show();
            }else{
                $("#stat_projectStat_div").hide();
                $("#stat_invoiceStat_div").hide();
            }
        }
    });
    // 第二个box中显示对应的添加按钮
    //var $second_box_btn = $("#btn_content").find("div").eq(data_pills_li_index);
    var $second_box_btn = $("#btn_content").find(".btn_"+(data_pills_li_index));
    //$second_box_btn.siblings('div').css("display", "none");
    $('#btn_content').children().css("display", "none");
    $second_box_btn.css("display", "inline");
    // 第二个box中显示对应的tab

    var $second_box_tab = $("#tab_content").find(".tab_"+data_pills_li_index);
    //$second_box_tab.siblings('div').css("display", "none");
    $('#tab_content').children().css("display", "none");
    $second_box_tab.css("display", "block");
    var tableId_name = $second_box_tab.attr("id").split("_")[1] + "_table";

    if (isResizeTable) {
        $("#" + tableId_name).datagrid('resize', {
            width: $second_box_tab.width()
        });
    }

    if($(this).attr("id") == "projectInfo_toll"){
        // 刷新工程收费表格
        refreshTable('projectToll');
    }
}

// 获取工程相关的信息
function loadProjectInfo() {
    var projectId = $('#projectId').val();
    if (projectId == "") {
        return;
    }
    // 工程基本信息
    $.post(baseUrl + '/op/projectInfo/getInfo', {id: projectId}, function (response) {
        $("#pmName").val(response.pmName);
        $("#pmId").val(response.pmId);
        $("#tellPhone").val(response.tellPhone);
        $("#projectType").val(response.projectType);
        $("#projectName").val(response.projectName);
        $("#partyName").val(response.partyName);
        $("#projectAddr").val(response.projectAddr);
        $("#contractAcount").val(response.contractAcount);
        $("#clearingAcount").val(response.clearingAcount);
        $("#isFinish").val(response.isFinish);
        $("#addValueTaxType").val(response.addValueTaxType);
        $("#isAddBankInfo").val(response.isAddBankInfo);
        $("#remarkOne").val(response.remarkOne);
        $("#remarkTwo").val(response.remarkTwo);
        $("#projectRateId").val(response.projectRate.projectRateId);
        $("#manageRate").val(response.projectRate.manageRate);
        $("#warrantyRate").val(response.projectRate.warrantyRate);
        $("#supplementaryBusinessTax").val(response.projectRate.supplementaryBusinessTax);
        $("#corporateIncomeTax").val(response.projectRate.corporateIncomeTax);
        $("#individualIncomeTax").val(response.projectRate.individualIncomeTax);
        $("#stampDutyRate").val(response.projectRate.stampDutyRate);
        $("#otherTaxRate").val(response.projectRate.otherTaxRate);
        $("#vatSalesTax").val(response.projectRate.vatSalesTax);
        $("#cityBuildTax").val(response.projectRate.cityBuildTax);
        $("#localEducationAttached").val(response.projectRate.localEducationAttached);
        $("#educationSurcharge").val(response.projectRate.educationSurcharge);
        $("#waterBuildIncome").val(response.projectRate.waterBuildIncome);
        // 基本信息中显示授权人
        if(response.certigierName != null){
            $("#certigierName").val(response.certigierName);
            $("#accreditEnd").val(response.accreditEnd);
            //$("#certigierName_titleName").css("display", "");
            //$("#certigierName_value").css("display", "");
            //$("#accreditEnd_titleName").css("display", "");
            //$("#accreditEnd_value").css("display", "");
        }
        isAddBankInfo_global = response.isAddBankInfo;
        // 工程收费
        loadEasyUITable($('#projectToll_table'), projectId, 'projectTollId');
        // 工程发票
        loadEasyUITable($('#projectInvoice_table'), projectId, 'invoiceId');

        //判断是否可以转入发票
        if(response.addValueTaxType!="2"){//一般计征 才可以发票转入 其他的 禁用发票转入按钮
            $("#syncMaterialInvoice_invoice").attr('disabled',"true");
            $("#syncLabourServiceInvoice_invoice").attr('disabled',"true");
        }
        $("#data_pills").find("li").eq(0).trigger("click");
    }, 'json');
}

function loadProjectOthersInfo() {

    var projectId = $('#projectId').val();
    if (projectId == "") {
        return;
    }

    // 工程收据
    loadEasyUITable($('#projectReceipt_table'), projectId, 'receiptId');
    // 银行
    loadEasyUITable($('#projectBank_table'), projectId, 'bankId');
    // 外出证
    loadEasyUITable($('#projectEvection_table'), projectId, 'evectionId');
    // 授权人
    loadEasyUITable($('#projectCertigier_table'), projectId, 'certigierId');
    //工程统计信息
    getProjectInfoStat(projectId);
    //工程发票合计
    getInvoiceStat(projectId);
}




function loadEasyUITable($obj, projectId, uniqueId) {
    var tableId = $obj.attr("id");
    $obj.datagrid({
        onBeforeLoad: function (param) {
            param.offset = (param.page - 1) * param.rows;
            param.limit = param.rows;

            var idName = $obj.attr("id");
            if (idName == "materialGeld_table" || idName == "materialInvoice_table") {
                param.materialContractId = $("#materialContractId").val();
            } else if (idName == "labourServiceGeld_table" || idName == "labourServiceInvoice_table") {
                param.labourServiceFeeId = $("#labourServiceFeeId").val();
            }else if (idName == "projectEvectionPostpone_table") {
                param.evectionId =projectId;//该字段到时候传 外出证id
            }else {
                param.projectId = $("#projectId").val();
            }
        },
        onClickRow: function (rowIndex, rowData) {
            if (tableId == "materialContract_table" || tableId == "labourServiceFee_table") {
                var idName = tableId.split("_")[0] + "Id";
                $("#" + idName).val(rowData[uniqueId]);
                $("#pay_Amount_Total").val(rowData["payAmountTotal"]);
                $("#noPay_Amount_Total").val(rowData["noPayAmountTotal"]);
                $("#contract_Amount").val(rowData["contractAmount"]);
                againRefreshTableData(tableId, rowData[uniqueId]);
            }
        },
        onDblClickRow: function (rowIndex, rowData) {
            var isShowEditModal=false;
            if(tableId == "projectToll_table" && hasWritePermission("MODEL_PROJECT_TOLL")) {
                isShowEditModal= true;
            }else if(tableId == "projectInvoice_table" && hasWritePermission("MODEL_PROJECT_INVOICE")) {
                isShowEditModal= true;
            }else if(tableId == "projectReceipt_table" && hasWritePermission("MODEL_PROJECT_RECEIPT")) {
                isShowEditModal= true;
            }else if(tableId == "projectBank_table" && hasWritePermission("MODEL_PROJECT_BANK")) {
                isShowEditModal= true;
            }else if(tableId == "projectEvection_table") {//&& hasWritePermission("MODEL_PROJECT_EVECTION")
                isShowEditModal= true;
            }else if(tableId == "projectCertigier_table" && hasWritePermission("MODEL_PROJECT_CERTIGIER")) {
                isShowEditModal= true;
            }else if(tableId == "materialContract_table" && hasWritePermission("MODEL_PROJECT_MATERIALCONTRACT")) {
                isShowEditModal= true;
            }else if(tableId == "labourServiceFee_table" && hasWritePermission("MODEL_PROJECT_LABOURSERVICEFEE")) {
                isShowEditModal= true;
            }else if(tableId == "materialGeld_table" && hasWritePermission("MODEL_PROJECT_MATERIALGELD")) {
                isShowEditModal= true;
            }else if(tableId == "materialInvoice_table" && hasWritePermission("MODEL_PROJECT_MATERIALINVOICE")) {
                isShowEditModal= true;
            }else if(tableId == "labourServiceGeld_table" && hasWritePermission("MODEL_PROJECT_LABOURSERVICEGELD")) {
                isShowEditModal= true;
            }else if(tableId == "labourServiceInvoice_table" && hasWritePermission("MODEL_PROJECT_LABOURSERVICEINVOICE")) {
                isShowEditModal= true;
            }else if(tableId == "projectEvectionPostpone_table" && hasWritePermission("MODEL_EVECTION_POSTPONE")) {
                isShowEditModal= true;
            }

            if(isShowEditModal) {
                var rowUniqueId = rowData[uniqueId];
                var cuttentTemp = $obj.attr("id").split("_")[0];
                var modalIdName = "edit" + cuttentTemp.substring(0, 1).toUpperCase() + cuttentTemp.substring(1) + "Modal";
                // 如果是编辑发票，需要根据工程类型来显示(1是本地，2是外地)
                if (modalIdName == "editProjectInvoiceModal") {
                    popInvoiceTypeModal('Edit');
                }
                // 编辑工程收费, 需要先保存工程翡冷翠
                if (modalIdName == "editProjectTollModal" && !isSaveProjectRate_global) {
                    alert("请先保存工程费率信息!");
                    return;
                }
                $('#' + modalIdName).modal({
                    backdrop: 'static'
                });
                popEditModal(cuttentTemp, rowUniqueId);
            }
        },
        onLoadSuccess: function (data) {
            if (data.total == 0) {
                $(this).bootstrapTable('removeAll');
            }
            var tableIdName = $obj.attr("id");

            if (tableIdName == "materialInvoice_table" || tableIdName == "labourServiceInvoice_table") {
                if (data.total > 0) {
                    // 把标题行的那个总的复选框不选中
                    $("input[type='checkbox']")[0].checked = false;
                    $("input[type='checkbox']")[0].disabled = false;
                    // 是否禁用标题行的那个总的复选框 , 如果有不能转入或已经转入的就不能进行全选
                    var isDisabledFirstCheckbox = false;
                    $.each(data.rows, function (index, item) {
                        // 初始化复选框为未选中、非禁用状态
                        $("input[type='checkbox']")[index + 1].checked = false;
                        $("input[type='checkbox']")[index + 1].disabled = true;

                        // 如果增值税类型是一般计征,发票类型是专用发票,没有转入的发票才能进行转入
                        if($("#addValueTaxType").val() == 2 && item.invoiceType == 2 && item.externalInvoiceId == undefined){
                            $("input[type='checkbox']")[index+1].disabled = false;
                        }else{
                            isDisabledFirstCheckbox = true;
                        }
                    });
                    if(isDisabledFirstCheckbox){
                        $("input[type='checkbox']")[0].disabled = true;
                    }

                }
            }
            if (tableIdName == "materialContract_table" || tableIdName == "labourServiceFee_table") {
                var objIdName = tableIdName.split("_")[0] + "Id";
                var objIdValue = 0;
                var firstRow;
                if (data.total > 0) {
                    firstRow = data.rows[0];
                    objIdValue = firstRow[objIdName];
                }
                if (tableIdName == "materialContract_table") {
                    isFirstLoadMaterialContract = true;
                    $("#materialContractId").val(objIdValue);
                    if(firstRow != null && firstRow != undefined){
                        $("#pay_Amount_Total").val(firstRow["payAmountTotal"]);
                        $("#noPay_Amount_Total").val(firstRow["noPayAmountTotal"]);
                        $("#contract_Amount").val(firstRow["contractAmount"]);
                        $("#business_Name").val(firstRow["supplierName"]);
                    }
                } else if (tableIdName == "labourServiceFee_table") {
                    isFirstLoadLabourServiceFee = true;
                    $("#labourServiceFeeId").val(objIdValue);
                    if (firstRow != null && firstRow != undefined) {
                        $("#pay_Amount_Total").val(firstRow["payAmountTotal"]);
                        $("#noPay_Amount_Total").val(firstRow["noPayAmountTotal"]);
                        $("#contract_Amount").val(firstRow["contractAmount"]);
                        $("#business_Name").val(firstRow["serviceBusinessName"]);
                    }
                }
                $("#" + objIdName).val(objIdValue);
                againRefreshTableData(tableIdName, objIdValue);
            }

        }
    });
}

// 弹出编辑数据框
function popEditModal(type, id) {
    switch (type) {
        case "projectToll":             // 收费
            getProjectToll(id);
            break;
        case "projectInvoice":          // 发票
            getProjectInvoice(id);
            break;
        case "projectReceipt":          // 收据
            getProjectReceipt(id);
            break;
        case "projectBank":             // 银行
            getProjectBank(id);
            break;
        case "projectEvection":         // 外出证
            getProjectEvection(id);
            break;
        case "projectEvectionPostpone":         // 外出证 延期
            getProjectEvectionPostpone(id);
            break;
        case "projectCertigier":        // 授权人
            getProjectCertigier(id);
            break;
        case "labourServiceFee":        // 劳务费
            getLabourServiceFee(id);
            break;
        case "labourServiceGeld":       // 劳务费支付款
            getLabourServiceGeld(id);
            break;
        case "labourServiceInvoice":    // 劳务费发票
            getLabourServiceInvoice(id);
            break;
        case "materialContract":        // 材料合同
            getMaterialContract(id);
            break;
        case "materialGeld":            // 材料合同支付款
            getMaterialGeld(id);
            break;
        case "materialInvoice":         // 材料合同发票
            getMaterialInvoice(id);
            break;
    }
}

// 刷新表格
function refreshTable(type) {
    var tableIdName = type + "_table";
    var $table = $("#" + tableIdName);
    //$table.bootstrapTable('refresh', {
    //    query: {offset: 0},
    //    url: baseUrl + '/op/' + type + '/list'
    //});
    $table.datagrid('load');
}

function refreshProjectBankTable(){
    refreshTable("projectBank");
}

// 重新刷新材料合同和劳务费
function againRefreshTableData(tableId, idValue) {
    //alert(tableId);
    //console.log("tableId:"+tableId+",idValue:"+idValue);
    if (tableId == "materialContract_table") {
        if (isFirstLoadMaterialContract) {
            // 材料合同支付款
            loadEasyUITable($('#materialGeld_table'), idValue, 'materialGeldId');
            // 材料合同发票
            loadEasyUITable($('#materialInvoice_table'), idValue, 'materialInvoiceId');

            if (idValue != 0) {
                // 默认选择第一行
                $('#materialContract_table').datagrid("selectRow", 0);
              /*  $('#materialContract_table tbody').find("tr").css('background-color', '');
                $('#materialContract_table tbody').find("tr").eq(0).css('background-color', '#FBFEA0');*/
            }
            isFirstLoadMaterialContract = false;
        } else {
            refreshTable('materialGeld');           // 材料合同支付款
            refreshTable('materialInvoice');  // 材料合同发票
        }
    } else if (tableId == "labourServiceFee_table") {
        if (isFirstLoadLabourServiceFee) { // 默认选择第一行
            // 劳务费支付款
            loadEasyUITable($('#labourServiceGeld_table'), idValue, 'labourServiceGeldId');
            // 劳务费发票
            loadEasyUITable($('#labourServiceInvoice_table'), idValue, 'labourServiceInvoiceId');

            if (idValue != 0) {
                // 默认选择第一行
                $('#labourServiceFee_table').datagrid("selectRow", 0);
               /* $('#labourServiceFee_table tbody').find("tr").css('background-color', '');
                $('#labourServiceFee_table tbody').find("tr").eq(0).css('background-color', '#FBFEA0');*/
            }
            isFirstLoadLabourServiceFee = false;
        } else {
            refreshTable('labourServiceGeld');           // 材料合同支付款
            refreshTable('labourServiceInvoice');  // 材料合同发票
        }
    }
}

function addProjectInfo() {
    // 验证表单数据
    if(!projectInfoFormValidate()){
       return;
    }
    $.post(baseUrl + '/op/projectInfo/saveInfo', getProjectInfoParams(), function (response) {
        if (response.result) {
            alert("保存成功");
            window.location.href = baseUrl + '/op/projectInfo/projectInfoForm?projectId=' + response.projectId;
        } else {
            alert("保存失败!");
        }
    }, 'json');
}

function editProjectInfo() {
    // 验证表单数据
    if(!projectInfoFormValidate()){
        return;
    }
    $.post(baseUrl + '/op/projectInfo/updateInfo', getProjectInfoParams(), function (response) {
        if (response.result) {
            alert("保存成功");
            if(!isSaveProjectRate_global){
                // 刷新工程收费列表
                refreshTable('projectToll');
            }
            // 禁用费率输入框
            $(".projectRate_table input").attr("readOnly","true");
            // 修改是否保存费率的标识
            isSaveProjectRate_global = true;
            // 更新是否能添加银行的全局变量
            isAddBankInfo_global = $("#isAddBankInfo").val();
        } else {
            alert("保存失败!");
        }
    }, 'json');
}

// 表单验证
function projectInfoFormValidate() {
    var formInfos = $(".projectbody .required");
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
        // 验证电话号码
        if (idName == "tellPhone") {
            var re = /^1\d{10}$/;
            if (!re.test(iptValue)) {
                alert("请输入11位有效的联系电话!");
                $ipt.focus();
                return false;
            }
        }
    }
    return true;
}


function getProjectInfoParams() {
    return {
        data: JSON.stringify({
            projectId: $("#projectId").val(),
            projectRateId: $("#projectRateId").val(),
            pmName: $("#pmName").val(),
            pmId: $("#pmId").val(),
            tellPhone: $("#tellPhone").val(),
            signedDate: $("#signedDate").val(),
            projectType: $("#projectType").val(),
            projectName: $("#projectName").val(),
            addValueTaxType: $("#addValueTaxType").val(),
            partyName: $("#partyName").val(),
            isAddBankInfo: $("#isAddBankInfo").val(),
            projectAddr: $("#projectAddr").val(),
            contractAcount: $("#contractAcount").val(),
            clearingAcount: $("#clearingAcount").val(),
            isFinish: $("#isFinish").val(),
            certigierInfo: $("#certigierInfo").val(),
            certigierName: $("#certigierName").val(),
            accreditEnd: $("#accreditEnd").val(),
            remarkOne: $("#remarkOne").val(),
            remarkTwo: $("#remarkTwo").val(),
            isSaveProjectRate: isSaveProjectRate_global,
            projectRate: getProjectRateParams()
        })
    };
}

function getProjectRateParams() {
    return JSON.stringify({
        projectId: $("#projectId").val(),
        projectRateId: $("#projectRateId").val(),
        manageRate: $("#manageRate").val(),
        warrantyRate: $("#warrantyRate").val(),
        supplementaryBusinessTax: $("#supplementaryBusinessTax").val(),
        corporateIncomeTax: $("#corporateIncomeTax").val(),
        individualIncomeTax: $("#individualIncomeTax").val(),
        stampDutyRate: $("#stampDutyRate").val(),
        otherTaxRate: $("#otherTaxRate").val(),
        vatSalesTax: $("#vatSalesTax").val(),
        cityBuildTax: $("#cityBuildTax").val(),
        localEducationAttached: $("#localEducationAttached").val(),
        educationSurcharge: $("#educationSurcharge").val(),
        waterBuildIncome: $("#waterBuildIncome").val()
    });
}


// 格式化日期
function formatDate(date, dateType) {
    if (dateType == 'year') {
        return moment(date).format("YYYY");
    } else if (dateType == 'month') {
        return moment(date).format("YYYY-MM");
    } else {
        return moment(date).format("YYYY-MM-DD");
    }
}

// 显示或隐藏表格
function tableAction(obj) {
    var divObj = obj.parent().find(".tab_content");
    var lineObj = obj.parent().find(".title-line");
    if (divObj.css("display") == "block") {
        divObj.css("display", "none");
        lineObj.css("display", "none");
    } else {
        divObj.css("display", "block");
        lineObj.css("display", "block");
    }
}

function showPmList() {
    $("#selectProjectManagerModal").modal({
        backdrop: 'static'
    });
}


//格式化输入的金额，添加/去除千分号,flag=true为添加，否则为去除
function formatAmountValue(amount, flag) {
    if (flag) {
        if (amount == null || amount == "" || amount == undefined) {
            return 0;
        }
        // 使金额保留两位小数
        amount = (Number(amount)).toFixed(2);
        // 格式化输入的金额，比如 50000000格式化后是50,000,000.00
        var amountValue = amount.toString().replace(/(\d{1,3})(?=(\d{3})+(?:$|\.))/g, "$1,").replace(/^(\-)*(\d+)\.(\d\d).*$/, '$1$2.$3');
        return amountValue;
    } else {
        if (amount == "" || amount == undefined) {
            return 0;
        }
        // 把格式化后的金额还原为用户输入的
        if (amount != "") {
            // 如果传入的金额不为空
            // 去掉金额中的逗号
            var amountValue = amount.toString().replace(/,/g, "");
            // 如果金额小数点后边的数大于0，返回原值，否则只返回整数部分
            var points = amountValue.split(".");
            // 如果金额只有整数，没有小数，就返回原值
            if (points.length > 1) {
                var pointValue = points[1];
                if (pointValue > 0) {
                    return amountValue;
                } else {
                    return points[0];
                }
            } else {
                return amountValue;
            }
        }
    }
}


//只能输入数字只能有一个小数点，小数点不能在开头，不能在结尾，第一位允许添加负号
function clearNoNumOfAlert(obj){
    var thisValue = obj.val();
    //得到第一个字符是否为负号
    var t = thisValue.charAt(0);
    //先把非数字的都替换掉，除了数字和.
    thisValue = thisValue.replace(/[^\d.]/g,"");
    //必须保证第一个为数字而不是.
    thisValue = thisValue.replace(/^\./g,"");
    //保证只有出现一个.而没有多个.
    thisValue = thisValue.replace(/\.{2,}/g,".");
    //保证.只出现一次，而不能出现两次以上
    thisValue = thisValue.replace(".","$#$").replace(/\./g,"").replace("$#$",".");
    //如果第一位是负号，则允许添加
    if(t == '-'){
        thisValue = '-'+thisValue;
    }
    obj.val(thisValue);
}

function formatValue(value){
    if (value == "" || value == undefined) {
        return 0;
    }
    var returnValue = parseFloat(value);
    return returnValue;
}


// 为输入金额项绑定按下按键事件（只能输入数字和小数点）
$(".ipt_tax,.ipt_tax_value").keyup(function () {
    clearNoNumOfAlert($(this));
});

// 为输入金额项绑定获得焦点事件(去除千分号)
$(".ipt_tax_value").focus(function () {
    if ($(this).val() != "") {
        $(this).val(formatAmountValue($(this).val(), false));
    }
});

// 为输入金额项绑定失去焦点事件（添加千分号）
$(".ipt_tax_value").blur(function () {
    if ($(this).val() != "") {
        var originalValue = $(this).val();
        $(this).val(formatAmountValue(originalValue, true));

        // 工程发票，如果是税价合计，需要计算税值
        if ($(this).attr("id") == "taxTotalAddModal_projectInvoice") {
            calcTaxValue_invoiceTaxBill(originalValue);
        }
    }
});


// 判断是Add还是Edit
function getOperateType(idName) {
    // 判断是Add还是Edit，并获取所在位置
    var index = idName.indexOf("AddModal");
    var operateType = "Add";
    if (index <= 0) {
        index = idName.indexOf("EditModal");
        operateType = "Edit";
    }
    return operateType;
}

// 获取具体的字段
function getFieldName(idName) {
    // 判断是Add还是Edit，并获取所在位置
    var index = idName.indexOf("AddModal");
    if (index <= 0) {
        index = idName.indexOf("EditModal");
    }
    var fieldName = idName.substring(0, index);
    return fieldName;
}

// 检验手机号码/座机号码
function checkTel(value) {
    var isPhone = /^([0-9]{3,4}-)?[0-9]{7,8}$/;
    var isMob = /^((\+?86)|(\(\+86\)))?(13[012356789][0-9]{8}|15[012356789][0-9]{8}|18[02356789][0-9]{8}|147[0-9]{8}|1349[0-9]{7})$/;
    if (isMob.test(value) || isPhone.test(value)){
        return true;
    }
    else {
        return false;
    }
}