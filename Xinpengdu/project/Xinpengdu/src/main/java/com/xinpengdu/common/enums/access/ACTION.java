package com.xinpengdu.common.enums.access;

/**
 * 操作类型枚举
 *
 */
public enum ACTION {
	
	/**
	 * 查看
	 */
	VIEW,
	
	/**
	 * 添加
	 */
	ADD,
	
	/**
	 * 编辑
	 */
	EDIT,
	
	/**
	 * 删除
	 */
	DELETE;
	
	/**
	 * 只允许VIEW操作
	 * @param action
	 * @return
	 */
	public static boolean viewOnly(ACTION action) {
		switch(action) {
		case VIEW:
			return true;
		default:
			return false;
		}
	}

}
