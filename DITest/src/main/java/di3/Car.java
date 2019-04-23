package di3;

public class Car {
	private Tire tire; // 다형성 : 부모의 참조변수에 자식의 객체를 저장할 수 있는 성질
	
//	public Car(Tire t) {
//		tire = t;
//	}
	
	public void setTire(Tire t) { // setter 로 주입받기
		tire = t; // property injection
	}
	
	public void drive() {
		System.out.println(tire.getName()+"로 굴러가는 자동차 di3");
	}
}
// 의존성 을 걷어내려면
// 타입, 객체생성 코드를 걷어내야 됨
// 타입을 걷어내기 - 인터페이스를 사용(느슨한 결합)
// 객체생성 - 직접 안만들고 매개변수로 받기 (생성자, Setter 메서드)
// 	생성자로 작업 -> Car, KoreaTire, ChinaTire 간의 의존성이 사라짐