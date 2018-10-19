package com.zzxky.Interceptor;

import java.util.Arrays;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;
//方法的拦截器
public class zzxkyInterceptor implements MethodInterceptor {

	@Override
	public Object invoke(MethodInvocation invok) throws Throwable {
		// TODO Auto-generated method stub
		System.out.println("调用了:"+invok.getMethod().getName()+"  方法，使用了"+Arrays.toString(invok.getArguments())+"  参数！");
		//返回继续执行下面的代码
		return invok.proceed();
	}

}
