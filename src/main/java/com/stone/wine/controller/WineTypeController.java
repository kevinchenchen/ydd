package com.stone.wine.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.stone.wine.bo.SortObj;
import com.stone.wine.model.WineType;
import com.stone.wine.service.WineTypeService;
import com.stone.wine.util.ConstantUtil;
import com.stone.wine.util.RetEntity;

@Controller
@RequestMapping("/winetype")
public class WineTypeController {

	@Autowired
	private WineTypeService wineTypeService;

	/**
	 * 新增
	 * 
	 * @return
	 */
	@RequestMapping(value = "add.json")
	@ResponseBody
	public RetEntity add(HttpServletRequest request, WineType wineType) {
		request.getSession().getAttribute(ConstantUtil.SESSION_ADMIN_LOGIN);
		if (null == wineType) {
			return new RetEntity(ConstantUtil.ILLEGAL, ConstantUtil.ILLEGAL_MSG);
		}
		try {
			// 文件是否存在
			List<WineType> wineTypes = wineTypeService.queryByName(wineType
					.getName());

			if (null != wineTypes && wineTypes.size() > 0) {
				return new RetEntity(ConstantUtil.EXIST, ConstantUtil.EXIST_MSG);
			}
			if (wineTypeService.insertWineType(wineType)) {
				return new RetEntity(ConstantUtil.SUCCESS,
						ConstantUtil.SUCCESS_MSG, wineType);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new RetEntity(ConstantUtil.ERROR, ConstantUtil.ERROR_MSG);
		}
		return new RetEntity(ConstantUtil.FAILED, ConstantUtil.FAILED_MSG);
	}

	/**
	 * 删除
	 * 
	 * @return
	 */
	@RequestMapping(value = "del.json")
	@ResponseBody
	public RetEntity del(HttpSession session, Long id) {
		session.getAttribute(ConstantUtil.SESSION_ADMIN_LOGIN);
		if (null == id) {
			return new RetEntity(ConstantUtil.ILLEGAL, ConstantUtil.ILLEGAL_MSG);
		}
		try {
			if (wineTypeService.deleteWineType(id)) {
				return new RetEntity(ConstantUtil.SUCCESS,
						ConstantUtil.SUCCESS_MSG);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new RetEntity(ConstantUtil.ERROR, ConstantUtil.ERROR_MSG);
		}
		return new RetEntity(ConstantUtil.FAILED, ConstantUtil.FAILED_MSG);
	}

	/**
	 * 删除
	 * 
	 * @return
	 */
	@RequestMapping(value = "update.json")
	@ResponseBody
	public RetEntity update(HttpSession session, WineType wineType) {
		session.getAttribute(ConstantUtil.SESSION_ADMIN_LOGIN);
		if (null == wineType) {
			return new RetEntity(ConstantUtil.ILLEGAL, ConstantUtil.ILLEGAL_MSG);
		}
		try {
			// List<WineType> wineTypes = wineTypeService.queryByName(wineType
			// .getName());
			// if (null != wineTypes && wineTypes.size() > 0) {
			// return new RetEntity(ConstantUtil.EXIST, ConstantUtil.EXIST_MSG);
			// }
			if (wineTypeService.updateWineType(wineType)) {
				return new RetEntity(ConstantUtil.SUCCESS,
						ConstantUtil.SUCCESS_MSG);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new RetEntity(ConstantUtil.ERROR, ConstantUtil.ERROR_MSG);
		}
		return new RetEntity(ConstantUtil.FAILED, ConstantUtil.FAILED_MSG);
	}

	/**
	 * 单个查询
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/findbyid.json")
	@ResponseBody
	public RetEntity findById(Long id) {
		if (null == id) {
			return new RetEntity(ConstantUtil.ILLEGAL, ConstantUtil.ILLEGAL_MSG);
		}
		WineType wineType = null;
		try {
			wineType = wineTypeService.findById(id);
			if (null != wineType) {
				return new RetEntity(ConstantUtil.SUCCESS,
						ConstantUtil.SUCCESS_MSG, wineType);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new RetEntity(ConstantUtil.ERROR, ConstantUtil.ERROR_MSG,
					wineType);
		}
		return new RetEntity(ConstantUtil.FAILED, ConstantUtil.FAILED_MSG,
				wineType);
	}

	/**
	 * 条件查询
	 * 
	 * @param wineType
	 * @param page
	 * @param size
	 * @return
	 */
	@RequestMapping(value = "/list.json")
	@ResponseBody
	public String queryList(HttpServletRequest request, WineType wineType,
			@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "size", defaultValue = "10") int size) {
		JSONObject resultJson = new JSONObject();
		List<WineType> wineTypes = null;
		try {
			PageBounds pageBounds = new PageBounds(page, size);
			wineTypes = wineTypeService.selectInnerChildType(wineType,
					pageBounds);
			PageList<WineType> pageList = (PageList<WineType>) wineTypes;
			int totalCount = pageList.getPaginator().getTotalCount();
			resultJson.put("data", wineTypes);
			resultJson.put("recordsTotal", totalCount);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultJson.toString();
	}

	/**
	 * 保存排序
	 * 
	 * @param session
	 * @param sortObjs
	 * @return
	 */
	@RequestMapping(value = "/savesort")
	@ResponseBody
	public RetEntity saveSort(HttpSession session,
			@RequestParam(value = "ids") String ids) {
		session.getAttribute(ConstantUtil.SESSION_ADMIN_LOGIN);
		if (null == ids) {
			return new RetEntity(ConstantUtil.ILLEGAL, ConstantUtil.ILLEGAL_MSG);
		}
		try {
			String[] idArrays = ids.split(",");
			List<SortObj> sortObjs = new ArrayList<SortObj>();
			for (int i = 0; i < idArrays.length; i++) {
				sortObjs.add(new SortObj(idArrays[i], i + ""));
			}
			if (wineTypeService.updateWineTypeSort(sortObjs)) {
				return new RetEntity(ConstantUtil.SUCCESS,
						ConstantUtil.SUCCESS_MSG);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new RetEntity(ConstantUtil.FAILED, ConstantUtil.FAILED_MSG);
	}

	public String queryListTemp(HttpServletRequest request, WineType wineType,
			@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "size", defaultValue = "10") int size) {
		JSONObject resultJson = new JSONObject();
		List<WineType> wineTypes = null;
		try {
			int draw = Integer.parseInt(request.getParameter("draw"));
			int start = Integer.parseInt(request.getParameter("start"));
			page = (start / size) + 1;
			PageBounds pageBounds = new PageBounds(page, size);
			wineTypes = wineTypeService.queryList(wineType, pageBounds);
			PageList<WineType> pageList = (PageList<WineType>) wineTypes;
			int totalCount = pageList.getPaginator().getTotalCount();
			resultJson.put("data", wineTypes);
			resultJson.put("start", start);
			resultJson.put("recordsTotal", totalCount);
			resultJson.put("recordsFiltered", totalCount);
			resultJson.put("draw", draw);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultJson.toString();
	}
}
