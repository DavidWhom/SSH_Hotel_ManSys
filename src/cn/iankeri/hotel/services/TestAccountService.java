package cn.iankeri.hotel.services;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.iankeri.hotel.dao.TestAccountDao;
import cn.iankeri.hotel.entities.Test;

@Service
public class TestAccountService {
	@Autowired
	private TestAccountDao testAccountDao;
	
	public void record(HttpServletRequest request) {
		String ipAddress = request.getRemoteAddr();
		Date loginTime = new Date();
		String hostName = request.getRemoteHost();
		Integer port = request.getRemotePort();
		Test test = new Test(null, ipAddress, loginTime, hostName, port.toString());
		testAccountDao.record(test);
	}
}
