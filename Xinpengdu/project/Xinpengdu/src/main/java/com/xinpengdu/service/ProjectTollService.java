package com.xinpengdu.service;

import com.xinpengdu.common.tool.DataUtil;
import com.xinpengdu.common.tool.DateUtil;
import com.xinpengdu.common.tool.Tool;
import com.xinpengdu.entity.project.ProjectInfo;
import com.xinpengdu.entity.project.ProjectToll;
import com.xinpengdu.persistence.ProjectRateMapper;
import com.xinpengdu.persistence.ProjectTollMapper;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.math.BigDecimal;
import java.util.*;


/**
 * 工程收费信息服务实现类
 *
 * @author Sunjf
 *         <p/>
 *         2016-1-5 下午8:45:52
 */
@Service
@Transactional(propagation = Propagation.REQUIRED)
public class ProjectTollService {

    // 工程收费
    @Autowired
    private ProjectTollMapper projectTollMapper;
    // 工程费率
    @Autowired
    private ProjectRateMapper projectRateMapper;
    // 工程信息
    @Autowired
    private ProjectInfoService projectInfoService;

    public String queryList(Map<String, Object> params) throws Exception {
        long total = projectTollMapper.count(params);
        List<Map<String, Object>> list = projectTollMapper.queryList(params);
        JSONObject resultObj = Tool.getJsonDataReturn(total, list);
        return resultObj.toString();
    }

    public String getInfoById(String id) throws Exception {
        Map<String, Object> map = Tool.transBean2Map(get(id));
        JSONObject jsonObject = Tool.getSuccessReturnJSONObject();
        for (Map.Entry<String, Object> entry : map.entrySet()) {
            jsonObject.put(entry.getKey(), entry.getValue());
        }
        jsonObject.put("latelySummary", getLatelySummary());
        return jsonObject.toString();
    }

    public List<ProjectToll> query(Object value) {
        return projectTollMapper.query(value);
    }

    public List<String> getLatelySummary() {
        return projectTollMapper.getLatelySummary();
    }

    public void save(ProjectToll projectToll) {
        String createDate = DateUtil.dateTime2String(new Date());
        projectToll.setCreateDate(createDate);
        projectToll.setLastUpdateDate(createDate);

        // 计算余额(算出累计余额)
        // 工程收费里面余额累计余额，如现在有3条数据。汇入金额都为1000，比如扣其他费用200。
        // 在添加第一条汇入金额1000。的时候余额显示0。保存后点击查看余额800。第二条汇入金额1000.点击保存后查看余额1600。第三条汇入金额1000.保存后查看余额2400。
        // 如果第二条金额修改，把汇入金额改成0，其他不变，取消自动计算。保存后第二条余额显示金额为600，第三条余额就是1400
        String balanceStr = "0",localBankDepositStr = "0";
        Map<String, Object> params = new HashMap<>();
        params.put("projectId", projectToll.getProjectId());
        params.put("projectTollDate", projectToll.getProjectTollDate());
        params.put("createDate", createDate);
        ProjectToll projectToll4Latest = projectTollMapper.getProjectTollByTime(params);
        if (projectToll4Latest != null) {
            balanceStr = projectToll4Latest.getBalance();
            localBankDepositStr = projectToll4Latest.getLocalBankDeposit();
        }

        // 计算余额
        double balanceBak_D = new BigDecimal(DataUtil.delComma(projectToll.getBalanceBak())).doubleValue();
        double balance_D = new BigDecimal(DataUtil.delComma(balanceStr)).doubleValue();
        double balance = balanceBak_D + balance_D;
        projectToll.setBalance(DataUtil.insertComma(balance + "", 2));

        // 计算本地银行存款
        double localBankDepositBak_D = new BigDecimal(DataUtil.delComma(projectToll.getLocalBankDepositBak())).doubleValue();
        double localBankDeposit_D = new BigDecimal(DataUtil.delComma(localBankDepositStr)).doubleValue();
        double localBankDeposit = localBankDepositBak_D + localBankDeposit_D;
        projectToll.setLocalBankDeposit(DataUtil.insertComma(localBankDeposit + "", 2));

        params.put("balance", projectToll.getBalanceBak());
        params.put("localBankDeposit", projectToll.getLocalBankDepositBak());
        params.put("createDate", projectToll.getCreateDate());
        projectTollMapper.updateTollBalance(params);

        if (StringUtils.isEmpty(projectToll.getProjectTollId())) {
            projectToll.setProjectTollId(UUID.randomUUID().toString());
        }
        projectTollMapper.save(projectToll);
    }

    public ProjectToll get(String id) {
        return projectTollMapper.get(id);
    }

    public ProjectToll getByExternalGeldId(String externalGeldId) {
        return projectTollMapper.getByExternalGeldId(externalGeldId);
    }

    public ProjectToll getProjectTollByTime(Map<String, Object> params) {
        return projectTollMapper.getProjectTollByTime(params);
    }

    public List<ProjectToll> getProjectTollList(Map<String, Object> params) {
        return projectTollMapper.getProjectTollList(params);
    }

    public String getLocalDeposit(String projectId, boolean isFormat) {
        ProjectInfo projectInfo = projectInfoService.get(projectId);
        // 如果工程类型是外地工程，需要自动计算本地银行存款
        if (null != projectInfo && null != projectInfo.getProjectType() && projectInfo.getProjectType().equals("2")) {
            ProjectToll projectToll = projectTollMapper.getLocalDeposit(projectId);
            if (projectToll != null) {
                double importAmountTotal = projectToll.getImportAmount() != null ? Double.parseDouble(projectToll.getImportAmount()) : 0;
                double exportAmountTotal = projectToll.getExportAmount() != null ? Double.parseDouble(projectToll.getExportAmount()) : 0;
                double companyFundsTotal = projectToll.getCompanyFunds() != null ? Double.parseDouble(projectToll.getCompanyFunds()) : 0;
                double localBankDeposit = importAmountTotal - exportAmountTotal - companyFundsTotal;
                // 对数据进行格式化
                String lbd = localBankDeposit + "";
                if (isFormat) {
                    lbd = DataUtil.insertComma(lbd, 2);
                }
                return lbd;
            }
        }
        return null;
    }

    /**
     * 获取工程下汇入金额总和
     *
     * @param projectId
     * @return
     */
    public String getImportAmountTotal(String projectId) {
        return projectTollMapper.getImportAmountTotal(projectId);
    }

    public void updateInfo(ProjectToll projectToll) {
        String projectTollId = projectToll.getProjectTollId();  // 工程收费的id
        // 获取数据库中该条工程收费的数据
        ProjectToll projectToll_old = projectTollMapper.get(projectTollId);

        String balanceStr = "0",localBankDepositStr = "0";    // 工程收费累计金额默认为0
        Map<String, Object> params = new HashMap<>();
        params.put("projectTollId", projectToll.getProjectTollId());
        params.put("projectId", projectToll.getProjectId());
        params.put("projectTollDate", projectToll.getProjectTollDate());
        params.put("createDate", projectToll_old.getCreateDate());
        // 根据工程收费的时间获取该工程下工程收费的累计金额
        ProjectToll projectToll4Latest = projectTollMapper.getProjectTollByTime(params);
        if (projectToll4Latest != null) {
            balanceStr = projectToll4Latest.getBalance();
            localBankDepositStr = projectToll4Latest.getLocalBankDeposit();
        }

        // 计算余额
        double balanceBak_D = new BigDecimal(DataUtil.delComma(projectToll.getBalanceBak())).doubleValue();
        double balance_D = new BigDecimal(DataUtil.delComma(balanceStr)).doubleValue();
        double balance = balanceBak_D + balance_D;
        projectToll.setBalance(DataUtil.insertComma(balance + "", 2));

        // 计算本地银行存款
        double localBankDepositBak_D = new BigDecimal(DataUtil.delComma(projectToll.getLocalBankDepositBak())).doubleValue();
        double localBankDeposit_D = new BigDecimal(DataUtil.delComma(localBankDepositStr)).doubleValue();
        double localBankDeposit = localBankDepositBak_D + localBankDeposit_D;
        projectToll.setLocalBankDeposit(DataUtil.insertComma(localBankDeposit + "", 2));

        // 更新余额和本地银行存款
        double balanceBak_old = new BigDecimal(DataUtil.delComma(projectToll_old.getBalance())).doubleValue();
        double balanceBak_new = new BigDecimal(DataUtil.delComma(projectToll.getBalance())).doubleValue();
        double balanceBak_diff = balanceBak_new - balanceBak_old;
        double localBankDepositBak_old = new BigDecimal(DataUtil.delComma(projectToll_old.getLocalBankDepositBak())).doubleValue();
        double localBankDepositBak_new = new BigDecimal(DataUtil.delComma(projectToll.getLocalBankDepositBak())).doubleValue();
        double localBankDepositBak_diff = localBankDepositBak_new - localBankDepositBak_old;
        params.put("balance", balanceBak_diff);
        params.put("localBankDeposit", localBankDepositBak_diff);
        projectTollMapper.updateTollBalance(params);


        projectToll.setLastUpdateDate(DateUtil.dateTime2String(new Date()));
        projectTollMapper.update(projectToll);
    }

    public void update(ProjectToll projectToll) {
        projectTollMapper.update(projectToll);
    }


    public void updateTollBalance(Map<String, Object> params) {
        projectTollMapper.updateTollBalance(params);
    }

    public void deleteById(String id) {
        // 先更新工程收费的累计余额和累计本地银行汇款
        ProjectToll projectToll = projectTollMapper.get(id);
        double balanceBak_old = new BigDecimal(DataUtil.delComma(projectToll.getBalanceBak())).doubleValue();
        double balanceBak_diff = 0 - balanceBak_old;

        double localBankDepositBak_old = new BigDecimal(DataUtil.delComma(projectToll.getLocalBankDepositBak())).doubleValue();
        double localBankDepositBak_diff = 0 - localBankDepositBak_old;

        Map<String, Object> params = new HashMap<>();
        params.put("projectId", projectToll.getProjectId());
        params.put("projectTollDate", projectToll.getProjectTollDate());
        params.put("balance", balanceBak_diff);
        params.put("localBankDeposit", localBankDepositBak_diff);
        params.put("createDate", projectToll.getCreateDate());
        projectTollMapper.updateTollBalance(params);
        // 删除工程收费
        projectTollMapper.deleteById(id);
    }

    public void deleteByExternalGeldId(String externalGeldId) {
        // 更新工程收费中的累计余额和累计本地银行汇款
        ProjectToll projectToll = projectTollMapper.getByExternalGeldId(externalGeldId);
        double balanceBak_old = new BigDecimal(DataUtil.delComma(projectToll.getBalanceBak())).doubleValue();
        double balanceBak_diff = 0 - balanceBak_old;

        double localBankDepositBak_old = new BigDecimal(DataUtil.delComma(projectToll.getLocalBankDepositBak())).doubleValue();
        double localBankDepositBak_diff = 0 - localBankDepositBak_old;

        Map<String, Object> params = new HashMap<>();
        params.put("projectId", projectToll.getProjectId());
        params.put("projectTollDate", projectToll.getProjectTollDate());
        params.put("balance", balanceBak_diff);
        params.put("localBankDeposit", localBankDepositBak_diff);
        params.put("createDate", projectToll.getCreateDate());
        projectTollMapper.updateTollBalance(params);
        // 删除工程收费信息
        projectTollMapper.deleteByExternalGeldId(externalGeldId);
    }

    public void deleteByProjectId(String projectId) {
        projectTollMapper.deleteByProjectId(projectId);
    }

}
