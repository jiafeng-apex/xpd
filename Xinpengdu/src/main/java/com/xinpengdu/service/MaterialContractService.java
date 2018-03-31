package com.xinpengdu.service;

import com.xinpengdu.common.tool.DateUtil;
import com.xinpengdu.common.tool.Tool;
import com.xinpengdu.entity.project.MaterialContract;
import com.xinpengdu.persistence.MaterialContractMapper;
import com.xinpengdu.persistence.MaterialGeldMapper;
import com.xinpengdu.persistence.MaterialInvoiceMapper;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

/**
 * 材料合同信息服务实现类
 */
@Service
@Transactional(propagation = Propagation.REQUIRED)
public class MaterialContractService {

    @Autowired
    private MaterialContractMapper materialContractMapper;

    @Autowired
    private MaterialGeldMapper materialGeldMapper;

    @Autowired
    private MaterialInvoiceMapper materialInvoiceMapper;

    public String queryList(Map<String, Object> params) throws Exception {
        long total = materialContractMapper.count(params);
        List<Map<String, Object>> list = materialContractMapper.queryList(params);
        JSONObject resultObj = Tool.getJsonDataReturn(total, list);
        return resultObj.toString();
    }

    public String getInfoById(String id) throws Exception {
        Map<String, Object> map = Tool.transBean2Map(get(id));
        JSONObject jsonObject = Tool.getSuccessReturnJSONObject();
        for (Map.Entry<String, Object> entry : map.entrySet()) {
            jsonObject.put(entry.getKey(), entry.getValue());
        }
        return jsonObject.toString();
    }

    public List<MaterialContract> query(Object value) {
        return materialContractMapper.query(value);
    }

    public void save(MaterialContract materialContract) {
        materialContract.setMaterialContractId(UUID.randomUUID().toString());
        String createDate = DateUtil.dateTime2String(new Date());
        materialContract.setCreateDate(createDate);
        materialContract.setLastUpdateDate(createDate);
        materialContractMapper.save(materialContract);
    }

    public MaterialContract get(String id) {
        return materialContractMapper.get(id);
    }

    public MaterialContract getMaterialContractEditInfo(Map<String, Object> params) {
        return materialContractMapper.getMaterialContractEditInfo(params);
    }

    public void update(MaterialContract materialContract) {
        materialContract.setLastUpdateDate(DateUtil.dateTime2String(new Date()));
        materialContractMapper.update(materialContract);
    }

    public String deleteById(String id) {
        Map<String, Object> params = new HashMap<>();
        params.put("materialContractId", id);
        long geldCount = materialGeldMapper.count(params);
        if (geldCount > 0) {
            return Tool.getJsonMsgReturn(false, "materialGeldError");
        }
        long invoiceCount = materialInvoiceMapper.count(params);
        if (invoiceCount > 0) {
            return Tool.getJsonMsgReturn(false, "materialInvoiceError");
        }
        materialContractMapper.deleteById(id);
        return Tool.getAppSuccessReturnJSONObject().toString();

    }

}
