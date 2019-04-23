package di1;
/**
스프링
x  1. STS(Spring Tool Suite)
	Spring.io 공식 홈페이지에서 tools 메뉴에서 다운받기

2. Eclipse EE 에 플러그인 설치
Eclipse EE Photon 버전을 받음 (open-jdk 와 호환을 위해)
플러그인 설치
Help - Eclipse MarketPlace ... - sts 검색 - sts 3.9.7 설치(15분) 

Perspective 꺼내기
Eclipse 우측상단 - Spring Perspective 꺼냄

Maven Repositories 뷰 꺼내기
Window - show view - other - maven repositories

향후 프로젝트 진행시 Repositories 서버에서 필요한 파일검색하는 시간을 줄이기 위해
인덱싱 작업을 미리 해주자
maven repositories 탭 - Global Repositories - central 우클릭 - Rebuild Index

=================================================================
프로젝트 생성
Spring Legacy Project  - Simple Spring Maven 로 생성
pom.xml 에서
java.version : 1.8
spring-framework.version : 4.2.5.RELEASE

build path - library : jdk 1.8.0 으로 변경 (원래꺼 지우고 add library 에서 jre system library)

 */
public class Test {
/*
 * spring : 오픈 소스 프레임웍, 2004년부터 공식버전 발표
 * 			국내에서는 전자정부 프레임워크(스프링, 톰캣)와 맞물려서 많이 사용됨
 * 기존 프로젝트에서 객체를 생성, 관리 하는 작업들의 의존성을 제거해보자
 * DI (Dependency Injection)
 * AOP (Aspect Oriented Programming)
 * MVC 
 */
	
	public static void main(String[] args) {
		Car c = new Car();
		c.drive();
	}// end main
}// end class
