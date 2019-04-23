package di7;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

import org.springframework.stereotype.Component;

@Component("c")	// 이 애노테이션이 붙어있는 class는 빈으로 등록된다 ("c")->id값 지정
				// ("c") 을 지정하지 않으면 "car" 클래스명 첫글자 소문자로 바꾼 이름이 id가 된다
public class Car {
	private ChinaTire tire;
	
	public Car() {
		tire = new ChinaTire();
	}
	
	public void drive() {
		System.out.println(tire.getName()+"로 굴러가는 자동차 di7");
	}
	
	@PostConstruct
	public void 마이init() {
		System.out.println("초기화 메서드...");
	}
	@PreDestroy
	public void 마이destroy() {
		System.out.println("소멸자 메서드...");
	}
}
