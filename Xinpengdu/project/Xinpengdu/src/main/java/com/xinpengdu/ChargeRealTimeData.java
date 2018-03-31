package com.xinpengdu;

/**
 * Created by Sunjf on 2016/12/21.
 */
public class ChargeRealTimeData {

    private String order_no;            // 本次充电的订单号
    private String device_sn;           // 设备 SN 号
    private String interface_code;      // 接口编号 00 开始编号 00 01 02
    private String user_id;             // 卡号或者用户手机号
    private int user_type;           // 0： 移动用户 1： 卡用户
    private float qty;              //当前充电电量
    private float money;            //当前已充费用（ 电费）
    private float service_money;    //当前服务费
    private int charge_time;        //当前充电时长（ 秒）
    private int remain_time;        //剩余充电时间（ 秒）
    private int voltage;            //电压
    private int current;            //电流
    private float soc;              //当前电池剩余百分比 0~100
    private int status;             //当前状态 1:告警 2:充电中 3:离线 4:充电完成 5:其他

    public String getOrder_no() {
        return order_no;
    }

    public void setOrder_no(String order_no) {
        this.order_no = order_no;
    }

    public String getDevice_sn() {
        return device_sn;
    }

    public void setDevice_sn(String device_sn) {
        this.device_sn = device_sn;
    }

    public String getInterface_code() {
        return interface_code;
    }

    public void setInterface_code(String interface_code) {
        this.interface_code = interface_code;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public int getUser_type() {
        return user_type;
    }

    public void setUser_type(int user_type) {
        this.user_type = user_type;
    }

    public float getQty() {
        return qty;
    }

    public void setQty(float qty) {
        this.qty = qty;
    }

    public float getMoney() {
        return money;
    }

    public void setMoney(float money) {
        this.money = money;
    }

    public float getService_money() {
        return service_money;
    }

    public void setService_money(float service_money) {
        this.service_money = service_money;
    }

    public int getCharge_time() {
        return charge_time;
    }

    public void setCharge_time(int charge_time) {
        this.charge_time = charge_time;
    }

    public int getRemain_time() {
        return remain_time;
    }

    public void setRemain_time(int remain_time) {
        this.remain_time = remain_time;
    }

    public int getVoltage() {
        return voltage;
    }

    public void setVoltage(int voltage) {
        this.voltage = voltage;
    }

    public int getCurrent() {
        return current;
    }

    public void setCurrent(int current) {
        this.current = current;
    }

    public float getSoc() {
        return soc;
    }

    public void setSoc(float soc) {
        this.soc = soc;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
