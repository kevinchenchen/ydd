package com.stone.wine.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import com.stone.wine.model.Wine;
import com.stone.wine.model.WineType;
import com.stone.wine.service.WineService;
import com.stone.wine.service.WineTypeService;
import com.stone.wine.util.ConstantUtil;
import com.stone.wine.util.MethodUtil;
import com.stone.wine.util.RetEntity;

/**
 * 红酒实现
 * 
 * @author stone
 * 
 */
@Controller
@RequestMapping("/wine")
public class WineController {

	@Autowired
	private WineService wineService;

	@Autowired
	private WineTypeService typeService;

	/**
	 * 酒管理页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/winepage")
	public ModelAndView winePage() {
		ModelAndView mv = new ModelAndView();
		try {
			List<WineType> types = typeService.queryList(new WineType(),
					new PageBounds());
			mv.addObject("types", types);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("/backstage/wine");
		return mv;
	}

	/**
	 * 查询
	 * 
	 * @param request
	 * @param wineType
	 * @param page
	 * @param size
	 * @return
	 */
	@RequestMapping(value = "/list.json")
	@ResponseBody
	public String queryListTemp(HttpServletRequest request, Wine wine,
			@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "size", defaultValue = "10") int size) {
		JSONObject resultJson = new JSONObject();
		List<Wine> wineTypes = null;
		try {
			int draw = Integer.parseInt(request.getParameter("draw"));
			int start = Integer.parseInt(request.getParameter("start"));
			page = (start / size) + 1;
			PageBounds pageBounds = new PageBounds(page, size);
			wineTypes = wineService.queryAll(wine, pageBounds);
			PageList<Wine> pageList = (PageList<Wine>) wineTypes;
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

	/**
	 * 搜索
	 * 
	 * @param page
	 * @param size
	 * @param name
	 * @return
	 */
	@RequestMapping(value = "/search")
	@ResponseBody
	public RetEntity search(
			@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "size", defaultValue = "10") int size,
			@RequestParam(value = "name") String name) {
		List<Wine> wines = null;
		try {
			if (null != name && !"".equals(name)) {
				wines = wineService.queryAll(new Wine("%" + name + "%"),
						new PageBounds(page, size));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new RetEntity(ConstantUtil.SUCCESS, ConstantUtil.SUCCESS_MSG,
				wines);
	}

	/**
	 * 添加
	 * 
	 * @param session
	 * @param wine
	 * @return
	 */
	@RequestMapping(value = "/add.json")
	@ResponseBody
	public RetEntity add(HttpSession session, Wine wine) {
		session.getAttribute(ConstantUtil.SESSION_ADMIN_LOGIN);
		if (null == wine) {
			return new RetEntity(ConstantUtil.ILLEGAL, ConstantUtil.ILLEGAL_MSG);
		}
		wine.setAddtime(MethodUtil.getCurrentDateStr());
		try {
			if (wineService.insertWine(wine)) {
				return new RetEntity(ConstantUtil.SUCCESS,
						ConstantUtil.SUCCESS_MSG);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new RetEntity(ConstantUtil.ERROR, ConstantUtil.ERROR_MSG);
	}

	/**
	 * 添加
	 * 
	 * @param session
	 * @param wine
	 * @return
	 */
	@RequestMapping(value = "/update.json")
	@ResponseBody
	public RetEntity update(HttpSession session, Wine wine) {
		session.getAttribute(ConstantUtil.SESSION_ADMIN_LOGIN);
		if (null == wine) {
			return new RetEntity(ConstantUtil.ILLEGAL, ConstantUtil.ILLEGAL_MSG);
		}
		wine.setAddtime(MethodUtil.getCurrentDateStr());
		try {
			if (wineService.updateWine(wine)) {
				return new RetEntity(ConstantUtil.SUCCESS,
						ConstantUtil.SUCCESS_MSG);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new RetEntity(ConstantUtil.ERROR, ConstantUtil.ERROR_MSG);
	}

	/**
	 * 删除
	 * 
	 * @param session
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/del.json")
	@ResponseBody
	public RetEntity del(HttpSession session, Long id) {
		session.getAttribute(ConstantUtil.SESSION_ADMIN_LOGIN);
		if (null != id) {
			try {
				if (wineService.deleteWine(id)) {
					return new RetEntity(ConstantUtil.SUCCESS,
							ConstantUtil.SUCCESS_MSG);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return new RetEntity(ConstantUtil.ERROR, ConstantUtil.ERROR_MSG);
	}

	/**
	 * 设置商品为推荐
	 * 
	 * @return
	 */
	@RequestMapping(value = "/setrecmd.json")
	@ResponseBody
	public RetEntity setrecommend(int recommend, long id) {
		try {
			if (wineService.updateRecommend(recommend, id)) {
				return new RetEntity(ConstantUtil.SUCCESS,
						ConstantUtil.SUCCESS_MSG);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new RetEntity(ConstantUtil.ERROR, ConstantUtil.ERROR_MSG);
	}

	/**
	 * 设置商品为特价
	 * 
	 * @return
	 */
	@RequestMapping(value = "/setscl.json")
	@ResponseBody
	public RetEntity setspecial(int special, long id) {
		try {
			if (wineService.updateSpecial(special, id)) {
				return new RetEntity(ConstantUtil.SUCCESS,
						ConstantUtil.SUCCESS_MSG);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new RetEntity(ConstantUtil.ERROR, ConstantUtil.ERROR_MSG);
	}
}
