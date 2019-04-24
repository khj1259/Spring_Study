package com.ssafy.client;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.ssafy.config.ApplicationConfig;
import com.ssafy.model.service.BookService;

public class Client {
	public static void main(String[] args) {
		ApplicationContext context = new AnnotationConfigApplicationContext(ApplicationConfig.class);
		
		BookService service = context.getBean("bookService", BookService.class);
		service.seletAll();
	}
}
