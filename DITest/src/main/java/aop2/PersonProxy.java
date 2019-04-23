package aop2;

//3. 1의 객체 기능을 호출하는 클래스를 대행자를 만든다
public class PersonProxy implements IPerson{
	private IPerson person;
	
	public void setPerson(IPerson person) {
		this.person = person;
	}
	
	@Override
	public void doSomething() { // 공통적인 부분을 빼서 Proxy에 작성하고
		System.out.println("문을 열고 집에 들어감");
		try {
			person.doSomething(); // 다른 부분은 여기서 호출
			System.out.println("불을 끄고 잔다");
		} catch (Exception e) {
			System.out.println("119에 신고한다");
		}finally {
			System.out.println("문을 열고 나온다");
		}
	}

}
