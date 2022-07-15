package good.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import good.service.GoodService;

@Controller
@RequestMapping(value="good")
public class GoodController {
	
	@Autowired
	private GoodService goodService;
	
	// 따봉
	@ResponseBody
	@PostMapping(value = "updateGood")
	public int updateGood(@RequestParam String seq,@RequestParam String memEmail) {
			int goodCheck = goodService.goodCheck(seq, memEmail);
	
			if(goodCheck == 0) {
				//좋아요 처음누름
				goodService.insertGood(seq, memEmail); //good테이블 삽입
				goodService.updateGood(seq);	//게시판테이블 +1
				goodService.updateGoodCheck(seq, memEmail);//good테이블 구분자 1
			}else if(goodCheck == 1) {
				goodService.updateGoodCheckCancel(seq, memEmail); //good테이블 구분자0
				goodService.updateGoodCancel(seq); //게시판테이블 - 1
				goodService.deleteGood(seq, memEmail); //good테이블 삭제
			}
			return goodCheck;
	}
	
	@ResponseBody
	@PostMapping(value = "goodCount")
	public String goodCount(@RequestParam String seq){
		return goodService.goodCount(seq);
	}

}