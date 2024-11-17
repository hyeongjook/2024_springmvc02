package com.ict.edu.parkparkservice;

import java.util.List;

import com.ict.edu.parkparkvo.ParkParkVO;

public interface ParkParkService {
	
	// 카테고리에 맞는 공원 목록 반환
	List<ParkParkVO> getParksByCategory(String category);
	
	
}
