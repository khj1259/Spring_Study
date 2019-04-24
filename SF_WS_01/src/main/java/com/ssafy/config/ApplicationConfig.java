package com.ssafy.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

import com.ssafy.model.repository.BookRepositoryImpl;
import com.ssafy.model.service.BookServiceImpl;

@Configuration // 설정파일임을 표시
@ComponentScan(basePackageClasses = { BookRepositoryImpl.class, BookServiceImpl.class}) // 패키지를 스캔
public class ApplicationConfig {
	
}
