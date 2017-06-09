package com.pet.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pet.model.CounterDAO;
import com.pet.model.CounterDTO;
import com.pet.model.PetDTO;
import com.pet.model.PetHistoryDAO;
import com.pet.model.PetHistoryDTO;
import com.pet.model.SalesLogDAO;

@Controller
@RequestMapping("/counter/")
public class CounterController {
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping("list.pet")
	public String list(Model model, HttpSession session) throws Exception{
		CounterDAO counterDAO = sqlSession.getMapper(CounterDAO.class);
		String store_code = (String)session.getAttribute("session_store_code");
		
		List<PetDTO> list= counterDAO.getListAll(store_code);
		
		model.addAttribute("plist", list);
		
		return "/counter/counterPetList";
	}
	
	@RequestMapping("search.pet")
	public String search(String search, Model model) throws Exception{
		CounterDAO counterDAO = sqlSession.getMapper(CounterDAO.class);
		PetDTO dto=new PetDTO();
		dto.setPet_name(search);
		List<PetDTO> list= counterDAO.searchList(dto);
		model.addAttribute("list", list);
		
		return "/counter/counterPetList";
	}
	
	@RequestMapping("accept.pet")
	public String accept(int pet_code, Model model) throws Exception{
		CounterDAO counterDAO = sqlSession.getMapper(CounterDAO.class);
		PetDTO petDTO = new PetDTO();
		petDTO = counterDAO.getPetInfo(pet_code);
		model.addAttribute("pdto", petDTO);
		return "/counter/counterAcceptForm";
	}
	@RequestMapping("insertAccept.pet")
	public String insertAccept(CounterDTO counterDTO, Model model, HttpSession session) throws Exception{
		CounterDAO counterDAO = sqlSession.getMapper(CounterDAO.class);
		counterDTO.setStore_code((String)session.getAttribute("session_store_code"));
		counterDAO.insertAccept(counterDTO);
		return "redirect:/home.pet";
	}
	@RequestMapping("waitingList.pet")
	public String getListWaiting(HttpSession session, Model model) throws Exception{
		CounterDAO counterDAO = sqlSession.getMapper(CounterDAO.class);
		String store_code = (String)session.getAttribute("session_store_code");
		List<CounterDTO> clist = counterDAO.getListWaiting(store_code);
		model.addAttribute("clist", clist);
		return "/counter/counterAcceptView";
	}
	@RequestMapping("payingList.pet")
	public String payingList(HttpSession session, Model model) throws Exception{
		String store_code = (String)session.getAttribute("session_store_code");
		CounterDAO counterDAO = sqlSession.getMapper(CounterDAO.class);
		List<CounterDTO> clist = counterDAO.getPayingList(store_code);
		model.addAttribute("clist", clist);
		return "/counter/payingView";
	}
	
	@RequestMapping("payingDetail.pet")
	public String payingDetail(int pethistory_key, int petaccept_code, Model model)throws Exception{
		CounterDAO counterDAO = sqlSession.getMapper(CounterDAO.class);
		PetHistoryDTO petHistoryDTO = counterDAO.getPayingInfo(pethistory_key);//key로 히스토리 정보 가지고오기
		//정보에 대해 하나의 DTO에 담기 위해 새로운 petHistoryDTO타입의 리스트로 준비
		ArrayList<PetHistoryDTO> pdto = new ArrayList<PetHistoryDTO>();
		//우선 가져온 값에대한 스트링을 가져와서 토큰준비!
		String m_name = petHistoryDTO.getPethistory_medicine();
		String m_amount = petHistoryDTO.getPethistory_m_amount();
		StringTokenizer nstk = new StringTokenizer(m_name, ",");
		StringTokenizer amstk = new StringTokenizer(m_amount, ",");
		while(nstk.hasMoreElements()){
			PetHistoryDTO forListDTO = new PetHistoryDTO();
			forListDTO.setmName(nstk.nextToken());
			forListDTO.setmAmount(Integer.parseInt(amstk.nextToken()));
			pdto.add(forListDTO);
		}
		//total cost 구해서 셋해주기
		petHistoryDTO.setPethistory_total_cost(petHistoryDTO.getPethistory_m_cost()+petHistoryDTO.getPethistory_cost());
		model.addAttribute("listpdto", pdto);
		model.addAttribute("pdto", petHistoryDTO);
		return "/counter/payingDetailView";
	}
	
	@RequestMapping("payingEnd.pet")
	public String payingEnd(HttpSession session, PetHistoryDTO petHistoryDTO) throws Exception{
		PetHistoryDAO petHistoryDAO = sqlSession.getMapper(PetHistoryDAO.class);
		SalesLogDAO salesLogDAO = sqlSession.getMapper(SalesLogDAO.class);
		String store_code = (String)session.getAttribute("session_store_code");
		SalesLogController sc = new SalesLogController();
		String today = sc.checkSalesDB(store_code,salesLogDAO);
		petHistoryDTO.setToday(today);
		salesLogDAO.upDateIncome(petHistoryDTO);
		salesLogDAO.upDateNIncome(petHistoryDTO);
		System.out.println("완료?");
		petHistoryDAO.deleteWaiting(petHistoryDTO.getPetaccept_code());
		return "redirect:payingList.pet";
	}
}

