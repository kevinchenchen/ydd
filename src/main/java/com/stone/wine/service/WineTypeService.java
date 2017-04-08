package com.stone.wine.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.stone.wine.bo.SortObj;
import com.stone.wine.mapper.WineTypeMapper;
import com.stone.wine.model.WineType;
import com.stone.wine.util.MethodUtil;

/**
 * 红酒分类
 * 
 * @author stone
 * 
 */
@Service
public class WineTypeService {
	@Autowired
	private WineTypeMapper wineTypeMapper;

	@Autowired
	private WineChildTypeService childTypeService;

	/**
	 * 新增
	 * 
	 * @param wineType
	 * @return
	 * @throws Exception
	 */
	public boolean insertWineType(WineType wineType) throws Exception {
		if (null == wineType) {
			return false;
		}
		// 设置添加日期
		wineType.setAddTime(MethodUtil.getCurrentDateStr());
		if (wineTypeMapper.insertWineType(wineType) > 0) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 删除
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public boolean deleteWineType(Long id) throws Exception {
		if (null == id) {
			return false;
		}
		if (wineTypeMapper.deleteWineType(id) > 0) {
			childTypeService.deleteWineChildTypeByTypeId(id);
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 更新
	 * 
	 * @param wineType
	 * @return
	 * @throws Exception
	 */
	public boolean updateWineType(WineType wineType) throws Exception {
		if (null == wineType) {
			return false;
		}
		if (wineTypeMapper.updateWineType(wineType) > 0) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 根据ID查找
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public WineType findById(Long id) throws Exception {
		if (null == id) {
			return null;
		}
		return wineTypeMapper.findById(id);
	}

	/**
	 * 根据名称查询
	 * 
	 * @param wineType
	 * @param pageBounds
	 * @return
	 * @throws Exception
	 */
	public List<WineType> queryByName(String name) throws Exception {
		return wineTypeMapper.queryByName(name);
	}

	/**
	 * 条件查询
	 * 
	 * @param wineType
	 * @param pageBounds
	 * @return
	 * @throws Exception
	 */
	public List<WineType> queryList(WineType wineType, PageBounds pageBounds)
			throws Exception {
		return wineTypeMapper.queryList(wineType, pageBounds);
	}

	/**
	 * 联合子类型查询
	 * 
	 * @param wineType
	 * @param pageBounds
	 * @return
	 */
	public List<WineType> selectInnerChildType(WineType wineType,
			PageBounds pageBounds) {
		return wineTypeMapper.selectInnerChildType(wineType, pageBounds);
	}

	/**
	 * 分类查询红酒
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<WineType> queryWineByTypeGroup() throws Exception {
		return wineTypeMapper.queryWineByTypeGroup();
	}

	/**
	 * 跟新排序
	 * 
	 * @param wineTypes
	 * @return
	 * @throws Exception
	 */
	public boolean updateWineTypeSort(List<SortObj> sortObjs) throws Exception {
		return wineTypeMapper.updateWineTypeSort(sortObjs) > 0;
	}

}
