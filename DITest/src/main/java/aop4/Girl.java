package aop4;

import java.util.Random;

//2. 인터페이스를 구현해서 원하는 실제 기능을 작성
public class Girl implements IPerson{
	
	public String doSomething() throws Exception {
		System.out.println("드라마를 본다");
		Random ran = new Random();
		boolean r = ran.nextBoolean();
		if(r) {
			throw new Exception("화재발생");
		}
		
		return "I'm a girl";
	}
}
