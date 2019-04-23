package di8;

import org.springframework.stereotype.Component;

@Component // koreaTire
public class KoreaTire implements Tire{
	public String getName() {
		return "국산 타이어";
	}
}
