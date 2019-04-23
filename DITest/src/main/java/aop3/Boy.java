package aop3;

import java.util.Random;

//2. 인터페이스를 구현해서 원하는 실제 기능을 작성
public class Boy implements IPerson{
	// 오버라이딩 : 부모의 메서드를 자식클래스에서 재정의
	// 조건 : 선언부는 동일해야함, 
	// 		부모의 제어자보다 자식의 제어자가 더 넓은 범위로 갈 수 있다
	//		부모의 예외처리보다 더 많은 예외를 선언해서는 안된다
	public void doSomething() throws Exception {
		System.out.println("게임을 한다");
		Random ran = new Random();
		boolean r = ran.nextBoolean();
		if(r) {
			throw new Exception("화재발생");
		}
	}
}
