package di4_1;

import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;

public class Car implements InitializingBean, DisposableBean{
	private ChinaTire tire;
	
	public Car() {
		tire = new ChinaTire();
		System.out.println("Car 생성자");
	}
	
	public void drive() {
		System.out.println(tire.getName()+"로 굴러가는 자동차 di4_1=> applicationContext.xml에 빈설정");
	}
	public void 마이initMethod() {
		System.out.println("객체 초기화시 호출");
	}
	public void 마이destroyMethod() {
		System.out.println("객체 죽을때 호출");
	}

	@Override
	public void afterPropertiesSet() throws Exception { // 초기화시 호출되는 콜백메서드
		System.out.println("얘도 초기화시 호출됨");
	}

	@Override
	public void destroy() throws Exception { // 객체 소멸시 호출되는 콜백 메서드
		System.out.println("얘도 객체 소멸시 호출됨");
	}
}
// 초기화/소멸 메서드 지정하는 방법
// 1. xml Bean 등록시 설정
// 2. 인터페이스를 구현하는 방법 : InitializingBean, DisposableBean
// 3. 애노테이션을 이용한 방법