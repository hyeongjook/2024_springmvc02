package com.ict.edu.parkparkdao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.edu.parkparkvo.ParkParkVO;

@Repository
public class ParkParkDAOImpl implements ParkParkDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<ParkParkVO> getParksByCategory(String category) {
		// 공원 구분에 해당하는 공원 검색
		return sqlSessionTemplate.selectList("parkpark-mapper.selectParksByCategory", category);
	}

	
	
		

}
