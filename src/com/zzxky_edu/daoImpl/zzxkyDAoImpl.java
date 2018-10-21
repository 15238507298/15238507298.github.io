package com.zzxky_edu.daoImpl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.zzxky_edu.dao.zzxkyDao;

@Repository
public class zzxkyDAoImpl extends HibernateDaoSupport implements zzxkyDao {

	// ������ݿ��е�����
	@Override
	public void save(Object o) {

		getHibernateTemplate().save(o);

	}

	// ɾ�����ݿ��е�����
	@Override
	public void remove(Object o) {

		getHibernateTemplate().delete(o);

	}

	// �������ݿ��е�����
	@Override
	public void update(Object o) {

		getHibernateTemplate().update(o);

	}

	// ͨ�����ȡ�������е���Ϣ
	@Override
	public <T> List<T> findAll(Class<T> clss, Object o) {

		List<T> results = getHibernateTemplate().find("from  " + o.getClass().getSimpleName(), null);
		return results;
	}

	// ͨ��get id�ķ�ʽ��ȡ��������
	@Override
	public <T> T getById(Class<T> clss, Integer id) {

		T result = getHibernateTemplate().get(clss, id);

		return result;
	}

	// ͨ�������������ѯ���ݿ�
	@Override
	public <T> List<T> findByWhere(Class<T> clss, String content) {

		List<T> results =   getHibernateTemplate().getSessionFactory().getCurrentSession()
				.createQuery(" from " + clss.getSimpleName() + " where " + content).list();
		return results;

	}
	// ͨ�������������ѯ���ݿ�
	@Override
	public <T> List<T> findByPage(Class<T> clss,String sql,Integer page) {
		HibernateTemplate template = getHibernateTemplate();
		List<T> Objects = template.executeFind(new HibernateCallback() {
			@Override
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				// TODO Auto-generated method stub
				Query query = session.createQuery("from "+clss.getSimpleName() +" "+sql);
				query.setFirstResult(((page-1)*10)+0);
				query.setMaxResults(10);
				List resultList = query.list();
				return resultList;
			}
		});
		return Objects;

	}
}
