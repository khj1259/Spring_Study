package diz10;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component
public class Car {
	private Tire tire; 
	
//	public Car(Tire t) {
//		tire = t;
//	}
	
	@Autowired // 맞는 타입을 알아서 넣어줘라
	public void setTire(Tire t) { // setter 로 주입받기
		tire = t; // property injection
	}
	
	public void drive() {
		System.out.println(tire.getName()+"로 굴러가는 자동차 di10");
	}
}
