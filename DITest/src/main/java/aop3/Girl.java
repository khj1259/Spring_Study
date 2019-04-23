package aop3;

//2. 인터페이스를 구현해서 원하는 실제 기능을 작성
public class Girl implements IPerson{
	public void doSomething() {
		System.out.println("드라마를 본다");
	}
}
