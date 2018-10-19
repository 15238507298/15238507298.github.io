package com.zzxky_edu.dao;

import java.util.List;

public interface zzxkyDao {

    //添加数据库中的数据
    public void save(Object o);
    //删除数据库中的数据
    public void remove(Object o);
    //更新数据库中的数据
    public void update(Object o);
    //通过类获取表中所有的信息
    public <T> List<T> findAll(Class<T> clss,Object o);
    //通过get id的方式获取单条数据
    public <T> T getById(Class<T> clss,Integer id);
    //通过添加条件语句查询数据库
    public <T> List<T> findByWhere(Class<T> clss,String content);
    //分页查询
    public <T> List<T> findByPage(Class<T> clss,String sql,Integer page);
}
