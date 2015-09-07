package org.buzheng.demo.esm.service.impl;


import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.buzheng.demo.esm.common.mybatis.PageInfo;
import org.buzheng.demo.esm.dao.SysTypeDao;
import org.buzheng.demo.esm.domain.SysType;
import org.buzheng.demo.esm.domain.SysUser;
import org.buzheng.demo.esm.service.SysTypeService;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import com.abs.util.exception.DataExistsException;

@Service
public class SysTypeServiceImpl implements SysTypeService {
	
	@Resource
	private SysTypeDao sysTypeDao;

    @Override
    public void save(SysType type,SysUser user) throws DataExistsException {
        
        if (type == null) {
            return;
        }
        
        // 数据Ｃｈｅｃｋ
        this.validate(type);
        // 业务Ｃｈｅｃｋ
        if (this.sysTypeDao.countByTypeName(type.getTypeName()) > 0) {
            throw new DataExistsException("sys.com.exists");
        }
        //
        Date date = new Date();
        type.setDeleteFlg("0");
        type.setVerNum(0);
        type.setcUser(user.getUserId());
        type.setcDate(date);
        type.setuUser(user.getUserId());
        type.setuDate(date);
        this.sysTypeDao.insert(type);
        
    }

    private void validate(SysType type) {
        if (StringUtils.isEmpty(type.getTypeName())) {
            throw new IllegalArgumentException("type.name.required");
        }
        if(type.getTypeName().length()>100){
            throw new IllegalArgumentException("type.name.length");
        }
    }

    @Override
    public void update(SysType type) throws DataExistsException {
       
        if (type == null) {
            return;
        }
        this.validate(type);
        //排他处理
        SysType oldType = sysTypeDao.selectByPrimaryKey(type.getTypeCode());
        
        if(oldType==null){
            throw new DataExistsException("sys.com.paita");
        } else if(oldType.getVerNum().compareTo(type.getVerNum())!=0) {
            throw new DataExistsException("sys.com.paita");
        }
        
        type.setVerNum(oldType.getVerNum()+1);
        this.sysTypeDao.updateByPrimaryKey(type);
        
    }

    @Override
    public void delete(String typeCode) {
        this.sysTypeDao.deleteByPrimaryKey(Integer.valueOf(typeCode));
    }

    @Override
    public Page<SysType> findPage(PageInfo pageInfo) {
        return this.sysTypeDao.findPage(pageInfo);
    }

    @Override
    public Page<SysType> findPage(Map<String, Object> params, PageInfo pageInfo) {
        // TODO Auto-generated method stub
        return null;
    }



	
	
}
