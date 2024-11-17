package com.ict.edu.parkparkservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.edu.parkparkdao.ParkParkDAO;
import com.ict.edu.parkparkvo.ParkParkVO;

@Service 
public class ParkParkServiceImpl implements ParkParkService {

    @Autowired
    private ParkParkDAO parkParkDAO;

    @Override
    public List<ParkParkVO> getParksByCategory(String category) {
    	// 카테고리에 해당하는 공원 목록을 DAO에서 가져오기
        return parkParkDAO.getParksByCategory(category);
    }

}