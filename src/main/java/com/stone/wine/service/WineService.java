package com.stone.wine.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.stone.wine.mapper.WineMapper;
import com.stone.wine.model.Wine;

/**
 * 红酒-业务实现
 * 
 * @author stone
 * 
 */
@Service
public class WineService {
    @Autowired
    private WineMapper wineMapper;

    public boolean insertWine(Wine wine) throws Exception {
        return wineMapper.insertWine(wine) > 0;
    }

    public boolean deleteWine(long id) throws Exception {
        return wineMapper.deleteWine(id) > 0;
    }

    public boolean updateWine(Wine wine) throws Exception {
        return wineMapper.updateWine(wine) > 0;
    }

    public Wine findById(long id) throws Exception {
        return wineMapper.findById(id);
    }

    public List<Wine> queryAll(Wine wine, PageBounds bounds) throws Exception {
        return wineMapper.queryAll(wine, bounds);
    }

    /**
     * 更新推荐
     * 
     * @param recommend
     * @param id
     * @return
     * @throws Exception
     */
    public boolean updateRecommend(int recommend, long id) throws Exception {
        return wineMapper.updateRecommend(recommend, id) > 0;
    }

    /**
     * 更新特价
     * 
     * @param special
     * @param id
     * @return
     * @throws Exception
     */
    public boolean updateSpecial(int special, long id) throws Exception {
        return wineMapper.updateSpecial(special, id) > 0;
    }
}
