package cn.iankeri.hotel.utils;

import java.math.BigDecimal;

import cn.iankeri.hotel.entities.Record;

public class MoneyUtils {
	public static BigDecimal getTotalPrice(Record model) {
		float daysLong = DateUtils.getDayDifference(model.getDepartureTime(), model.getArrivalTime());
		
		int days = (int) daysLong;
		
		if(daysLong - days != 0)//不足一天算一天
			days++;
		
		//System.out.println("相距时间："+days);
		
		BigDecimal totalPrice = model.getPrice().multiply(new BigDecimal(days));

		//System.out.println("总价：" + totalPrice);
		
		return totalPrice;
	}
}
