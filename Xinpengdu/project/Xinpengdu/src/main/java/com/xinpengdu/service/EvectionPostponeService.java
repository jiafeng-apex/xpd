package com.xinpengdu.service;

import com.xinpengdu.common.tool.DateUtil;
import com.xinpengdu.common.tool.Tool;
import com.xinpengdu.entity.project.EvectionPostpone;
import com.xinpengdu.persistence.EvectionPostponeMapper;
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
 * 外出证延期信息服务实现类
 * 
 * @author Sunjf
 * 
 *         2016-1-5 下午8:45:52
 */
@Service
@Transactional(propagation= Propagation.REQUIRED)
public class EvectionPostponeService {

    @Autowired
    private EvectionPostponeMapper evectionPostponeMapper;

    public String queryList(Map<String, Object> params) throws Exception {
        long total = evectionPostponeMapper.count(params);
        List<Map<String, Object>> list = evectionPostponeMapper.queryList(params);
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

    public List<EvectionPostpone> query(Object value) {
        return evectionPostponeMapper.query(value);
    }

    public void save(EvectionPostpone evectionPostpone) {
        evectionPostpone.setPostponeId(UUID.randomUUID().toString());
        String createDate = DateUtil.dateTime2String(new Date());
        evectionPostpone.setCreateDate(createDate);
        evectionPostpone.setLastUpdateDate(createDate);
        evectionPostponeMapper.save(evectionPostpone);
    }

    public EvectionPostpone get(String id) {
        return evectionPostponeMapper.get(id);
    }

    public EvectionPostpone getEvectionPostponeEditInfo(Map<String, Object> params) {
        return evectionPostponeMapper.getEvectionPostponeEditInfo(params);
    }

    public void update(EvectionPostpone evectionPostpone) {
        evectionPostpone.setLastUpdateDate(DateUtil.dateTime2String(new Date()));
        evectionPostponeMapper.update(evectionPostpone);
    }

    public void deleteById(String id) {
        evectionPostponeMapper.deleteById(id);
    }

}
