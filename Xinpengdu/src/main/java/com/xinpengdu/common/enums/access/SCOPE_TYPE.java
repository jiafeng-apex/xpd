package com.xinpengdu.common.enums.access;

/**
 * 数据域范围枚举类
 */
public enum SCOPE_TYPE {
    /**
     * 默认范围（查询当前角色所对应的所有数据）
     */
    DEFAULT {
        @Override
        public int getLevel() {
            return 1;
        }
    },
    /**
     * 平台商范围
     */
    PLATFORM {
        @Override
        public int getLevel() {
            return 2;
        }
    },
    /**
     * 运营商范围
     */
    COMPANY {
        @Override
        public int getLevel() {
            return 3;
        }
    },
    /**
     * 电站组范围
     */
    STATION_GROUP {
        @Override
        public int getLevel() {
            return 4;
        }
    },
    /**
     * 电站范围
     */
    STATION {
        @Override
        public int getLevel() {
            return 5;
        }
    };

    public abstract int getLevel();
}
