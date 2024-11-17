package com.ict.edu.treesearchservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.edu.treesearchdao.TreeSearchDAO;
import com.ict.edu.treesearchvo.TreeSearchVO;

@Service
public class TreeSearchServiceImpl implements TreeSearchService {


	@Autowired
    private TreeSearchDAO treeSearchDAO;

    // 카테고리별 가로수길 목록 조회
    @Override
    public List<TreeSearchVO> getRoadsByCategory(String category) {
        return treeSearchDAO.getRoadsByCategory(category);
    }

    // 기본 4개의 가로수길 목록 조회 (가나다순)
    @Override
    public List<TreeSearchVO> getTop4Roads() {
        return treeSearchDAO.getTop4Roads();
    }
}