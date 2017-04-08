package com.stone.wine.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stone.wine.mapper.WineChildTypeMapper;
import com.stone.wine.model.WineChildType;

/**
 * 红酒子类型
 * 
 * @author stone
 *
 */
@Service
public class WineChildTypeService {
	@Autowired
	private WineChildTypeMapper childTypeMapper;

	public boolean insertWineChildType(WineChildType wineChildType)
			throws Exception {
		return childTypeMapper.insertWineChildType(wineChildType) > 0;
	}

	public boolean deleteWineChildType(long id) throws Exception {
		return childTypeMapper.deleteWineChildType(id) > 0;
	}

	public boolean deleteWineChildTypeByTypeId(long typeId) throws Exception {
		return childTypeMapper.deleteWineChildTypeByTypeId(typeId) > 0;
	}

	public boolean updateWineChildType(WineChildType wineChildType)
			throws Exception {
		return childTypeMapper.updateWineChildType(wineChildType) > 0;
	}

	public List<WineChildType> queryAll() throws Exception {
		return childTypeMapper.queryAll();
	}
}
