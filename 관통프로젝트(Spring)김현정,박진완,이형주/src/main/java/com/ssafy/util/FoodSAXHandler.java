package com.ssafy.util;

import java.util.HashMap;
import java.util.Map;

import org.xml.sax.Attributes;
import org.xml.sax.helpers.DefaultHandler;

import com.ssafy.model.dto.Food;

/**
 *  FoodInfo.xml 파일에서 식품 정보를 읽어 파싱하는 핸들러 클래스 
 */
public class FoodSAXHandler extends DefaultHandler {
	/**파싱한 식품 정보를 담는 맵, 식품 이름으로 식품정보를 검색하기 위해 맵에 담는다 */
	private Map<String,Food> foods;
	/**파상힌 식품 영양 정보*/
	private Food food;
	/**태그 바디 정보를 임시로 저장*/
	private String temp;
	public FoodSAXHandler(){
		foods = new HashMap<String, Food>();
	}
	public void startElement(String uri, String localName
			                           , String qName, Attributes att ){
		if(qName.equals("food")){
			food = new Food();
		}
	}
	public void endElement(String uri, String localName, String qName){
		if(qName.equals("code")) { 
			food.setCode(Integer.parseInt(temp));
		}else if(qName.equals("name")) { 
			food.setName(temp);
		}else if(qName.equals("maker")) { 
			food.setMaker(temp);
		}else if(qName.equals("material")) { 
			food.setMaterial(temp);
		}else if(qName.equals("image")) { 
			food.setImg(temp);
		}else if(qName.equals("food")) { 
			foods.put(food.getName(), food);
		}
	}
	public void characters(char[]ch, int start, int length){
		temp = new String(ch, start, length);
	}
	public Map<String, Food> getFoods() {
		return foods;
	}
	public void setFoods(Map<String, Food> foods) {
		this.foods = foods;
	}
}





