package com.dp.baobao.domain;

import org.apache.ibatis.type.Alias;

/**
 * Created by dpyang on 2015/1/23.
 */
@Alias("IQuery")
public interface IQuery {
    public String getId();
}
