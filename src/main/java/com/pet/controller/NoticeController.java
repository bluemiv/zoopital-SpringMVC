package com.pet.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pet.model.NoticeDAO;
import com.pet.model.NoticeDTO;
import com.pet.model.ReplyDAO;
import com.pet.model.ReplyDTO;

@Controller
@RequestMapping("/notice/")
public class NoticeController {

	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping("noticeListForm.pet")
	public String noticeListForm(NoticeDTO noticeDTO, HttpSession session, Model model) throws Exception{
		System.out.println("notcieListForm 접근");
		
		// 페이징 처리
		NoticeDAO noticeDAO = sqlSession.getMapper(NoticeDAO.class);
		int totalCount = noticeDAO.getTotalCountOfNotice(noticeDTO);
		final int PAGE_SIZE = 10;
		if(noticeDTO.getPageNum() == 0){
			noticeDTO.setPageNum(1); // default 값
		}
		noticeDTO.setStartNum(PAGE_SIZE * (noticeDTO.getPageNum() - 1) + 1);
		noticeDTO.setEndNum(PAGE_SIZE * noticeDTO.getPageNum());
		// 전체 페이지  개수
		if(totalCount % PAGE_SIZE == 0){
			noticeDTO.setPageTotalNum(totalCount / PAGE_SIZE);
		} else {
			noticeDTO.setPageTotalNum(1 + totalCount / PAGE_SIZE);
		}
		
		// 세션 값 가져옴 (지점 코드)
		noticeDTO.setStore_code((String)session.getAttribute("session_store_code"));
		// 모든 공지사항 리스트 가져옴
		List<NoticeDTO> list = noticeDAO.selectAllList(noticeDTO);
		
		model.addAttribute("list", list);
		model.addAttribute("page", noticeDTO);
		model.addAttribute("currentPageNum", noticeDTO.getPageNum());
		
		return "notice/noticeListForm";
	}
	
	@RequestMapping("noticeWriteForm.pet")
	public String noticeWriteForm() throws Exception{
		System.out.println("noticeWriteForm 접근");
		
		return "notice/noticeWriteForm";
	}
	
	@RequestMapping("noticeWritePro.pet")
	public String noticeWritePro(NoticeDTO noticeDTO, Model model, HttpSession session, Principal principal) throws Exception{
		System.out.println("noticeWritePro 접근");
		
		// 세션값 가져오기
		noticeDTO.setStore_code((String)session.getAttribute("session_store_code"));
		noticeDTO.setNotice_writer(principal.getName());
		
		// 글쓰기
		boolean check = false;
		NoticeDAO noticeDAO = sqlSession.getMapper(NoticeDAO.class);
		if(noticeDAO.insertNotice(noticeDTO) > 0){
			check = true;
		}
		
		model.addAttribute("check", check);
		return "redirect:noticeResult.pet";
	}
	
	@RequestMapping("noticeUpdateForm.pet")
	public String noticeUpdateForm(NoticeDTO noticeDTO, Model model) throws Exception{
		System.out.println("noticeUpdateForm 접근");
		
		// 자세한 정보 가져옴
		NoticeDAO noticeDAO = sqlSession.getMapper(NoticeDAO.class);
		noticeDTO = noticeDAO.getNoticeDetail(noticeDTO);
		
		model.addAttribute("noticeDTO", noticeDTO);
		return "notice/noticeUpdateForm";
	}
	
	@RequestMapping("noticeUpdatePro.pet")
	public String noticeUpdatePro(NoticeDTO noticeDTO, Model model, Principal principal) throws Exception{
		System.out.println("noticeUpdatePro 접근");

		// 세션값 가져오기
		noticeDTO.setNotice_writer(principal.getName());
		
		// 글수정
		boolean check = false;
		NoticeDAO noticeDAO = sqlSession.getMapper(NoticeDAO.class);
		if(noticeDAO.updateNotice(noticeDTO)>0){
			check = true;
		}

		model.addAttribute("check", check);
		return "redirect:noticeResult.pet";
	}
	
	@RequestMapping("noticeDeletePro.pet")
	public String noticeDeletePro(NoticeDTO noticeDTO, Model model) throws Exception{
		System.out.println("noticeDeletePro 접근");
		
		// 글삭제
		boolean check = false;
		NoticeDAO noticeDAO = sqlSession.getMapper(NoticeDAO.class);
		if(noticeDAO.deleteNotice(noticeDTO)>0){
			check = true;
		}

		model.addAttribute("check", check);
		return "redirect:noticeResult.pet";
	}
	
	@RequestMapping("noticeResult.pet")
	public String noticeResult(boolean check, Model model) throws Exception{
		System.out.println("noticeResult 접근");
		model.addAttribute("check", check);
		return "notice/noticeResult";
	}
	
	@RequestMapping("noticeDetailForm.pet")
	public String noticeDetailForm(NoticeDTO noticeDTO, String state,Model model, HttpSession session) throws Exception{
		System.out.println("noticeDetailForm 접근");

		// 자세한 정보 가져옴
		NoticeDAO noticeDAO = sqlSession.getMapper(NoticeDAO.class);
		noticeDTO = noticeDAO.getNoticeDetail(noticeDTO);
		
		// 조회수 증가
		if(state != null){
			NoticeDTO noticeDTO_view = new NoticeDTO();
			noticeDTO_view.setNotice_view(noticeDTO.getNotice_view() + 1);
			noticeDTO_view.setNotice_code(noticeDTO.getNotice_code());
			if(noticeDAO.updateNotice(noticeDTO_view) > 0){
				System.out.println("조회수 증가");
			}
		}
		
		// 댓글 가져옴
		ReplyDTO replyDTO = new ReplyDTO();
		replyDTO.setNotice_code(noticeDTO.getNotice_code());
		replyDTO.setStore_code((String)session.getAttribute("session_store_code"));
		ReplyDAO replyDAO = sqlSession.getMapper(ReplyDAO.class);
		List<ReplyDTO> replyList = replyDAO.selectAllReply(replyDTO);
		
		model.addAttribute("noticeDTO", noticeDTO);
		model.addAttribute("replyList", replyList);
		
		return "notice/noticeDetailForm";
	}
	
	@Transactional
	@RequestMapping("insertReply.pet")
	public String insertReply(ReplyDTO replyDTO, Model model, HttpSession session, Principal principal) throws Exception{
		System.out.println("insertReply 접근");
		
		// 세션값 가져오기
		replyDTO.setStore_code((String)session.getAttribute("session_store_code"));
		replyDTO.setReply_writer(principal.getName());
		
		// 글쓰기
		boolean check = false;
		ReplyDAO replyDAO = sqlSession.getMapper(ReplyDAO.class);
		replyDAO.insertReply(replyDTO);
		
		// 부모글 댓글 수 update
		NoticeDTO noticeDTO = new NoticeDTO();
		noticeDTO.setNotice_code(replyDTO.getNotice_code());
		noticeDTO.setReplyState("up");
		NoticeDAO noticeDAO = sqlSession.getMapper(NoticeDAO.class);
		if(noticeDAO.updateNotice(noticeDTO) > 0){
			check = true;
		}
		
		model.addAttribute("check", check);
		return "redirect:noticeDetailForm.pet?notice_code="+replyDTO.getNotice_code();
	}
	
	// 댓글 수정
	@RequestMapping("updateReply.pet")
	public String updateReply(ReplyDTO replyDTO, Model model, Principal principal) throws Exception{
		System.out.println("updateReply 접근");

		// 세션값 가져오기
		replyDTO.setReply_writer(principal.getName());
		
		// 글수정
		boolean check = false;
		ReplyDAO replyDAO = sqlSession.getMapper(ReplyDAO.class);
		if(replyDAO.updateReply(replyDTO) > 0){
			check = true;
		}

		model.addAttribute("check", check);
		return "redirect:noticeDetailForm.pet?notice_code="+replyDTO.getNotice_code();
	}
	
	// 댓글 삭제
	@Transactional
	@RequestMapping("deleteReply.pet")
	public String deleteReply(ReplyDTO replyDTO, Model model, Principal principal) throws Exception{
		System.out.println("deleteReply 접근");
		
		// 세션값 가져오기
		replyDTO.setReply_writer(principal.getName());
				
		// 글삭제
		boolean check = false;
		ReplyDAO replyDAO = sqlSession.getMapper(ReplyDAO.class);
		if(replyDAO.deleteReply(replyDTO) > 0){
			check = true;
		}

		// 부모글 댓글 수 update
		NoticeDTO noticeDTO = new NoticeDTO();
		noticeDTO.setNotice_code(replyDTO.getNotice_code());
		noticeDTO.setReplyState("down");
		NoticeDAO noticeDAO = sqlSession.getMapper(NoticeDAO.class);
		if(noticeDAO.updateNotice(noticeDTO) > 0){
			check = true;
		}
		
		model.addAttribute("check", check);
		return "redirect:noticeDetailForm.pet?notice_code="+replyDTO.getNotice_code();
	}
}
