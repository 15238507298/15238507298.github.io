package com.zzxky_edu.serviceImpl;

import java.util.List;

import com.zzxky_edu.dao.zzxkyDao;
import com.zzxky_edu.service.zzxkyService;
//serviceʵ�ֲ�
public class zzxkyServiceImpl implements zzxkyService {
    //��ʼ��dao
	public zzxkyDao zzxkyDao;

	public void setZzxkyDao(zzxkyDao zzxkyDao) {
		this.zzxkyDao = zzxkyDao;
	}
    //����dao��Hibernate���ݿ���ӷ���
	@Override
	public void save(Object o) {
		// TODO Auto-generated method stub
		zzxkyDao.save(o);
	}
    //����dao��Hibernate���ݿ�ɾ������
	@Override
	public void remove(Object o) {
		// TODO Auto-generated method stub
		zzxkyDao.remove(o);
	}
    //����dao��Hibernate���ݿ���·���
	@Override
	public void update(Object o) {
		// TODO Auto-generated method stub
		zzxkyDao.update(o);
	}
    //����dao��Hibernate���ݿ��ѯ���з���
	@Override
	public <T> List<T> findAll(Class<T> clss, Object o) {
		// TODO Auto-generated method stub
		return zzxkyDao.findAll(clss, o);
	}
    //����dao��Hibernate���ݿ��ѯ���ֶ�id�ķ���
	@Override
	public <T> T getById(Class<T> clss, Integer id) {
		// TODO Auto-generated method stub
		return zzxkyDao.getById(clss, id);
	}
    //����dao��Hibernate���ݿ�������ѯ����
	@Override
	public <T> List<T> findByWhere(Class<T> clss, String content) {
		// TODO Auto-generated method stub
		return zzxkyDao.findByWhere(clss, content);
	}
	//��ҳЧ��
	@Override
	public <T> List<T> findByPage(Class<T> clss,String sql, Integer page) {
		// TODO Auto-generated method stub
		return zzxkyDao.findByPage(clss,sql,page);
	}

}
