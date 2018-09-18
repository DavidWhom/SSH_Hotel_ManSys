package cn.iankeri.hotel.dao.impl;

import org.springframework.stereotype.Repository;

import cn.iankeri.hotel.dao.BaseDao;
import cn.iankeri.hotel.dao.TestAccountDao;
import cn.iankeri.hotel.entities.Test;

@Repository("testAccountDao")
public class TestAccountDaoImpl extends BaseDao implements TestAccountDao {

	@Override
	public void record(Test test) {
		getSession().saveOrUpdate(test);
	}

}
