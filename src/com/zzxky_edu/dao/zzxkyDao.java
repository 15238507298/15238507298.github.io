package com.zzxky_edu.dao;

import java.util.List;

public interface zzxkyDao {

    //������ݿ��е�����
    public void save(Object o);
    //ɾ�����ݿ��е�����
    public void remove(Object o);
    //�������ݿ��е�����
    public void update(Object o);
    //ͨ�����ȡ�������е���Ϣ
    public <T> List<T> findAll(Class<T> clss,Object o);
    //ͨ��get id�ķ�ʽ��ȡ��������
    public <T> T getById(Class<T> clss,Integer id);
    //ͨ�������������ѯ���ݿ�
    public <T> List<T> findByWhere(Class<T> clss,String content);
    //��ҳ��ѯ
    public <T> List<T> findByPage(Class<T> clss,String sql,Integer page);
}
