package com.ict.edu.parkparkcontroller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ict.edu.parkparkservice.ParkParkService;
import com.ict.edu.parkparkvo.ParkParkVO;

@Controller
public class ParkParkController {

    @Autowired
    private ParkParkService parkParkService;

    // 카테고리별 공원 목록 조회
    @GetMapping("/parks")
    public String getParksByCategory(@RequestParam String category, HttpServletRequest request) {
        // 카테고리에 맞는 공원 목록 가져오기
        List<ParkParkVO> parks = parkParkService.getParksByCategory(category);

        // 공원 데이터를 request에 저장 (JSP에서 사용할 수 있도록)
        request.setAttribute("parks", parks);
        request.setAttribute("category", category);

        // 공원 목록을 포함한 JSP 페이지 반환
        return "sub1-3"; // parkList라는 id로 공원 목록만 부분적으로 출력하도록 할 수도 있습니다.
    }
}