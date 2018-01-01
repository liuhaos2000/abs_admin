package com.abs.mobile.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.buzheng.demo.esm.common.mybatis.PageInfo;
import org.springframework.data.domain.Page;

import com.abs.mobile.domain.TItemPicture;
import com.abs.mobile.domain.TItemPictureKey;

public interface TItemPictureMapper {
    int deleteByPrimaryKey(TItemPictureKey key);

    int insert(TItemPicture record);

    int insertSelective(TItemPicture record);

    TItemPicture selectByPrimaryKey(TItemPictureKey key);

    int updateByPrimaryKeySelective(TItemPicture record);

    int updateByPrimaryKey(TItemPicture record);
    /**
     * List用 图片
     */
    Page<Map<String, String>> getItemPictureList(@Param("param1")Map<String, Object> param1,PageInfo pageInfo);
}