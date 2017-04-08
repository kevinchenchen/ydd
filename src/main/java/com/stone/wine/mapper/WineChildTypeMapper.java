package com.stone.wine.mapper;

import java.util.List;

import com.stone.wine.model.WineChildType;

public interface WineChildTypeMapper {
	int insertWineChildType(WineChildType wineChildType);

	int deleteWineChildType(long id);

	int deleteWineChildTypeByTypeId(long typeId);

	int updateWineChildType(WineChildType wineChildType);

	List<WineChildType> queryAll();

}
