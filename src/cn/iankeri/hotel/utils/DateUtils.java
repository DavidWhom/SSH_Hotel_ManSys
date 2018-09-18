package cn.iankeri.hotel.utils;

import java.util.Date;

public class DateUtils {
	public static float getDayDifference(Date d1, Date d2) {
		float days = 0;
		days = (d1.getTime() - d2.getTime()) / (1000f * 60f * 60f * 24f);
		return days;
	}
}
