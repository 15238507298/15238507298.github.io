package com.zzxky_edu.serviceImpl;

import java.util.List;

import com.zzxky_edu.dao.zzxkyDao;
import com.zzxky_edu.service.zzxkyService;
//service实现层
public class zzxkyServiceImpl implements zzxkyService {
    //初始化dao
	public zzxkyDao zzxkyDao;

	public void setZzxkyDao(zzxkyDao zzxkyDao) {
		this.zzxkyDao = zzxkyDao;
	}
    //调用dao层Hibernate数据库添加方法
	@Override
	public void save(Object o) {
		// TODO Auto-generated method stub
		zzxkyDao.save(o);
	}
    //调用dao层Hibernate数据库删除方法
	@Override
	public void remove(Object o) {
		// TODO Auto-generated method stub
		zzxkyDao.remove(o);
	}
    //调用dao层Hibernate数据库更新方法
	@Override
	public void update(Object o) {
		// TODO Auto-generated method stub
		zzxkyDao.update(o);
	}
    //调用dao层Hibernate数据库查询所有方法
	@Override
	public <T> List<T> findAll(Class<T> clss, Object o) {
		// TODO Auto-generated method stub
		return zzxkyDao.findAll(clss, o);
	}
    //调用dao层Hibernate数据库查询表字段id的方法
	@Override
	public <T> T getById(Class<T> clss, Integer id) {
		// TODO Auto-generated method stub
		return zzxkyDao.getById(clss, id);
	}
    //调用dao层Hibernate数据库条件查询方法
	@Override
	public <T> List<T> findByWhere(Class<T> clss, String content) {
		// TODO Auto-generated method stub
		return zzxkyDao.findByWhere(clss, content);
	}
	//分页效果
	@Override
	public <T> List<T> findByPage(Class<T> clss,String sql, Integer page) {
		// TODO Auto-generated method stub
		return zzxkyDao.findByPage(clss,sql,page);
	}

}
