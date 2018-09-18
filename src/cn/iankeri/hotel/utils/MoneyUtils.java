package cn.iankeri.hotel.utils;

import java.math.BigDecimal;

import cn.iankeri.hotel.entities.Record;

public class MoneyUtils {
	public static BigDecimal getTotalPrice(Record model) {
		float daysLong = DateUtils.getDayDifference(model.getDepartureTime(), model.getArrivalTime());
		
		int days = (int) daysLong;
		
		if(daysLong - days != 0)//����һ����һ��
			days++;
		
		//System.out.println("���ʱ�䣺"+days);
		
		BigDecimal totalPrice = model.getPrice().multiply(new BigDecimal(days));

		//System.out.println("�ܼۣ�" + totalPrice);
		
		return totalPrice;
	}
}
