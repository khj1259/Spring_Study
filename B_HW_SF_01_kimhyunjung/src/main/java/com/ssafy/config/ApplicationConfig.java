package com.ssafy.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration // 설정파일임을 표시하는 것
@ComponentScan(basePackages = {"com"})
public class ApplicationConfig {

}
