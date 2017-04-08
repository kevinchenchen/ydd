package com.stone.wine.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.stone.wine.bo.SortObj;
import com.stone.wine.model.WineType;

public interface WineTypeMapper {
	int insertWineType(WineType wineType);

	int deleteWineType(long id);

	int updateWineType(WineType wineType);

	WineType findById(long id);

	List<WineType> queryList(WineType wineType, PageBounds pageBounds);

	List<WineType> queryByName(String name);

	List<WineType> selectInnerChildType(WineType wineType, PageBounds pageBounds);

	List<WineType> queryWineByTypeGroup();

	int updateWineTypeSort(@Param("sortObjs") List<SortObj> sortObjs);
}
