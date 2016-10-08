package com.abs.mobile.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.abs.mobile.dao.TIndexLunboMapper;
import com.abs.mobile.domain.TIndexLunbo;
import com.abs.mobile.service.LunboService;

@Service
public class LunboServiceImpl implements LunboService {

    @Resource
    TIndexLunboMapper tIndexLunboMapper;

	@Override
	public List<TIndexLunbo> getLunboList() {
		
		return tIndexLunboMapper.getLunboList();
	}

	@Override
	public void addLunbo(TIndexLunbo tIndexLunbo) {
		if (StringUtils.isEmpty(tIndexLunbo.getImgPath())) {
			throw new IllegalArgumentException("lunbo.imgurl.required");
		}
		tIndexLunboMapper.insert(tIndexLunbo);
	}

	@Override
	public void updLunbo(TIndexLunbo tIndexLunbo) {
		
		if (tIndexLunbo == null) 
			return;
		
		if (StringUtils.isEmpty(tIndexLunbo.getImgPath())) {
			throw new IllegalArgumentException("lunbo.imgurl.required");
		}
		
		tIndexLunboMapper.updateByPrimaryKey(tIndexLunbo);
		
	}

	@Override
	public void delLunbo(String id) {
		tIndexLunboMapper.deleteByPrimaryKey(Integer.valueOf(id));
	}
}
