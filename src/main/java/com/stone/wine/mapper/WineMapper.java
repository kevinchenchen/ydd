package com.stone.wine.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.stone.wine.model.Wine;

public interface WineMapper {
    int insertWine(Wine wine);

    int deleteWine(long id);

    int updateWine(Wine wine);

    Wine findById(long id);

    List<Wine> queryAll(Wine wine, PageBounds bounds);

    int updateRecommend(@Param("recommend") int recommend, @Param("id") long id);

    int updateSpecial(@Param("special") int special, @Param("id") long id);
}
