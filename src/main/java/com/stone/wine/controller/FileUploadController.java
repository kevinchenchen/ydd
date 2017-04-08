package com.stone.wine.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.stone.wine.util.ConstantUtil;
import com.stone.wine.util.PropertiesUtil;
import com.stone.wine.util.RetEntity;

/**
 * 文件上传
 * 
 * @author stone
 * 
 */
@Controller
@RequestMapping("/fileupload")
public class FileUploadController {

	/**
	 * 多文件上传
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/upload")
	@ResponseBody
	public RetEntity upload(HttpServletRequest request) {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		/** 页面控件的文件流 **/
		String id = request.getParameter("id");
		MultipartFile multipartFile = multipartRequest.getFile(id);
		if (null == multipartFile || multipartFile.isEmpty()) {
			return new RetEntity(ConstantUtil.ILLEGAL, ConstantUtil.ILLEGAL_MSG);
		}
		String root = PropertiesUtil.getAttr("file.root");
		String path = PropertiesUtil.getAttr("file.wine");
		String date = new SimpleDateFormat("yyyyMMdd").format(new Date());
		String serverDir = root + File.separator + path + File.separator + date
				+ File.separator;
		File serverDirFile = new File(serverDir);
		// 服务器文件夹是否存在
		if (!serverDirFile.isDirectory() || !serverDirFile.exists()) {
			serverDirFile.mkdirs();
		}

		String originalFilename = multipartFile.getOriginalFilename();
		String imgName = System.currentTimeMillis()
				+ originalFilename.substring(originalFilename.lastIndexOf("."));
		try {
			multipartFile.transferTo(new File(serverDir + File.separator
					+ imgName));
			String remoteImgUrl = path + "/" + date + "/" + imgName;
			return new RetEntity(ConstantUtil.SUCCESS,
					ConstantUtil.SUCCESS_MSG, remoteImgUrl);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return new RetEntity(ConstantUtil.ERROR, ConstantUtil.ERROR_MSG);
	}
}
