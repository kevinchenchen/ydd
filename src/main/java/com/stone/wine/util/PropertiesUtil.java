/*
 * 文件名：PropertiesUtil.java
 * 版权：Copyright 2015 江苏大泰信息技术有限公司. All Rights Reserved. 
 * 描述： Properties文件工具类
 * 创建人：汪涛
 * 创建时间：2015-07-16
 */
package com.stone.wine.util;

import java.io.IOException;
import java.util.Properties;

/**
 * Properties文件工具类。
 * 
 * @author Stone
 * 
 */
public final class PropertiesUtil {
    /** 系统参数. */
    private static Properties sysConf = null;

    static {
        sysConf = PropertiesUtil.loadProp("config.properties");
    }

    /**
     * 读取Properties文件.
     * 
     * @param file
     *            文件名
     * @return Properties配置对象
     */
    public static Properties loadProp(String file) {
        Properties prop = new Properties();
        try {
            String path = (null == file ? "" : ("/" + file));
            prop.load(PropertiesUtil.class.getResourceAsStream(path));
            return prop;
        } catch (IOException e) {
            return null;
        }
    }

    /**
     * 获得系统参数.
     * 
     * @param key
     *            参数Key
     * @return 参数值
     */
    public static String getAttr(String key) {
        if (null == sysConf) {
            return "";
        }
        return sysConf.getProperty(key, "");
    }
}
