package com.xinpengdu.service;

import com.xinpengdu.common.tool.DateUtil;
import com.xinpengdu.common.tool.Tool;
import com.xinpengdu.entity.project.BankInput;
import com.xinpengdu.persistence.BankInputMapper;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * 银行录入服务实现类
 *
 * @author Sunjf
 *         <p/>
 *         2016-1-5 下午8:45:52
 */
@Service
@Transactional(propagation = Propagation.REQUIRED)
public class BankInputService {

    @Autowired
    private BankInputMapper bankInputMapper;

    public String queryList(Map<String, Object> params) throws Exception {
        long total = bankInputMapper.count(params);
        List<Map<String, Object>> list = bankInputMapper.queryList(params);
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

    public List<BankInput> query(Object value) {
        return bankInputMapper.query(value);
    }

    public void save(BankInput bankInput) {
        bankInput.setBankId(UUID.randomUUID().toString());
        String createDate = DateUtil.dateTime2String(new Date());
        bankInput.setCreateDate(createDate);
        bankInput.setLastUpdateDate(createDate);
        bankInputMapper.save(bankInput);
    }

    public BankInput get(String id) {
        return bankInputMapper.get(id);
    }

    public BankInput getBankInputEditInfo(Map<String, Object> params) {
        return bankInputMapper.getBankInputEditInfo(params);
    }

    public void update(BankInput bankInput) {
        bankInput.setLastUpdateDate(DateUtil.dateTime2String(new Date()));
        bankInputMapper.update(bankInput);
    }

    public void deleteById(String id) {
        bankInputMapper.deleteById(id);
    }

}
