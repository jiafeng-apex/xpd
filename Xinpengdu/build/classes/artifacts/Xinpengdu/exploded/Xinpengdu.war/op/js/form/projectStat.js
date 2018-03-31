// 工程统计信息
function getProjectInfoStat(projectId) {
    $.post(baseUrl + '/op/projectInfo/getProjectInfoStat', {projectId: projectId}, function (response) {
        $("#pmTotalAmount").html(formatAmountValue(response.pmTotalAmount,true));
        $("#supplementaryBusinessTaxStat").html(formatAmountValue(response.supplementaryBusinessTaxStat,true));
        $("#manageRateStat").html(formatAmountValue(response.manageRateStat,true));
        $("#otherTaxRateStat").html(formatAmountValue(response.otherTaxRateStat,true));
        $("#projectTotalBalance").html(formatAmountValue(response.projectTotalBalance,true));
        $("#corporateIncomeTaxStat").html(formatAmountValue(response.corporateIncomeTaxStat,true));
        $("#warrantyRateStat").html(formatAmountValue(response.warrantyRateStat,true));
        $("#invoiceAmountStat").html(formatAmountValue(response.invoiceAmountStat,true));
        $("#importAmountStat").html(formatAmountValue(response.importAmountStat,true));
        $("#stampDutyRateStat").html(formatAmountValue(response.stampDutyRateStat,true));
        $("#backWarrantyAmountStat").html(formatAmountValue(response.backWarrantyAmountStat,true));
        $("#taxStat").html(formatAmountValue(response.taxStat,true));
        $("#exportAmountStat").html(formatAmountValue(response.exportAmountStat,true));
        $("#individualIncomeTaxStat").html(formatAmountValue(response.individualIncomeTaxStat,true));
        $("#interestStat").html(formatAmountValue(response.interestStat,true));
        $("#receiptAmountStat").html(formatAmountValue(response.receiptAmountStat,true));
        $("#companyFundsStat").html(formatAmountValue(response.companyFundsStat,true));
        $("#localBankDepositStat").html(formatAmountValue(response.localBankDepositStat,true));
        $("#vatSalesTaxStat").html(formatAmountValue(response.vatSalesTaxStat,true));
        $("#educationSurchargeStat").html(formatAmountValue(response.educationSurchargeStat,true));
        $("#localEducationAttachedStat").html(formatAmountValue(response.localEducationAttachedStat,true));
        $("#vatIncomeTaxStat").html(formatAmountValue(response.vatIncomeTaxStat,true));
        $("#materialGeldStat").html(formatAmountValue(response.materialGeldStat,true));
        $("#cityBuildTaxStat").html(formatAmountValue(response.cityBuildTaxStat,true));
        $("#labourServiceFeeStat").html(formatAmountValue(response.labourServiceFeeStat,true));
    }, 'json');
}


// 工程发票统计信息
function getInvoiceStat(projectId) {
    $.post(baseUrl + '/op/projectInfo/getInvoiceStat', {projectId: projectId}, function (response) {
        $("#invoice_invoiceAmountStat").html(formatAmountValue(response.invoiceAmountStat,true));
        $("#invoice_taxStat").html(formatAmountValue(response.taxStat,true));
        $("#invoice_taxTotalStat").html(formatAmountValue(response.taxTotalStat,true));
        //本地发票
        var addedValueTaxValueStat_local = 0;
        var corporateIncomeTaxValueStat_local = 0;
        var individualIncomeTaxValueStat_local = 0;
        var stampDutyValueStat_local = 0;
        var constructionTaxValueStat_local = 0;
        var educationalSurtaxValueStat_local = 0;
        var areaEducationalSurtaxValueStat_local = 0;
        var waterBuildTaxValueStat_local = 0;
        var otherTaxValueStat_local = 0;
        //外地发票
        var addedValueTaxValueStat_nonlocal = 0;
        var corporateIncomeTaxValueStat_nonlocal = 0;
        var individualIncomeTaxValueStat_nonlocal = 0;
        var stampDutyValueStat_nonlocal = 0;
        var constructionTaxValueStat_nonlocal = 0;
        var educationalSurtaxValueStat_nonlocal = 0;
        var areaEducationalSurtaxValueStat_nonlocal = 0;
        var waterBuildTaxValueStat_nonlocal = 0;
        var otherTaxValueStat_nonlocal = 0;
        if(response.invoiceTaxBillStat!=null && response.invoiceTaxBillStat!="") {
            $.each(response.invoiceTaxBillStat, function (index, element) {
                if (element.tollageType == "1") {
                    addedValueTaxValueStat_local = element.addedValueTaxValueStat;
                    corporateIncomeTaxValueStat_local = element.corporateIncomeTaxValueStat;
                    individualIncomeTaxValueStat_local = element.individualIncomeTaxValueStat;
                    stampDutyValueStat_local = element.stampDutyValueStat;
                    constructionTaxValueStat_local = element.constructionTaxValueStat;
                    educationalSurtaxValueStat_local = element.educationalSurtaxValueStat;
                    areaEducationalSurtaxValueStat_local = element.areaEducationalSurtaxValueStat;
                    waterBuildTaxValueStat_local = element.waterBuildTaxValueStat;
                    otherTaxValueStat_local = element.otherTaxValueStat;
                } else if (element.tollageType == "2") {
                    addedValueTaxValueStat_local = element.addedValueTaxValueStat;
                    corporateIncomeTaxValueStat_local = element.corporateIncomeTaxValueStat;
                    individualIncomeTaxValueStat_local = element.individualIncomeTaxValueStat;
                    stampDutyValueStat_local = element.stampDutyValueStat;
                    constructionTaxValueStat_local = element.constructionTaxValueStat;
                    educationalSurtaxValueStat_local = element.educationalSurtaxValueStat;
                    areaEducationalSurtaxValueStat_local = element.areaEducationalSurtaxValueStat;
                    waterBuildTaxValueStat_local = element.waterBuildTaxValueStat;
                    otherTaxValueStat_local = element.otherTaxValueStat;
                } else if (element.tollageType == "3") {
                    addedValueTaxValueStat_nonlocal = element.addedValueTaxValueStat;
                    corporateIncomeTaxValueStat_nonlocal = element.corporateIncomeTaxValueStat;
                    individualIncomeTaxValueStat_nonlocal = element.individualIncomeTaxValueStat;
                    stampDutyValueStat_nonlocal = element.stampDutyValueStat;
                    constructionTaxValueStat_nonlocal = element.constructionTaxValueStat;
                    educationalSurtaxValueStat_nonlocal = element.educationalSurtaxValueStat;
                    areaEducationalSurtaxValueStat_nonlocal = element.areaEducationalSurtaxValueStat;
                    waterBuildTaxValueStat_nonlocal = element.waterBuildTaxValueStat;
                    otherTaxValueStat_nonlocal = element.otherTaxValueStat;
                }
            });
        }
        //小计
        var addedValueTaxValueStat_total = addedValueTaxValueStat_local + addedValueTaxValueStat_nonlocal;
        var corporateIncomeTaxValueStat_total = corporateIncomeTaxValueStat_local + corporateIncomeTaxValueStat_nonlocal;
        var individualIncomeTaxValueStat_total = individualIncomeTaxValueStat_local + individualIncomeTaxValueStat_nonlocal;
        var stampDutyValueStat_total = stampDutyValueStat_local + stampDutyValueStat_nonlocal;
        var constructionTaxValueStat_total = constructionTaxValueStat_local + constructionTaxValueStat_nonlocal;
        var educationalSurtaxValueStat_total = educationalSurtaxValueStat_local + educationalSurtaxValueStat_nonlocal;
        var areaEducationalSurtaxValueStat_total = areaEducationalSurtaxValueStat_local + areaEducationalSurtaxValueStat_nonlocal;
        var waterBuildTaxValueStat_total = waterBuildTaxValueStat_local + waterBuildTaxValueStat_nonlocal;
        var otherTaxValueStat_total = otherTaxValueStat_local + otherTaxValueStat_nonlocal;

        $("#addedValueTaxValueStat_local").html(formatAmountValue(addedValueTaxValueStat_local,true));
        $("#corporateIncomeTaxValueStat_local").html(formatAmountValue(corporateIncomeTaxValueStat_local,true));
        $("#individualIncomeTaxValueStat_local").html(formatAmountValue(individualIncomeTaxValueStat_local,true));
        $("#stampDutyValueStat_local").html(formatAmountValue(stampDutyValueStat_local,true));
        $("#constructionTaxValueStat_local").html(formatAmountValue(constructionTaxValueStat_local,true));
        $("#educationalSurtaxValueStat_local").html(formatAmountValue(educationalSurtaxValueStat_local,true));
        $("#areaEducationalSurtaxValueStat_local").html(formatAmountValue(areaEducationalSurtaxValueStat_local,true));
        $("#waterBuildTaxValueStat_local").html(formatAmountValue(waterBuildTaxValueStat_local,true));
        $("#otherTaxValueStat_local").html(formatAmountValue(otherTaxValueStat_local,true));

        $("#addedValueTaxValueStat_nonlocal").html(formatAmountValue(addedValueTaxValueStat_nonlocal,true));
        $("#corporateIncomeTaxValueStat_nonlocal").html(formatAmountValue(corporateIncomeTaxValueStat_nonlocal,true));
        $("#individualIncomeTaxValueStat_nonlocal").html(formatAmountValue(individualIncomeTaxValueStat_nonlocal,true));
        $("#stampDutyValueStat_nonlocal").html(formatAmountValue(stampDutyValueStat_nonlocal,true));
        $("#constructionTaxValueStat_nonlocal").html(formatAmountValue(constructionTaxValueStat_nonlocal,true));
        $("#educationalSurtaxValueStat_nonlocal").html(formatAmountValue(educationalSurtaxValueStat_nonlocal,true));
        $("#areaEducationalSurtaxValueStat_nonlocal").html(formatAmountValue(areaEducationalSurtaxValueStat_nonlocal,true));
        $("#waterBuildTaxValueStat_nonlocal").html(formatAmountValue(waterBuildTaxValueStat_nonlocal,true));
        $("#otherTaxValueStat_nonlocal").html(formatAmountValue(otherTaxValueStat_nonlocal,true));

        $("#addedValueTaxValueStat_total").html(formatAmountValue(addedValueTaxValueStat_total,true));
        $("#corporateIncomeTaxValueStat_total").html(formatAmountValue(corporateIncomeTaxValueStat_total,true));
        $("#individualIncomeTaxValueStat_total").html(formatAmountValue(individualIncomeTaxValueStat_total,true));
        $("#stampDutyValueStat_total").html(formatAmountValue(stampDutyValueStat_total,true));
        $("#constructionTaxValueStat_total").html(formatAmountValue(constructionTaxValueStat_total,true));
        $("#educationalSurtaxValueStat_total").html(formatAmountValue(educationalSurtaxValueStat_total,true));
        $("#areaEducationalSurtaxValueStat_total").html(formatAmountValue(areaEducationalSurtaxValueStat_total,true));
        $("#waterBuildTaxValueStat_total").html(formatAmountValue(waterBuildTaxValueStat_total,true));
        $("#otherTaxValueStat_total").html(formatAmountValue(otherTaxValueStat_total,true));

        var total = addedValueTaxValueStat_total + corporateIncomeTaxValueStat_total + individualIncomeTaxValueStat_total + stampDutyValueStat_total + constructionTaxValueStat_total + educationalSurtaxValueStat_total + areaEducationalSurtaxValueStat_total + waterBuildTaxValueStat_total + otherTaxValueStat_total;
        $("#totalInvoice").html(formatAmountValue(total,true));
    }, 'json');
}

// 劳务费统计信息
function getLabourserviceinvoiceStat(projectId) {
    $.post(baseUrl + '/op/projectInfo/getLabourserviceinvoiceStat', {projectId: projectId}, function (response) {
        $("#labourServiceFeeStat_table td[name='payAmountTotal']").html(formatAmountValue(response.payAmountTotal,true));
        $("#labourServiceFeeStat_table td[name='noPayAmountTotal']").html(formatAmountValue(response.noPayAmountTotal,true));
        var amountStatOther = 0;
        var taxAmountStatOther = 0;
        var taxPriceAmountStatOther = 0;
        var amountStatTotal = 0;
        var taxAmountStatTotal = 0;
        var taxPriceAmountStatTotal = 0;
        if(response.labourserviceinvoiceStat!=null && response.labourserviceinvoiceStat!="") {
            $.each(response.labourserviceinvoiceStat, function (index, element) {
                amountStatTotal += element.amountStat;
                taxAmountStatTotal += element.taxAmountStat;
                taxPriceAmountStatTotal += element.taxPriceAmountStat;
                if (element.taxRates == 3 || element.taxRates == 6 || element.taxRates == 11 || element.taxRates == 17) {
                    $("#labourServiceFeeStat_table td[name='amountStat" + element.taxRates + "']").html(formatAmountValue(element.amountStat, true));
                    $("#labourServiceFeeStat_table td[name='taxAmountStat" + element.taxRates + "']").html(formatAmountValue(element.taxAmountStat, true));
                    $("#labourServiceFeeStat_table td[name='taxPriceAmountStat" + element.taxRates + "']").html(formatAmountValue(element.taxPriceAmountStat, true));
                } else {
                    amountStatOther += element.amountStat;
                    taxAmountStatOther += element.taxAmountStat;
                    taxPriceAmountStatOther += element.taxPriceAmountStat;
                }
            });
        }
        $("#labourServiceFeeStat_table td[name='amountStatOther']").html(formatAmountValue(amountStatOther,true));
        $("#labourServiceFeeStat_table td[name='taxAmountStatOther']").html(formatAmountValue(taxAmountStatOther,true));
        $("#labourServiceFeeStat_table td[name='taxPriceAmountStatOther']").html(formatAmountValue(taxPriceAmountStatOther,true));

        $("#labourServiceFeeStat_table td[name='amountStatTotal']").html(formatAmountValue(amountStatTotal,true));
        $("#labourServiceFeeStat_table td[name='taxAmountStatTotal']").html(formatAmountValue(taxAmountStatTotal,true));
        $("#labourServiceFeeStat_table td[name='taxPriceAmountStatTotal']").html(formatAmountValue(taxPriceAmountStatTotal,true));

    }, 'json');
}

// 材料合同计信息
function getMaterialContractStat(projectId) {
    $.post(baseUrl + '/op/projectInfo/getMaterialContractStat', {projectId: projectId}, function (response) {
        $("#materialContractStat_table td[name='payAmountTotal']").html(formatAmountValue(response.payAmountTotal,true));
        $("#materialContractStat_table td[name='noPayAmountTotal']").html(formatAmountValue(response.noPayAmountTotal,true));
        var amountStatOther = 0;
        var taxAmountStatOther = 0;
        var taxPriceAmountStatOther = 0;
        var amountStatTotal = 0;
        var taxAmountStatTotal = 0;
        var taxPriceAmountStatTotal = 0;
        if(response.materialContractStat!=null && response.materialContractStat!=""){
            $.each(response.materialContractStat, function (index, element) {
                amountStatTotal += element.amountStat;
                taxAmountStatTotal += element.taxAmountStat;
                taxPriceAmountStatTotal += element.taxPriceAmountStat;
                if (element.taxRates == 3 || element.taxRates == 6 || element.taxRates == 11 || element.taxRates == 17) {
                    $("#materialContractStat_table td[name='amountStat" + element.taxRates + "']").html(formatAmountValue(element.amountStat,true));
                    $("#materialContractStat_table td[name='taxAmountStat" + element.taxRates + "']").html(formatAmountValue(element.taxAmountStat,true));
                    $("#materialContractStat_table td[name='taxPriceAmountStat" + element.taxRates + "']").html(formatAmountValue(element.taxPriceAmountStat,true));
                } else {
                    amountStatOther += element.amountStat;
                    taxAmountStatOther += element.taxAmountStat;
                    taxPriceAmountStatOther += element.taxPriceAmountStat;
                }
            });
        }
        $("#materialContractStat_table td[name='amountStatOther']").html(formatAmountValue(amountStatOther,true));
        $("#materialContractStat_table td[name='taxAmountStatOther']").html(formatAmountValue(taxAmountStatOther,true));
        $("#materialContractStat_table td[name='taxPriceAmountStatOther']").html(formatAmountValue(taxPriceAmountStatOther,true));

        $("#materialContractStat_table td[name='amountStatTotal']").html(formatAmountValue(amountStatTotal,true));
        $("#materialContractStat_table td[name='taxAmountStatTotal']").html(formatAmountValue(taxAmountStatTotal,true));
        $("#materialContractStat_table td[name='taxPriceAmountStatTotal']").html(formatAmountValue(taxPriceAmountStatTotal,true));

    }, 'json');
}