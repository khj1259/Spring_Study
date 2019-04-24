package com.ssafy.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.model.dto.Book;
import com.ssafy.model.repository.BookRepository;

@Service("bookService")
public class BookServiceImpl implements BookService{
	@Autowired // 타입에 맞는 필요한 객체를 알아서 넣어줘라 (생성자 필요없음)
	private BookRepository bookRepo;
	
	@Override
	public int insert(Book book) {
		return 0;
	}

	@Override
	public int update(Book book) {
		return 0;
	}

	@Override
	public int delete(String isbn) {
		return 0;
	}

	@Override
	public Book select(String isbn) {
		return null;
	}

	@Override
	public List<Book> seletAll() {
		System.out.println("bookRepo 의 SelectAll() 메서드");
		bookRepo.seletAll();
		return null;
	}

}
