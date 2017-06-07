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
import com.pet.model.MedicamentDAO;
import com.pet.model.MedicamentDTO;
import com.pet.model.PetDAO;
import com.pet.model.PetDTO;
import com.pet.model.PetHistoryDAO;
import com.pet.model.PetHistoryDTO;

@Controller
@RequestMapping("/history/")
public class PetHistoryController {
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping("selectallhistory.pet")
	public String selectAllHistory(HttpSession session, Model model){
		PetHistoryDAO petHistroyDAO = sqlSession.getMapper(PetHistoryDAO.class);
		String store_code = (String)session.getAttribute("session_store_code");
		List<PetHistoryDTO> petlist;
		petlist = petHistroyDAO.selectAllHistory(store_code);
		model.addAttribute("hlist", petlist);
		return "/history/historyListView";
	}
	@RequestMapping("serarchview.pet")
	public String searchView(Model model){
		return "/history/historyInsertReady";
	}
	@RequestMapping("searchforhistory.pet")
	public String searchForHistory(String petname, Model model){
		PetDAO petDAO = sqlSession.getMapper(PetDAO.class);
		PetDTO petDTO = new PetDTO();
		petDTO.setPet_name(petname);
		List<PetDTO> list = petDAO.getCodeForHistory(petDTO);
		model.addAttribute("plist", list);
		return "/history/historyInsert";
	}
	@RequestMapping("historyinsert.pet")
	public String historyinsert(int pet_code, String test, int petaccept_code,String am_count,int m_total_cost, 
			int treat_cost, HttpSession session, Model model) throws Exception{
		String store_code = (String)session.getAttribute("session_store_code");
		System.out.println("code = " + store_code);
		System.out.println("넘어올 데이터 넘어오나? " + test);
		System.out.println("코드도 넘어오지? " + pet_code);
		System.out.println("접수코드도 넘어오지? " + petaccept_code);
		System.out.println("am_count : " + am_count);
		PetHistoryDAO petHistroyDAO = sqlSession.getMapper(PetHistoryDAO.class);
		PetDAO petDAO = sqlSession.getMapper(PetDAO.class);
		MedicamentDAO medicamentDAO = sqlSession.getMapper(MedicamentDAO.class);
		PetDTO petDTO = petDAO.getHistoryInfo(pet_code);
		CounterDTO counterDTO = new CounterDTO();
		counterDTO.setPetaccept_code(petaccept_code);
		counterDTO.setM_total_cost(m_total_cost);
		counterDTO.setTreat_cost(treat_cost);
		List<MedicamentDTO> mlist = medicamentDAO.getSelectAll(store_code); 
		//약 추가를 눌렀을때 하는 기능(넘어오는 test파라미터가 널이면 실행이 되면 안됨)
		if(test != null){
			List<String> list = new ArrayList<String>();
			List<String> c_list = new ArrayList<String>();
			StringTokenizer stk = new StringTokenizer(test, ",");
			if(am_count != null){
				StringTokenizer c_stk = new StringTokenizer(am_count, ",");
				while(c_stk.hasMoreElements()){
					c_list.add(c_stk.nextToken());
				}
			}
			int ii =0;
			while(stk.hasMoreElements()){
				list.add(stk.nextToken());
				System.out.println("list.get("+ ii + "): "+ list.get(ii) + " 를 담았습니다");
				System.out.println("list size = " + list.size());
				ii++;
			}
		//추가하는 순서대로 정렬해주기 위해서 getSelectChoice2로 변경함..
		List<MedicamentDTO> add_mlist = new ArrayList<MedicamentDTO>();
		if(list.size()==1){
			MedicamentDTO mdto = new MedicamentDTO();
			mdto = medicamentDAO.getSelectChoice2(store_code, list.get(0));
			add_mlist.add(mdto);
		}else if(list.size()>1){
			for(int i=1; i<list.size(); i++){
				MedicamentDTO mdto = new MedicamentDTO();
				mdto = (MedicamentDTO) medicamentDAO.getSelectChoice2(store_code, list.get(i));
				if(c_list.size()>0){
				mdto.setAm_count(Integer.parseInt(c_list.get(i-1)));
				}
				add_mlist.add(mdto);
			}
			MedicamentDTO mdto = new MedicamentDTO();
			mdto = (MedicamentDTO) medicamentDAO.getSelectChoice2(store_code, list.get(0));
			add_mlist.add(mdto);
		}
		//넘겨줄 리스트에 select문 담고...
		/*List<MedicamentDTO> addmlist = medicamentDAO.getSelectChoice(list);*/
		model.addAttribute("addmdto" , add_mlist);
		}
		model.addAttribute("pdto", petDTO);
		model.addAttribute("mdto", mlist);
		model.addAttribute("cdto", counterDTO);
		
		return "/history/historyInsertForm";
	}
	
	@RequestMapping("dhistoryinsert.pet")
	public String dhistoryinsert(int pet_code, String test, String del_num, int petaccept_code,String am_count, 
			int treat_cost, HttpSession session, Model model) throws Exception{
		String store_code = (String)session.getAttribute("session_store_code");
		System.out.println("넘어올 데이터 넘어오나? " + test);
		System.out.println("코드도 넘어오지? " + pet_code);
		System.out.println("지울 넘버? " + del_num);
		PetHistoryDAO petHistroyDAO = sqlSession.getMapper(PetHistoryDAO.class);
		PetDAO petDAO = sqlSession.getMapper(PetDAO.class);
		MedicamentDAO medicamentDAO = sqlSession.getMapper(MedicamentDAO.class);
		PetDTO petDTO = petDAO.getHistoryInfo(pet_code);
		CounterDTO counterDTO = new CounterDTO();
		counterDTO.setPetaccept_code(petaccept_code);
		counterDTO.setTreat_cost(treat_cost);
		List<MedicamentDTO> mlist = medicamentDAO.getSelectAll(store_code); 
		//약 추가를 눌렀을때 하는 기능(넘어오는 파라미터가 널이면 실행아 되면 안됨)
		if(test != null){
			List<String> list = new ArrayList<String>();
			List<String> c_list = new ArrayList<String>();
			StringTokenizer stk = new StringTokenizer(test, ",");
			if(am_count != null){
				StringTokenizer c_stk = new StringTokenizer(am_count, ",");
				while(c_stk.hasMoreElements()){
					c_list.add(c_stk.nextToken());
				}
			}
			int ii =0;
			while(stk.hasMoreElements()){
				list.add(stk.nextToken());
				System.out.println("list.get("+ ii + "): "+ list.get(ii) + " 를 담았습니다");
				System.out.println("list size = " + list.size());
				ii++;
			}
			list.remove(Integer.parseInt(del_num)-1);
			c_list.remove(Integer.parseInt(del_num)-1);
			//지우고 다시 페이지 불러올때 약값을 가져오는 부분
			int m_total_cost = 0;
			List<MedicamentDTO> add_mlist = new ArrayList<MedicamentDTO>();
			for(int i=0; i<list.size(); i++){
				MedicamentDTO mdto = new MedicamentDTO();
				mdto = (MedicamentDTO) medicamentDAO.getSelectChoice2(store_code, list.get(i));
				if(c_list.size()>0){
					mdto.setAm_count(Integer.parseInt(c_list.get(i)));
					m_total_cost += (mdto.getMedicament_cost()*Integer.parseInt(c_list.get(i)));
					}
				add_mlist.add(mdto);
			}
			counterDTO.setM_total_cost(m_total_cost);
			/*MedicamentDTO mdto = new MedicamentDTO();
			mdto = (MedicamentDTO) medicamentDAO.getSelectChoice2(list.get(0));
			add_mlist.add(mdto);*/
		//넘겨줄 리스트에 select문 담고...
		/*List<MedicamentDTO> addmlist = medicamentDAO.getSelectChoice(list);*/
		model.addAttribute("addmdto" , add_mlist);
		}
		model.addAttribute("pdto", petDTO);
		model.addAttribute("mdto", mlist);
		model.addAttribute("cdto", counterDTO);
		return "/history/historyInsertForm";
	}
	@RequestMapping("inserthistoryend.pet")
	public String inserthistoryend(PetHistoryDTO petHistoryDTO, String test, String pet_name, 
			String am_count, int petaccept_code, CounterDTO counterDTO, HttpSession session) throws Exception{
		PetHistoryDAO petHistoryDAO = sqlSession.getMapper(PetHistoryDAO.class);
		CounterDAO counterDAO = sqlSession.getMapper(CounterDAO.class);
		String store_code = (String)session.getAttribute("session_store_code");
		System.out.println("coments = " + petHistoryDTO.getPethistory_coments());
		System.out.println("code = " + petHistoryDTO.getPethistory_petcode());
		System.out.println("command = " + test);
		System.out.println("am_count = " + am_count);
		medicamentUpdate(test,am_count, store_code);
		if(test.equals("")){
			test = "해당없음";
			petHistoryDTO.setPethistory_medicine(test);
		}else{
			String temp = "";
			List<String> list = new ArrayList<String>();
			StringTokenizer stk = new StringTokenizer(test, ",");
			//temp에 담아서 DB에 저장
			while(stk.hasMoreElements()){
				list.add(stk.nextToken());	
			}
			//마지막에는 ,기호를 빼기위해서
			for(int i=0; i<list.size(); i++){
				if(i==list.size()-1){
					temp += list.get(i);
				}else{
				temp += list.get(i) + ",";
				}
			}
			
			petHistoryDTO.setPethistory_medicine(temp);
			petHistoryDTO.setPethistory_m_amount(am_count);
		}
		petHistoryDTO.setStore_code(store_code);
		petHistoryDTO.setPethistory_name(pet_name);
		CounterDTO cdto = counterDAO.getTime(petaccept_code);
		petHistoryDTO.setPethistory_btoday(cdto.getPetaccept_date());
		petHistoryDTO.setPethistory_cost(counterDTO.getTreat_cost());
		petHistoryDTO.setPethistory_m_cost(counterDTO.getM_total_cost());
		/*System.out.println("m_amount = " + m_amount);
		System.out.println("m_cost = " + m_cost);*/
		petHistoryDAO.insertHistory(petHistoryDTO);
		petHistoryDAO.updateWaiting(petaccept_code);
		return "redirect:../home.pet";
	}
	public void medicamentUpdate(String test, String am_count, String store_code){
		MedicamentDAO medicamentDAO = sqlSession.getMapper(MedicamentDAO.class);
		if(test != null){
			List<String> list = new ArrayList<String>();
			List<String> clist = new ArrayList<String>();
			StringTokenizer stk = new StringTokenizer(test, ",");
			StringTokenizer cstk = new StringTokenizer(am_count, ",");
			while(stk.hasMoreTokens()){
				list.add(stk.nextToken());
			}
			while(cstk.hasMoreTokens()){
				clist.add(cstk.nextToken());
			}
			for(int i=0; i<list.size(); i++){
				MedicamentDTO meDto = new MedicamentDTO();
				meDto.setMedicament_name(list.get(i));
				meDto.setAm_count(Integer.parseInt(clist.get(i)));
				meDto.setStore_code(store_code);
				medicamentDAO.updateAmountOfHistory(meDto);
			}
			
		}
	}
	@RequestMapping("historydelete.pet")
	public String deleteHistory(int key){
		PetHistoryDAO petHistoryDAO = sqlSession.getMapper(PetHistoryDAO.class);
		petHistoryDAO.deleteHistory(key);
		return "redirect:selectallhistory.pet";
	}
	
	@RequestMapping("treatList.pet")
	public String getTreatList(HttpSession session, Model model) throws Exception{
		PetHistoryDAO petHistoryDAO = sqlSession.getMapper(PetHistoryDAO.class);
		String store_code = (String)session.getAttribute("session_store_code");
		List<CounterDTO> clist = petHistoryDAO.getTreatList(store_code);
		model.addAttribute("clist", clist);
		return "/history/waitingView";
	}
	@RequestMapping("tt.pet")
	public String tt(){
		return "/history/tt";
	}
}
