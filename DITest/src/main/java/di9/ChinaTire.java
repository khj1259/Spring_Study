package di9;

import org.springframework.stereotype.Component;

@Component("t") 
public class ChinaTire implements Tire{
	public String getName() {
		return "중국산 타이어";
	}
}
