package com.stone.wine.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.stone.wine.model.WineChildType;
import com.stone.wine.service.WineChildTypeService;
import com.stone.wine.util.ConstantUtil;
import com.stone.wine.util.MethodUtil;
import com.stone.wine.util.RetEntity;

/**
 * 红酒子类型-控制器
 * 
 * @author stone
 *
 */
@Controller
@RequestMapping("/childtype")
public class WineChildTypeController {
	@Autowired
	private WineChildTypeService childTypeService;

	/**
	 * 添加
	 * 
	 * @param session
	 * @param wineChildType
	 * @return
	 */
	@RequestMapping(value = "/add.json")
	@ResponseBody
	public RetEntity add(HttpSession session, WineChildType wineChildType) {
		if (null == wineChildType) {
			return new RetEntity(ConstantUtil.ILLEGAL, ConstantUtil.ILLEGAL_MSG);
		}
		try {
			wineChildType.setAddTime(MethodUtil.getCurrentDateStr());
			if (childTypeService.insertWineChildType(wineChildType)) {
				return new RetEntity(ConstantUtil.SUCCESS,
						ConstantUtil.SUCCESS_MSG);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new RetEntity(ConstantUtil.ERROR, ConstantUtil.ERROR_MSG);
	}
}
