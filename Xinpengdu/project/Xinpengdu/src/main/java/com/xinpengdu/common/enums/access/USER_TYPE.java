package com.xinpengdu.common.enums.access;

import java.util.ArrayList;
import java.util.List;

/**
 * 用户类型
 *
 * Created by zengx on 2017/2/15.
 */
public enum USER_TYPE {
    /**
     * 系统管理员
     */
    SYSTEM_ADMIN {
        @Override
        public String getRoleNameResourceId() {
            return "phrase.company.user.type.system.admin";
        }

        @Override
        public int getLevelValue() {
            return 0;
        }
    },

    /**
     * 平台商管理员
     */
    PLATFORM_ADMIN {
        @Override
        public String getRoleNameResourceId() {
            return "phrase.company.user.type.platform.admin";
        }

        @Override
        public int getLevelValue() {
            return 1;
        }
    },
    /**
     * 运营商管理员
     */
    COMPANY_ADMIN {
        @Override
        public String getRoleNameResourceId() {
            return "phrase.company.user.type.company.admin";
        }

        @Override
        public int getLevelValue() {
            return 2;
        }
    },

    /**
     * 平台商用户
     */
    PLATFORM_USER {
        @Override
        public String getRoleNameResourceId() {
            return "phrase.company.user.type.platform.user";
        }

        @Override
        public int getLevelValue() {
            return 3;
        }
    },

    /**
     * 运营商用户
     */
    COMPANY_USER {
        @Override
        public String getRoleNameResourceId() {
            return "phrase.company.user.type.company.user";
        }

        @Override
        public int getLevelValue() {
            return 4;
        }
    },

    /**
     * 普通用户
     */
    USER {
        @Override
        public String getRoleNameResourceId() {
            return "phrase.company.user.type.user";
        }

        @Override
        public int getLevelValue() {
            return 5;
        }
    };

    /**
     * 用户类型是否小于
     * @param userType
     * @return
     */
    public boolean lt(USER_TYPE userType) {
        return ordinal() > userType.ordinal();
    }

    /**
     * 用户类型是否小于等于
     * @param userType
     * @return
     */
    public boolean le(USER_TYPE userType) {
        return ordinal() >= userType.ordinal();
    }

    /**
     * 用户类型是否大于
     * @param userType
     * @return
     */
    public boolean gt(USER_TYPE userType) {
        return ordinal() < userType.ordinal();
    }

    /**
     * 用户类型是否大于等于
     * @param userType
     * @return
     */
    public boolean ge(USER_TYPE userType) {
        return ordinal() <= userType.ordinal();
    }

    public USER_TYPE getTypeByOrdinal(int ordinal) {
        return this.getTypeByOrdinal(ordinal);
    }

    public abstract String getRoleNameResourceId();
    public abstract int getLevelValue();

    /**s
     * 获取当前用户类型可见的类型集合
     * @param userType
     * @param isAllowEquals 是否包含当前用户类型
     * @return
     */
    public static List<USER_TYPE> getVisibleUserTypes(USER_TYPE userType, boolean isAllowEquals) {
        List<USER_TYPE> visibleUserType = new ArrayList<>();
        for (USER_TYPE type : USER_TYPE.values()) {
            if (type.lt(userType)) {
                visibleUserType.add(type);
            }
        }

        if (isAllowEquals) {
            visibleUserType.add(userType);
        }

        return visibleUserType;
    }
}
