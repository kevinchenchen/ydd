package com.stone.wine.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.stone.wine.model.WineType;
import com.stone.wine.service.WineTypeService;

/**
 * 后台管理
 * 
 * @author stone
 *
 */
@Controller
@RequestMapping("/backstage")
public class BackstageController {

	@Autowired
	private WineTypeService typeService;

	/**
	 * 红酒后台管理页面
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
		mv.setViewName("backstage/bs_wine");
		return mv;
	}

	/**
	 * 红酒类型后台管理页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/winetypepage")
	public ModelAndView wineTypePage() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("backstage/bs_winetype");
		return mv;
	}
}
