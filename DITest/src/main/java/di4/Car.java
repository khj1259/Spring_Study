package di4;

public class Car {
	private ChinaTire tire;
	
	public Car() {
		tire = new ChinaTire();
	}
	
	public void drive() {
		System.out.println(tire.getName()+"로 굴러가는 자동차 di4 => applicationContext.xml에 빈설정");
	}
}
// 의존성 을 걷어내려면
// 타입, 객체생성 코드를 걷어내야 됨
// 타입을 걷어내기 - 인터페이스를 사용(느슨한 결합)
// 객체생성 - 직접 안만들고 매개변수로 받기 (생성자, Setter 메서드)