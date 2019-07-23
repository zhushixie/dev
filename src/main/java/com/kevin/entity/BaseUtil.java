package com.kevin.entity;

import java.io.IOException;
import java.security.MessageDigest;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * 常用工具了 Created by Gaojun.Zhou 2017年7月3日
 */
public class BaseUtil {


	/**
	 * 转换为JSON字符串
	 * 
	 * @param object
	 * @return
	 */
	public static String toJson(Object object) {
		// TODO Auto-generated method stub
		if (object != null) {
			return new Gson().toJson(object);
		}
		return "";
	}

	/**
	 * UUID
	 * 
	 * @return
	 */
	public static String uuid() {
		// TODO Auto-generated method stub
		return UUID.randomUUID().toString().replaceAll("-", "").toLowerCase();
	}

	/**
	 * MD5
	 * 
	 * @param pwd
	 * @return
	 */
	public static String MD5(String pwd) {
		// 用于加密的字符
		char md5String[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F' };
		try {
			// 使用平台的默认字符集将此 String 编码为 byte序列，并将结果存储到一个新的 byte数组中
			byte[] btInput = pwd.getBytes();

			// 信息摘要是安全的单向哈希函数，它接收任意大小的数据，并输出固定长度的哈希值。
			MessageDigest mdInst = MessageDigest.getInstance("MD5");

			// MessageDigest对象通过使用 update方法处理数据， 使用指定的byte数组更新摘要
			mdInst.update(btInput);

			// 摘要更新之后，通过调用digest（）执行哈希计算，获得密文
			byte[] md = mdInst.digest();

			// 把密文转换成十六进制的字符串形式
			int j = md.length;
			char str[] = new char[j * 2];
			int k = 0;
			for (int i = 0; i < j; i++) { // i = 0
				byte byte0 = md[i]; // 95
				str[k++] = md5String[byte0 >>> 4 & 0xf]; // 5
				str[k++] = md5String[byte0 & 0xf]; // F
			}

			// 返回经过加密后的字符串
			return new String(str);

		} catch (Exception e) {
			return null;
		}
	}
	
	/**
	 * 验证是否为Ajax
	 * @param request
	 * @return
	 */
	public static boolean isAjax( HttpServletRequest request ) {
		return "XMLHttpRequest".equals(request.getHeader("X-Requested-With")) ? true : false;
	}
	
	/**
	 * 重定向
	 * @param request
	 * @param response
	 */
	public static void clearRedirectLogin(HttpServletRequest request,HttpServletResponse response){
		try {
			request.getSession().invalidate();
			response.sendRedirect("/login");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		System.out.println(uuid());
	}

}
