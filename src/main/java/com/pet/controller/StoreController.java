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

import com.pet.model.AdminDAO;
import com.pet.model.AdminDTO;
import com.pet.model.PageDTO;
import com.pet.model.ReportDTO;
import com.pet.model.StoreDAO;
import com.pet.model.StoreDTO;
import com.pet.model.ReportDAO;

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
	public String Input(StoreDTO storeDTO, AdminDTO adminDTO) throws Exception {
		System.out.println("insert 실행 되었습니다!~~~");
		
		// store 테이블 insert
		StoreDAO storeDAO = sqlSession.getMapper(StoreDAO.class);
		storeDAO.insert(storeDTO);

		// admin 테이블 insert
		boolean check = false;
		adminDTO.setAdmin_id(storeDTO.getStore_id());
		adminDTO.setAdmin_pwd(storeDTO.getStore_password());
		adminDTO.setStore_code(storeDTO.getStore_code());
		AdminDAO adminDAO = sqlSession.getMapper(AdminDAO.class);
		if(adminDAO.insert(adminDTO) > 0){
			// 성공
			check = true;
		}
		System.out.println(check);
		
		return "redirect:../home.pet";
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
	public ModelAndView adminUpdatePro(StoreDTO storeDTO, AdminDTO adminDTO) throws Exception {
		System.out.println("adminUpdatedePro 실행 되었습니다!~~");
		
		// ModelAndView mav = new ModelAndView("/store/adminList");
		ModelAndView mav = new ModelAndView("redirect:selectAll.pet");
		StoreDAO dao = sqlSession.getMapper(StoreDAO.class);
		dao.adminUpdatePro(storeDTO);
		
		// admin 테이블 update
		boolean check = false;
		adminDTO.setAdmin_id(storeDTO.getStore_id());
		adminDTO.setAdmin_pwd(storeDTO.getStore_password());
		adminDTO.setStore_code(storeDTO.getStore_code());
		AdminDAO adminDAO = sqlSession.getMapper(AdminDAO.class);
		if(adminDAO.update(adminDTO) > 0){
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
		StoreDAO storeDAO = sqlSession.getMapper(StoreDAO.class);
		storeDAO.adminDelete(dto);
		
		// admin 테이블
		boolean check = false;
		AdminDAO adminDAO = sqlSession.getMapper(AdminDAO.class);
		if(adminDAO.deleteAdmin(dto) > 0){
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
		mav.addObject("searchList", searchList);

		return mav;
	}
	
	@RequestMapping("/ajaxTest.pet")
	@ResponseBody
	public String ajaxTest(@RequestBody String a ){
		
		
		return a;
	}
}
