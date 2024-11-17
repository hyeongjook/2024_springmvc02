package com.ict.edu.treesearchservice;

import java.util.List;

import com.ict.edu.treesearchvo.TreeSearchVO;

public interface TreeSearchService {
    
	 // 카테고리별 가로수길 목록 조회
    List<TreeSearchVO> getRoadsByCategory(String category);

    // 기본 4개의 가로수길 목록 조회 (가나다순)
    List<TreeSearchVO> getTop4Roads();
}