package di9;

import org.springframework.stereotype.Component;

@Component
public class KoreaTire implements Tire{
	public String getName() {
		return "국산 타이어";
	}
}
