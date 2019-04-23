package aop4;

import java.util.Random;

//2. 인터페이스를 구현해서 원하는 실제 기능을 작성
public class Boy implements IPerson{
	public String doSomething() throws Exception {
		System.out.println("게임을 한다");
		Random ran = new Random();
		boolean r = ran.nextBoolean();
		if(r) {
			throw new Exception("화재발생");
		}
		
		return "I'm a boy";
	}
	
	public void hello() { // 핵심관심객체에 구현외 멤버가 존재할 때
		System.out.println("안녕하세요");
	}
}
