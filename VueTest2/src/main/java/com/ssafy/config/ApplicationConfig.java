package com.ssafy.config;

import javax.sql.DataSource;

import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import com.ssafy.model.repository.ProductRepository;
import com.ssafy.model.service.ProductService;


@Configuration // 이 파일은 설정파일이라는 의미
@PropertySource({ "classpath:/config.properties" }) // properties 파일에서 변수처럼 저장해 놓은 값을 읽어와라 
@ComponentScan(basePackageClasses= {ProductRepository.class, ProductService.class}) // Bean 객체 관리요청
public class ApplicationConfig {
	//bean을 설정하세요
	// 객체 관리를 받을 빈 객체를 리턴할 메서드 작성 : 스캔을 할 수 없는 클래스들은 이런 방법을 사용
	//		스캔하는것이 편하지만, 클래스 정의부에 @Component 붙여야되는데 다른사람이 개발한 클래스를 수정할 수 없으니까
	// 	@Value("${프라퍼티에서 지정한식별자}")  라고 쓰면 프라퍼티파일에서 식별자에 지정된 값이 리턴됨
	//  @Value("${프라퍼티에서 지정한식별자}") String driver, 그 리턴된 값이 driver 에 들어감
	// 아래 ds() 메서드는 매개변수가 4개인 메서드
	@Bean
	public DataSource ds(@Value("${db.driverClassName}") String driver,
			@Value("${db.url}") String url,
			@Value("${db.userName}") String user,
			@Value("${db.password}") String pass) {
		DriverManagerDataSource dmds = new DriverManagerDataSource();
		dmds.setDriverClassName(driver);
		dmds.setUrl(url);
		dmds.setUsername(user);
		dmds.setPassword(pass);
		return dmds;
	}

	@Bean
	public SqlSessionFactoryBean sqlSessionFactoryBean(DataSource ds, ApplicationContext ctx) {
		SqlSessionFactoryBean bean = new SqlSessionFactoryBean();
		bean.setDataSource(ds);
		String location = "classpath:/mybatis/mybatis_config.xml"; // 마이바티스 설정파일 위치
		bean.setConfigLocation(ctx.getResource(location));
		return bean;
	}

	@Bean
	public SqlSessionTemplate template(SqlSessionFactoryBean factory) throws Exception {
		SqlSessionTemplate template = new SqlSessionTemplate(factory.getObject());
		return template;
	}
}
