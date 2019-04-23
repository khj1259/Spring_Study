package aop1;

public class Girl {
	public void doSomething() {
		System.out.println("문을 열고 집에 들어감");
		try {
			System.out.println("드라마를 본다");
			System.out.println("불을 끄고 잔다");
		} catch (Exception e) {
			System.out.println("119에 신고한다");
		}finally {
			System.out.println("문을 열고 나온다");
		}
	}
}
