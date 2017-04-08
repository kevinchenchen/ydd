package com.stone.wine.controller;

import java.net.URLDecoder;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.stone.wine.model.Wine;
import com.stone.wine.model.WineChildType;
import com.stone.wine.model.WineType;
import com.stone.wine.service.WineChildTypeService;
import com.stone.wine.service.WineService;
import com.stone.wine.service.WineTypeService;
import com.stone.wine.util.WebHtmlUtil;

/**
 * 首页
 * 
 * @author stone
 * 
 */
@Controller
public class IndexController {
    @Autowired
    private WineService wineService;

    @Autowired
    private WineTypeService wineTypeService;

    @Autowired
    private WineChildTypeService childTypeService;

    /**
     * web端首页
     * 
     * @return
     */
    @RequestMapping(value = "/web/index")
    public ModelAndView webIndex() {
        PageBounds bounds = new PageBounds();
        bounds.setPage(1);
        ModelAndView mv = new ModelAndView();
        Wine wine = new Wine();
        try {
            // 推荐查询
            wine.setRecommend("1");
            bounds.setLimit(8);
            String recommendHtml = WebHtmlUtil
                    .getWebIndexRecommendHtml(wineService
                            .queryAll(wine, bounds));
            // 特价查询
            bounds.setLimit(5);
            wine.setRecommend(null);
            wine.setSpecial("1");
            String specialHtml = WebHtmlUtil.getWebIndexSpecialHtml(wineService
                    .queryAll(wine, bounds));

            // 红酒
            String winesHtml = WebHtmlUtil
                    .getWebIndexWineGroupHtml(wineTypeService
                            .queryWineByTypeGroup());

            // 红酒类型
            List<WineType> types = wineTypeService.selectInnerChildType(
                    new WineType(), new PageBounds());

            mv.addObject("recommendHtml", recommendHtml);
            mv.addObject("specialHtml", specialHtml);
            mv.addObject("winesHtml", winesHtml);
            mv.addObject("types", types);
        } catch (Exception e) {
            e.printStackTrace();
        }
        mv.setViewName("/web/index");
        return mv;
    }

    /**
     * web端详情页
     * 
     * @return
     */
    @RequestMapping(value = "/web/detail")
    public ModelAndView webDetail(Long id) {
        ModelAndView mv = new ModelAndView();
        try {
            if (null != id) {
                Wine wine = wineService.findById(id);
                List<WineType> types = wineTypeService.queryList(
                        new WineType(), new PageBounds());
                List<WineChildType> childTypes = childTypeService.queryAll();
                List<Wine> wines = wineService.queryAll(new Wine(),
                        new PageBounds(1, 5));
                mv.addObject("wine", wine);
                mv.addObject("pimg", wine.getPimg().split(";"));
                mv.addObject("types", types);
                mv.addObject("childTypes", childTypes);
                mv.addObject("wines", wines);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        mv.setViewName("/web/detail");
        return mv;
    }

    /**
     * web端搜索
     * 
     * @return
     */
    @RequestMapping(value = "/web/search")
    public ModelAndView webSearch(String wine) {
        ModelAndView mv = new ModelAndView();
        try {
            if (null != wine && !"".equals(wine)) {
                wine = URLDecoder.decode(wine, "UTF-8");
                Wine wineObj = new Wine();
                wineObj.setName("%" + wine + "%");
                List<Wine> wines = wineService.queryAll(wineObj,
                        new PageBounds(1, 20));
                mv.addObject("wines", wines);
                mv.addObject("searchText", wine);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        mv.setViewName("/web/search");
        return mv;
    }
}
