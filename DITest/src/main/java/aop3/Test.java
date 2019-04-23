package aop3;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

/*
 * AOP : 관점에 따라 구분
 * 핵심 관심사항
 * 공통 관심사항
 * OOP 단점을 보완 : AOP를 통해서 핵심 관심사항과 공통 관심사항을 분리해서 구현
 * 
 * 공통관심사항을 적용할 코드 + 적용지점
 * Pointcut - AOP 구성을 위해서 지정한 시점
 * Aspect : AOP 구현체
 * (mavenrepository - AspectJ Weaver, AspectJ Runtime -> pom.xml에 추가)
 */
public class Test {
	public static void main(String[] args) {
		ApplicationContext context = new GenericXmlApplicationContext("aop3/applicationContext.xml");
		
		// 위빙 : 핵심관심사항, 공통관심사항을 하나로 묶는 작업
		IPerson boy = context.getBean("boy", IPerson.class); // 부모타입으로 받지 않으면 위빙이 안됨
		try {
			boy.doSomething();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
}
