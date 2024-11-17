package com.ict.edu.treesearchdao;

import java.util.List;

import com.ict.edu.treesearchvo.TreeSearchVO;

public interface TreeSearchDAO {
    
	  // 카테고리별 가로수길 목록 조회
    List<TreeSearchVO> getRoadsByCategory(String category);

    // 기본 4개의 가로수길 목록 조회
    List<TreeSearchVO> getTop4Roads();
}