package com.zzxky.Interceptor;

import java.util.Arrays;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;
//������������
public class zzxkyInterceptor implements MethodInterceptor {

	@Override
	public Object invoke(MethodInvocation invok) throws Throwable {
		// TODO Auto-generated method stub
		System.out.println("������:"+invok.getMethod().getName()+"  ������ʹ����"+Arrays.toString(invok.getArguments())+"  ������");
		//���ؼ���ִ������Ĵ���
		return invok.proceed();
	}

}
