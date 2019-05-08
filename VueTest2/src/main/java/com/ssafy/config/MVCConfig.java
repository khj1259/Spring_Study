package com.ssafy.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.ssafy.controller.ProductController;


@Configuration
@EnableWebMvc
@ComponentScan(basePackageClasses= {ProductController.class})
public class MVCConfig extends WebMvcConfigurerAdapter {
	@Bean
	public ViewResolver internalResourceViewResolver() {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/view/");
		resolver.setSuffix(".jsp");
		return resolver; // ViewResolver
	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/static/**").addResourceLocations("/WEB-INF/static/");
	} 
	// 정적자원 접근을 위한 리소스핸들러를 등록함
	// /WEB-INF/ 폴더는 접근할 수 없기때문에, 접근할 수 있는 방법을 제공함
	// "/static/**" 이렇게 들어오면 "/WEB-INF/static/" 여기 하위폴더로 연결해줌
}
