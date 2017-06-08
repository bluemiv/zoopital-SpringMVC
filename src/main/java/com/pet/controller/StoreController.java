package com.pet.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pet.model.PageDTO;
import com.pet.model.StoreDAO;
import com.pet.model.StoreDTO;

@Controller
@RequestMapping("/store/")
public class StoreController {

	// Mybatis
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("/inputForm.pet")
	public String InputForm() {

		return "store/joinus";
	}

	@Transactional
	@RequestMapping("/input.pet")
	public String Input(StoreDTO storeDTO) throws Exception {
		System.out.println("insert 실행 되었습니다!~~~");
		
		// insert
		boolean check = false;
		StoreDAO storeDAO = sqlSession.getMapper(StoreDAO.class);
		if(storeDAO.insert(storeDTO)>0){
			check = true;
		}
		System.out.println(check);
		
		return "redirect:selectAll.pet";
	}

	@RequestMapping("/selectAll.pet")
	public ModelAndView getSelectAll(PageDTO input_pageDTO) {
		ModelAndView mav = new ModelAndView("/store/adminList");

		// 처음 리스트를 출력할때는 pageNum은 비어있으므로, 초기값 1을 줌
		int pageNum;
		if (input_pageDTO.getPageNum() == 0) {
			pageNum = 1;
		} else {
			pageNum = input_pageDTO.getPageNum();
		}

		// 전체 지점 리스트 가져오기
		StoreDAO dao = sqlSession.getMapper(StoreDAO.class);

		// 리스트 개수를 가져옴
		int totalNum = dao.getListCount();

		// startNum과 endNum을 구함
		final int pageSize = 5;
		int startNum = 1 + pageSize * (pageNum - 1);
		int endNum = pageSize * pageNum;
		PageDTO pageDTO = new PageDTO();
		pageDTO.setStartNum(startNum);
		pageDTO.setEndNum(endNum);

		// 페이지에 맞는 리스트를 가져옴
		List<StoreDTO> adminList = dao.getPageSelectAll(pageDTO);

		// 전체 리스트의 총 페이지 개수
		int totalPageNum;
		if (totalNum % pageSize == 0) {
			// 5의 배수
			totalPageNum = totalNum / pageSize;
		} else {
			// 5의 배수가 아니다
			totalPageNum = (totalNum / pageSize) + 1;
		}

		mav.addObject("adminList", adminList);
		mav.addObject("totalPageNum", totalPageNum);
		mav.addObject("currentPageNum", pageNum);
		return mav;
	}

	@RequestMapping("/adminUpdate.pet")
	public ModelAndView adminUpdate(StoreDTO dto) {

		ModelAndView mav = new ModelAndView("/store/adminUpdate");
		StoreDAO dao = sqlSession.getMapper(StoreDAO.class);
		StoreDTO storeDTO = dao.adminUpdate(dto);
		System.out.println("adminUpdatedetail 실행 되었습니다!~~");

		mav.addObject("storeDTO", storeDTO);

		return mav;

	}
	
	@Transactional
	@RequestMapping("/adminUpdatPro.pet")
	public ModelAndView adminUpdatePro(StoreDTO storeDTO) throws Exception {
		System.out.println("adminUpdatedePro 실행 되었습니다!~~");
		
		ModelAndView mav = new ModelAndView("redirect:selectAll.pet");
		
		// update
		boolean check = false;
		StoreDAO dao = sqlSession.getMapper(StoreDAO.class);
		if(dao.adminUpdatePro(storeDTO) > 0){
			// 성공
			check = true;
		}
		System.out.println(check);
		

		return mav;
	}

	@Transactional
	@RequestMapping("/deletePro.pet")
	public ModelAndView adminDelete(StoreDTO dto) throws Exception{
		System.out.println("deletePro실행 되었습니다!~ ");
		
		ModelAndView mav = new ModelAndView("redirect:selectAll.pet");
		
		// store 테이블
		boolean check = false;
		StoreDAO storeDAO = sqlSession.getMapper(StoreDAO.class);
		if(storeDAO.adminDelete(dto) > 0){
			check = true;
		}
		System.out.println(check);
		
		return mav;
	}

	// store_name 으로 검색기능
	@RequestMapping("/search.pet")
	public ModelAndView searchStore(StoreDTO dto) {
		ModelAndView mav = new ModelAndView("/store/adminList");
		StoreDAO dao = sqlSession.getMapper(StoreDAO.class);
		System.out.println("searchList 실행되었습니다.");
		List searchList = dao.searchStore(dto);
		mav.addObject("adminList", searchList);

		return mav;
	}
	
	@RequestMapping("/ajaxTest.pet")
	@ResponseBody
	public String ajaxTest(@RequestBody String a ){
		
		
		return a;
	}
	
	@ResponseBody
	@RequestMapping("/idConfirmAjax.pet")
	public boolean idConfirmAjax(@RequestBody StoreDTO storeDTO){
		StoreDAO storeDAO = sqlSession.getMapper(StoreDAO.class);
		
		boolean check = false;
		try {
			StoreDTO result_storeDTO = storeDAO.adminUpdate(storeDTO);
			if(result_storeDTO.getStore_code() != null){
				// 아이디가 존재함(사용 불가능)
				check = false;
			}
		} catch (Exception e) {
			// 아이디가 없음 (사용가능)
			// NullPointException에 걸림
			check = true;
		}
		
		return check;
	}
}
