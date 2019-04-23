package aop2;
/** 
 * aop1 => aop2 복붙
 */
//2. 인터페이스를 구현해서 원하는 실제 기능을 작성
public class Boy implements IPerson{
	public void doSomething() {
		System.out.println("게임을 한다");
	}
}
