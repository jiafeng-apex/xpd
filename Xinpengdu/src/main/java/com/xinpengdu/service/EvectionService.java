package com.xinpengdu.service;

import com.xinpengdu.common.tool.DateUtil;
import com.xinpengdu.common.tool.Tool;
import com.xinpengdu.entity.project.Evection;
import com.xinpengdu.entity.project.EvectionPostpone;
import com.xinpengdu.persistence.EvectionMapper;
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
 * 外出证信息服务实现类
 * 
 * @author Sunjf
 * 
 *         2016-1-5 下午8:45:52
 */
@Service
@Transactional(propagation= Propagation.REQUIRED)
public class EvectionService {

    @Autowired
    private EvectionMapper evectionMapper;
    @Autowired
    private EvectionPostponeMapper evectionPostponeMapper;

    public String queryList(Map<String, Object> params) throws Exception {
        long total = evectionMapper.count(params);
        List<Map<String, Object>> list = evectionMapper.queryList(params);
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

    public List<Evection> query(Object value) {
        return evectionMapper.query(value);
    }

    public Evection save(Evection evection) {
        evection.setEvectionId(UUID.randomUUID().toString());
        String createDate = DateUtil.dateTime2String(new Date());
        evection.setCreateDate(createDate);
        evection.setLastUpdateDate(createDate);
        evectionMapper.save(evection);
        return evection;
    }

    public Evection get(String id) {
        Evection evection = evectionMapper.get(id);
        List<EvectionPostpone> postponeList = evectionPostponeMapper.query(evection.getEvectionId());
        evection.setPostponeList(postponeList);
        return evection;
    }

    public Evection getEvectionEditInfo(Map<String, Object> params) {
        return evectionMapper.getEvectionEditInfo(params);
    }

    public void update(Evection evection) {
        evection.setLastUpdateDate(DateUtil.dateTime2String(new Date()));
        evectionMapper.update(evection);
    }

    public void deleteById(String id) {
        evectionMapper.deleteById(id);
    }

}
