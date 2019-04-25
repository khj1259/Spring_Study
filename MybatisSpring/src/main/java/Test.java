import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import dao.ProductDAO;
import model.Product;

/**
 * src : 프로젝트의 클래들의 루트
 * src/main/java		자바
 * src/main/resources	xml, 이미지,..
 * src/test/java		junit (테스트용 클래스)
 * 폴더구조 : 종류별로 구분할 수 있도록 분류
 * 
 * 클래스의 경로	: "xx.xx.클래스명" 하위폴더를 . 으로 구분
 * xml의 경로 	: "xx/xx/xx.xml" 하위폴더를 /로 구분
 * 
 * Mybatis + Spring 연동
 * 1. 자바코드로부터 SQL문을 분리
 * 2. "id=? and name=? 파라미터, ResultSet 결과값 매핑을 편리하게 해줌
 * 3. SqlSession 으로 Connection 관리 + 트랜잭션 관리
 * +
 * 4. Spring : 객체관리 컨테이너
 * 
 * 해야할 작업
 * pom.xml 에 디펜던시 추가 (라이브러리 설치)
 * Spring Core(있음), Spring context(있음), Spring jdbc
 * Mybatis, Mybatis-Spring
 * MySql
 * 
 * applicationContext.xml	데이터베이스 정보, 알리아스, 매퍼파일 위치
 * 							빈객체 관리하고 싶은 패키지를 스캔
 * 							SqlSessionFactoryBean 등록
 * 							SqlSessionTemplate 등록
 * 
 * dao.mapper productMapper.xml 작성	 -  SQL문을 저장해놓음
 * model 에 VO객체 Product 클래스 등록
 * dao 패키지에서 ProductDAO 작성
 * 		@Autowired 로 일치하는 객체 SqlSessionFactory 를 변수로 가져옴
 */
public class Test {
	public static void main(String[] args) {
		ApplicationContext context = new GenericXmlApplicationContext("applicationContext.xml");
		ProductDAO dao = context.getBean("productDAO", ProductDAO.class);
		
		//selectOne
		Product product = dao.selectOne(1);
		System.out.println("<selectOne>");
		System.out.println(product);
		
		int result = 0;
		//insesrt
		result = dao.insert(new Product(3, "coffee", 4000, "asdf", "ggg"));
		System.out.println("insert 결과 :"+result);
		
		//delete
		result = dao.delete(2);
		System.out.println("delete 결과 :"+result);
		
		//update
		result = dao.update(new Product(1, "coke222", 1500, "abc", "ddd"));
		System.out.println("update 결과 :"+result);
		
		//selectAll
		List<Product> list = dao.selectAll();
		System.out.println("<selectAll>");
		for (Product p : list) {
			System.out.println(p);
		}
	}//end main
}



















