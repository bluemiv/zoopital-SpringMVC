package com.pet.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pet.model.CounterDAO;
import com.pet.model.CounterDTO;
import com.pet.model.MedicamentDAO;
import com.pet.model.MedicamentDTO;
import com.pet.model.PetDAO;
import com.pet.model.PetDTO;
import com.pet.model.PetHistoryDAO;
import com.pet.model.PetHistoryDTO;
import com.pet.model.SalesLogDAO;
import com.pet.model.SalesLogDTO;

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
	@RequestMapping("searchHistory.pet")
	public String searchForHistory(String petname, Model model, HttpSession session) throws Exception{
		PetHistoryDAO petHistoryDAO = sqlSession.getMapper(PetHistoryDAO.class);
		String store_code = (String)session.getAttribute("session_store_code");
		PetHistoryDTO petHistoryDTO = new PetHistoryDTO();
		petHistoryDTO.setPet_name(petname);
		petHistoryDTO.setStore_code(store_code);
		List<PetHistoryDTO> petlist = petHistoryDAO.searchHistory(petHistoryDTO);
		model.addAttribute("hlist", petlist);
		return "/history/historyListView";
	}
	@RequestMapping("searchMyHistory.pet")
	public String searchMyHistory(HttpSession session,Model model) throws Exception{
		PetHistoryDAO petHistoryDAO = sqlSession.getMapper(PetHistoryDAO.class);
		String store_code = (String)session.getAttribute("session_store_code");
		String emp_name = (String)session.getAttribute("session_emp_name");
		PetHistoryDTO petHistoryDTO = new PetHistoryDTO();
		petHistoryDTO.setStore_code(store_code);
		petHistoryDTO.setEmp_name(emp_name);
		List<PetHistoryDTO> petlist = petHistoryDAO.searchMyHistory(petHistoryDTO);
		model.addAttribute("hlist", petlist);
		return "/history/historyListView";
	}
	@RequestMapping("searchMyWaiting.pet")
	public String searchMyWaiting(HttpSession session, Model model) throws Exception{
		PetHistoryDAO petHistoryDAO = sqlSession.getMapper(PetHistoryDAO.class);
		String store_code = (String)session.getAttribute("session_store_code");
		String emp_name = (String)session.getAttribute("session_emp_name");
		List<CounterDTO> clist = petHistoryDAO.searchMyWaiting(store_code, emp_name);
		model.addAttribute("clist", clist);
		return "/history/waitingView";
	}
	@RequestMapping("historyinsert.pet")
	public String historyinsert(int pet_code, String test, int petaccept_code,String am_count,int m_total_cost, 
			int treat_cost, HttpSession session, Model model) throws Exception{
		String store_code = (String)session.getAttribute("session_store_code");
		String emp_name = (String)session.getAttribute("session_emp_name");
		System.out.println("emp_name = " + emp_name);
		System.out.println("code = " + store_code);
		System.out.println("넘어올 데이터 넘어오나? " + test);
		System.out.println("코드도 넘어오지? " + pet_code);
		System.out.println("접수코드도 넘어오지? " + petaccept_code);
		System.out.println("am_count : " + am_count);
		PetHistoryDAO petHistroyDAO = sqlSession.getMapper(PetHistoryDAO.class);
		PetDAO petDAO = sqlSession.getMapper(PetDAO.class);
		MedicamentDAO medicamentDAO = sqlSession.getMapper(MedicamentDAO.class);
		PetDTO petDTO = petDAO.getHistoryInfo(pet_code);
		//다시 뿌려주기위해...
		CounterDTO counterDTO = new CounterDTO();
		counterDTO.setPetaccept_code(petaccept_code);
		counterDTO.setM_total_cost(m_total_cost);
		counterDTO.setTreat_cost(treat_cost);
		counterDTO.setEmp_name(emp_name);
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
		String emp_name = (String)session.getAttribute("session_emp_name");
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
		counterDTO.setEmp_name(emp_name);
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
		String emp_name = (String)session.getAttribute("session_emp_name");
		System.out.println("coments = " + petHistoryDTO.getPethistory_coments());
		System.out.println("code = " + petHistoryDTO.getPethistory_petcode());
		System.out.println("command = " + test);
		System.out.println("am_count = " + am_count);
		
		if(test.equals("")){
			test = "해당없음";
			petHistoryDTO.setPethistory_medicine(test);
			petHistoryDTO.setPethistory_m_amount("0");
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
			medicamentUpdate(test,am_count, store_code);
		}
		petHistoryDTO.setStore_code(store_code);
		petHistoryDTO.setPethistory_name(pet_name);
		CounterDTO cdto = counterDAO.getTime(petaccept_code);
		petHistoryDTO.setPethistory_btoday(cdto.getPetaccept_date());
		petHistoryDTO.setPethistory_cost(counterDTO.getTreat_cost());
		petHistoryDTO.setPethistory_m_cost(counterDTO.getM_total_cost());
		petHistoryDTO.setEmp_name(emp_name);
		/*System.out.println("m_amount = " + m_amount);
		System.out.println("m_cost = " + m_cost);*/
		petHistoryDAO.insertHistory(petHistoryDTO);
		petHistoryDAO.updateWaiting(petaccept_code);
		return "redirect:../home.pet";
	}
	
	//약품 재고를 변경해주는 메소드(insert시에만 적용되기 때문에 재고량 -만 적용)
	public void medicamentUpdate(String test, String am_count, String store_code){
		MedicamentDAO medicamentDAO = sqlSession.getMapper(MedicamentDAO.class);
		if(!test.equals("해당없음")){
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
	@RequestMapping("modifyHistory.pet")
	public String modifyHistory(int pethistory_key, HttpSession session, Model model) throws Exception{
		PetHistoryDAO petHistoryDAO = sqlSession.getMapper(PetHistoryDAO.class);
		MedicamentDAO medicamentDAO = sqlSession.getMapper(MedicamentDAO.class);
		PetHistoryDTO petHistoryDTO = petHistoryDAO.getDto(pethistory_key);
		String am_count = petHistoryDTO.getPethistory_m_amount();
		String m_name = petHistoryDTO.getPethistory_medicine();
		String store_code = petHistoryDTO.getStore_code();
		StringTokenizer stk = new StringTokenizer(m_name, ",");
		StringTokenizer cstk = new StringTokenizer(am_count, ",");
		List<String> list = new ArrayList<String>();
		List<String> c_list = new ArrayList<String>();
		while(stk.hasMoreTokens()){
			list.add(stk.nextToken());
		}
		while(cstk.hasMoreTokens()){
			c_list.add(cstk.nextToken());
		}
		System.out.println("list : - " + list.toString());
		System.out.println("c_list : " + c_list.toString());
		List<MedicamentDTO> add_mlist = new ArrayList<MedicamentDTO>();
		if(list.size()==1){
			if(list.get(0).equals("해당없음")){
				//해당없음일때에는 add_mlist추가하지 말기
			}else{
				MedicamentDTO mdto = new MedicamentDTO();
				mdto = medicamentDAO.getSelectChoice2(store_code, list.get(0));
				mdto.setAm_count(Integer.parseInt(c_list.get(0)));
				add_mlist.add(mdto);
			}
		}else if(list.size()>1){
			for(int i=0; i<list.size(); i++){
				MedicamentDTO mdto = new MedicamentDTO();
				mdto = medicamentDAO.getSelectChoice2(store_code, list.get(i));
				mdto.setAm_count(Integer.parseInt(c_list.get(i)));
				add_mlist.add(mdto);
			}
			/*MedicamentDTO mdto = new MedicamentDTO();
			mdto = (MedicamentDTO) medicamentDAO.getSelectChoice2(store_code, list.get(0));
			add_mlist.add(mdto);*/
		}
		model.addAttribute("addmdto" , add_mlist);
		List<MedicamentDTO> mlist = medicamentDAO.getSelectAll(petHistoryDTO.getStore_code());
		//약 추가를 눌렀을때 하는 기능(넘어오는 test파라미터가 널이면 실행이 되면 안됨)
		model.addAttribute("pdto", petHistoryDTO);
		model.addAttribute("mdto", mlist);
		
		return "/history/historyModifyForm";
	}
	@RequestMapping("modifyPlus.pet")
	public String modifyPlus(PetHistoryDTO petHistoryDTO, int mod_cost, int mod_m_cost,
			String am_count, String test, Model model)throws Exception{
		PetHistoryDAO petHistoryDAO = sqlSession.getMapper(PetHistoryDAO.class);
		MedicamentDAO medicamentDAO = sqlSession.getMapper(MedicamentDAO.class);
		System.out.println("추가 버튼 눌렀을 때 넘어오는 DTO " + petHistoryDTO.toString());
		System.out.println("추가 버튼 눌렀을 때 넘어오는 mod_cost " + mod_cost);
		System.out.println("추가 버튼 눌렀을 때 넘어오는 mod_m_cost " + mod_m_cost);
		System.out.println("추가 버튼 눌렀을 때 넘어오는 am_count " + am_count);
		System.out.println("추가 버튼 눌렀을 때 넘어오는 test " + test);
		String store_code = petHistoryDTO.getStore_code();
		petHistoryDTO.setPethistory_m_cost(mod_m_cost);
		petHistoryDTO.setPethistory_cost(mod_cost);
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
			model.addAttribute("addmdto" , add_mlist);
		}
		
		List<MedicamentDTO> mlist = medicamentDAO.getSelectAll(petHistoryDTO.getStore_code());
		model.addAttribute("mdto", mlist);
		model.addAttribute("pdto", petHistoryDTO);
		return "/history/historyModifyForm";
	}
	@RequestMapping("modifyMinus.pet")
	public String modifyMinus(PetHistoryDTO petHistoryDTO, int mod_cost, int mod_m_cost,
			String am_count, String test, String del_num, Model model) throws Exception{
		PetHistoryDAO petHistoryDAO = sqlSession.getMapper(PetHistoryDAO.class);
		MedicamentDAO medicamentDAO = sqlSession.getMapper(MedicamentDAO.class);
		List<MedicamentDTO> mlist = medicamentDAO.getSelectAll(petHistoryDTO.getStore_code());
		String store_code = petHistoryDTO.getStore_code();
		petHistoryDTO.setPethistory_cost(mod_cost);
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
			petHistoryDTO.setPethistory_m_cost(m_total_cost);
		//넘겨줄 리스트에 select문 담고...
		model.addAttribute("addmdto" , add_mlist);
		}
		model.addAttribute("mdto", mlist);
		model.addAttribute("pdto", petHistoryDTO);
		return "/history/historyModifyForm";
	}
	@Transactional
	@RequestMapping("modifyHistoryEnd.pet")
	public String modifyHistoryEnd(PetHistoryDTO petHistoryDTO, String am_count, String test,
			int mod_cost, int mod_m_cost) throws Exception{
		PetHistoryDAO petHistoryDAO = sqlSession.getMapper(PetHistoryDAO.class);
		MedicamentDAO medicamentDAO = sqlSession.getMapper(MedicamentDAO.class);
		SalesLogDAO salesLogDAO = sqlSession.getMapper(SalesLogDAO.class);
		CounterDAO counterDAO = sqlSession.getMapper(CounterDAO.class);
		String store_code = petHistoryDTO.getStore_code();

		//먼저 이전 값들을 통해서 다른 것들(약, 매출현황) 원복 부터 하자
		PetHistoryDTO pDto = petHistoryDAO.getDto(petHistoryDTO.getPethistory_key());
		String today=dateCal(pDto.getPethistory_today());
		//그날에 맞는 정보에 대해 수익리턴을 위해서
		petHistoryDTO.setToday(today);
		//여기서 만약 수납전이라면 돈은 굳이변경 안해도 상관이 없음.
		//그래서 디비가 존재하는지 여부 체크(수납이 완료되면 DB안에서 지워지기 때문에 거치는 과정)
		int result = counterDAO.checkExist(petHistoryDTO);

		if(result == 0){
			petHistoryDTO.setPethistory_m_cost(mod_m_cost - petHistoryDTO.getPethistory_m_cost());
			petHistoryDTO.setPethistory_cost(mod_cost - petHistoryDTO.getPethistory_cost());
			salesLogDAO.upDateIncome(petHistoryDTO);
			salesLogDAO.upDateNIncome(petHistoryDTO);
		}
		//-------------salesLog변경 완료
		//-------------약 재고 변경 관련
		//원래 수정전에 되어 있던 약의 재고를 다시 반환한다.
		String return_name = petHistoryDTO.getPethistory_medicine();
		String return_amount = petHistoryDTO.getPethistory_m_amount();
		//토큰 잘라주어서 업데이트 시켜야함.
		StringTokenizer name_stk = new StringTokenizer(return_name, ",");
		StringTokenizer amount_stk = new StringTokenizer(return_amount, ",");
		List<String> name_list = new ArrayList<String>();
		List<String> amount_list = new ArrayList<String>();
		int i = 0;
		while(name_stk.hasMoreElements()){
			MedicamentDTO mdto = new MedicamentDTO();
			name_list.add(name_stk.nextToken());
			amount_list.add(amount_stk.nextToken());
			mdto.setStore_code(store_code);
			mdto.setMedicament_name(name_list.get(i));
			mdto.setAm_count(Integer.parseInt(amount_list.get(i)));
			medicamentDAO.updateAmountReturn(mdto);
			i++;
		}
		//약 DB 다시 정산 완료 이제 변경한 사항을 업데이트 해주는 과정은 아래로
		
		if(test.equals("")){
			test = "해당없음";
			petHistoryDTO.setPethistory_medicine(test);
			petHistoryDTO.setPethistory_m_amount("0");
		}else{
			String temp = "";
			List<String> list = new ArrayList<String>();
			StringTokenizer stk = new StringTokenizer(test, ",");
			//temp에 담아서 DB에 저장
			while(stk.hasMoreElements()){
				list.add(stk.nextToken());	
			}
			//마지막에는 ,기호를 빼기위해서
			for(int j=0; j<list.size(); j++){
				if(j==list.size()-1){
					temp += list.get(j);
				}else{
					temp += list.get(j) + ",";
				}
			}
			System.out.println("temp 값 :" + temp);
			petHistoryDTO.setPethistory_medicine(temp);
			petHistoryDTO.setPethistory_m_amount(am_count);
			medicamentUpdate(test,am_count, store_code);
		}
		//변경 완료한 부분에 대해서 DTO부분 바뀐것으로 수정 후 업데이트 쿼리 실행해야 함
		petHistoryDTO.setPethistory_m_cost(mod_m_cost);
		petHistoryDTO.setPethistory_cost(mod_cost);
		System.out.println("업데이트 할 petHistoryDTO : " + petHistoryDTO.toString());
		petHistoryDAO.updateHistory(petHistoryDTO);
		return "redirect:selectallhistory.pet";
	}
	public String dateCal(Date t_today){
		SimpleDateFormat formatter = new SimpleDateFormat ("yy/MM/dd");
		String today=formatter.format(t_today);
		return today;
	}
	public String getToday(){
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat ("yyMMdd");
		String today = formatter.format(date);
		return today;
	}
	@RequestMapping("historyDetail.pet")
	public String historyDetail(int pethistory_key, Model model) throws Exception{
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
		return "/history/historyDetailView";
	}
	
	
	@RequestMapping("tt.pet")
	public String tt(){
		return "/history/tt";
	}
	
	@ResponseBody
	@RequestMapping("petHistoryDailyChartAjax.pet")
	public List<PetHistoryDTO> petHistoryDailyChartAjax(@RequestBody SalesLogDTO salesLogDTO, HttpSession session) throws Exception{
		System.out.println("petHistoryDailyChartAjax 접근");
		// 세션값 가져옴
		String store_code =(String)session.getAttribute("session_store_code");
		// 리스트 가져옴
		PetHistoryDTO petHistoryDTO = new PetHistoryDTO();
		petHistoryDTO.setPethistory_year(String.valueOf(salesLogDTO.getSaleslog_year()));
		petHistoryDTO.setStore_code(store_code);
		PetHistoryDAO petHistoryDAO = sqlSession.getMapper(PetHistoryDAO.class);
		List<PetHistoryDTO> list = petHistoryDAO.getHistoryTodayMonth(petHistoryDTO);
		System.out.println(list.get(0).getPethistory_count());
		return list;
	}
}
