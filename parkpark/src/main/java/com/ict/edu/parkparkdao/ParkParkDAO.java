package com.ict.edu.parkparkdao;

import java.util.List;

import com.ict.edu.parkparkvo.ParkParkVO;

public interface ParkParkDAO {
	

    // 카테고리별 공원 목록을 가져오는 메서드
    List<ParkParkVO> getParksByCategory(String category);  // 매개변수로 카테고리값을 받음
}