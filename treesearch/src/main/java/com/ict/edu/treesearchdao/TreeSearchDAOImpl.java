package com.ict.edu.treesearchdao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.edu.treesearchvo.TreeSearchVO;

@Repository
public class TreeSearchDAOImpl implements TreeSearchDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	// 카테고리별 가로수길 목록 조회
	@Override
	public List<TreeSearchVO> getRoadsByCategory(String category) {
		return sqlSessionTemplate.selectList("tree-search-mapper.selectTreesByCategory", category);
	}

	// 기본 4개의 가로수길 목록 조회 (가나다순)
	@Override
	public List<TreeSearchVO> getTop4Roads() {
		return sqlSessionTemplate.selectList("tree-search-mapper.getTop4Roads");
	}
}