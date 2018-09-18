package cn.iankeri.hotel.test;

import static org.junit.jupiter.api.Assertions.*;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.Test;

import cn.iankeri.hotel.entities.User;
import cn.iankeri.hotel.utils.DateUtils;

class ManyTest {

	@Test
	void testMap(){
		//keySet遍历方式
		Map<Integer, String> map = new HashMap<>();
		for(Integer key : map.keySet()){
			
		}
		
		//entrySet遍历方式
		for(Map.Entry<Integer, String> entry : map.entrySet()) {
			
		}
	}
	@Test
	void testDate() {
		
		try {
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
			String str = "2018-07-28 08:04:00";
			Date lastTime = df.parse(str);
			float dayFloat = DateUtils.getDayDifference(new Date(), lastTime);
			int days = (int) dayFloat;

			if(dayFloat - days != 0)
				days++;
			System.out.println(days);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	
	@Test
	void testQueryUser() {
		String rt = "123;456;789";
		List<String> imgs = Arrays.asList(rt.split(";"));
		for(String img : imgs)
			System.out.print(img+" ");
	}
	
	@Test
	void testEntity() {
		User user = new User("胡佳传", "男", "15280469787", "997740098@qq.com", "121212XX", 
				"福建安溪", "1212", "xx", "xx", false, true);
		System.out.println(user);
	}
	
	@Test
	void test() {
		BigDecimal price = new BigDecimal("120.9");
		System.out.println(price.toString());
	}

}
