package aop3;

/**
 * 각각의 공통 관심사항을 시점별로 함수로 나눠서 구현하기
 */
public class MyAspect {
	public void doBefore() { // 핵심관심사항 실행전
		System.out.println("문을 열고 집에 들어감");
	}
	
	public void doAfterReturning() { // 핵심관심사항 정상 실행 후
		System.out.println("불끄고 잔다");
	}
	
	public void doAfterThrowing() { // 핵심 실행 예외 발생
		System.out.println("119에 신고한다");
	}
	
	public void doAfter() { // finally
		System.out.println("문을 열고 나온다");
	}
}
