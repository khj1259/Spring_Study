package diz10;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration // 이 자바파일은 설정 파일임
//@ComponentScan(basePackages = {"diz10"}) // 지정한 패키지의 모든 클래스를 알아서 스캔
@ComponentScan(basePackageClasses = {Car.class}) // 지정한 클래스가 속해있는 패키지 전체의 클래스를 스캔
public class ApplicationConfig {
//	// 자바 설정파일을 이용해서 빈을 등록하기
//	@Bean // 객체관리를 받을 빈 객체임을 표시
//	public KoreaTire koreaTire() { // 메서드명 koreaTire가 빈의 아이디
//		KoreaTire tire = new KoreaTire();
//		return tire;
//	}
//	@Bean
//	public Car car(Tire tire) {
//		Car c = new Car();
//		c.setTire(tire);
//		return c;
//	}
	
	
}
