package com.ict.edu.treesearchcontroller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ict.edu.treesearchservice.TreeSearchService;
import com.ict.edu.treesearchvo.TreeSearchVO;

// 가로수길수목조회페이지

@Controller
public class TreeSearchController {

	@Autowired
	private TreeSearchService treeSearchService;

	// 카테고리별 가로수길 목록 조회 (카테고리 버튼 클릭 시)
	@GetMapping("/treesearch")
	public String getTreesByCategory(@RequestParam(required = false) String category, HttpServletRequest request) {
		List<TreeSearchVO> trees;

		// 카테고리 값에 맞는 가로수길 목록 조회
		if (category == null || category.isEmpty()) {
			// 카테고리가 없거나 빈 값이면 기본 4개의 가로수길을 조회
			trees = treeSearchService.getTop4Roads();
		} else {
			// 카테고리가 있으면 해당 카테고리 값에 맞는 가로수길 목록을 조회
			trees = treeSearchService.getRoadsByCategory(category);
		}

		// request 객체에 데이터 설정 (JSP에서 사용할 수 있도록)
		request.setAttribute("trees", trees);
		request.setAttribute("category", category);

		// JSP 페이지로 이동
		return "sub2-4";
	}
}