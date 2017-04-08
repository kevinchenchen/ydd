package com.stone.wine.util;

/**
 * 公共常量
 * 
 * @author stone
 *
 */
public class ConstantUtil {
	/**
	 * 管理员登录
	 */
	public static final String SESSION_ADMIN_LOGIN = "SESSION_ADMIN_LOGIN";

	/**
	 * 文件服务器地址
	 */
	public static final String SERVER_FILE_PATH = "http://127.0.0.1:8080/wine/file/";
	/**
	 * 服务器地址
	 */
	public static final String SERVER_PATH = "http://127.0.0.1:8080/wine/";

	/**
	 * 成功
	 */
	public static final int SUCCESS = 0;
	/**
	 * 失败
	 */
	public static final int FAILED = 1;
	/**
	 * 存在
	 */
	public static final int EXIST = 2;
	/**
	 * 未处理
	 */
	public static final int NONE = 8;
	/**
	 * 掉线
	 */
	public static final int OFFLINE = 9;
	/**
	 * 异常
	 */
	public static final int ERROR = -1;
	/**
	 * 不合法
	 */
	public static final int ILLEGAL = -2;

	/**
	 * 不合法的数据
	 */
	public static final String ILLEGAL_MSG = "不合法的数据";
	/**
	 * 操作成功
	 */
	public static final String SUCCESS_MSG = "操作成功";
	/**
	 * 操作异常
	 */
	public static final String ERROR_MSG = "操作异常";

	/**
	 * 操作失败
	 */
	public static final String FAILED_MSG = "操作失败";

	/**
	 * 数据已存在
	 */
	public static final String EXIST_MSG = "数据已存在";

	/**
	 * 推荐或特价
	 */
	public static final String RD_OR_SP = "1";
}
