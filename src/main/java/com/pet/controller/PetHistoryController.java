package com.pet.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String selectAllHistory(Model model){
		PetHistoryDAO petHistroyDAO = sqlSession.getMapper(PetHistoryDAO.class);
		List<PetHistoryDTO> petlist;
		petlist = petHistroyDAO.selectAllHistory();
		model.addAttribute("hlist", petlist);
		return "/history/historyView";
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
	public String historyinsert(int pet_code, String test, Model model) throws Exception{
		System.out.println("넘어올 데이터 넘어오나? " + test);
		System.out.println("코드도 넘어오지? " + pet_code);
		PetHistoryDAO petHistroyDAO = sqlSession.getMapper(PetHistoryDAO.class);
		PetDAO petDAO = sqlSession.getMapper(PetDAO.class);
		MedicamentDAO medicamentDAO = sqlSession.getMapper(MedicamentDAO.class);
		PetDTO petDTO = petDAO.getHistoryInfo(pet_code);
		List<MedicamentDTO> mlist = medicamentDAO.getSelectAll(); 
		//약 추가를 눌렀을때 하는 기능(넘어오는 파라미터가 널이면 실행아 되면 안됨)
		if(test != null){
			List<String> list = new ArrayList<String>();
			StringTokenizer stk = new StringTokenizer(test, ",");
			int ii =0;
			while(stk.hasMoreElements()){
				list.add(stk.nextToken());
				System.out.println("list.get("+ ii + "): "+ list.get(ii) + " 를 담았습니다");
				System.out.println("list size = " + list.size());
				ii++;
			}
		List<MedicamentDTO> add_mlist = new ArrayList<MedicamentDTO>();
		if(list.size()==1){
			MedicamentDTO mdto = new MedicamentDTO();
			mdto = medicamentDAO.getSelectChoice2(list.get(0));
			add_mlist.add(mdto);
		}else if(list.size()>1){
			for(int i=1; i<list.size(); i++){
				MedicamentDTO mdto = new MedicamentDTO();
				mdto = (MedicamentDTO) medicamentDAO.getSelectChoice2(list.get(i));
				add_mlist.add(mdto);
			}
			MedicamentDTO mdto = new MedicamentDTO();
			mdto = (MedicamentDTO) medicamentDAO.getSelectChoice2(list.get(0));
			add_mlist.add(mdto);
		}
		//넘겨줄 리스트에 select문 담고...
		/*List<MedicamentDTO> addmlist = medicamentDAO.getSelectChoice(list);*/
		model.addAttribute("addmdto" , add_mlist);
		}
		model.addAttribute("pdto", petDTO);
		model.addAttribute("mdto", mlist);
		
		return "/history/historyInsertForm";
	}
	
	@RequestMapping("dhistoryinsert.pet")
	public String dhistoryinsert(int pet_code, String test, String del_num, Model model) throws Exception{
		System.out.println("넘어올 데이터 넘어오나? " + test);
		System.out.println("코드도 넘어오지? " + pet_code);
		System.out.println("지울 넘버? " + del_num);
		PetHistoryDAO petHistroyDAO = sqlSession.getMapper(PetHistoryDAO.class);
		PetDAO petDAO = sqlSession.getMapper(PetDAO.class);
		MedicamentDAO medicamentDAO = sqlSession.getMapper(MedicamentDAO.class);
		PetDTO petDTO = petDAO.getHistoryInfo(pet_code);
		List<MedicamentDTO> mlist = medicamentDAO.getSelectAll(); 
		//약 추가를 눌렀을때 하는 기능(넘어오는 파라미터가 널이면 실행아 되면 안됨)
		if(test != null){
			List<String> list = new ArrayList<String>();
			StringTokenizer stk = new StringTokenizer(test, ",");
			int ii =0;
			while(stk.hasMoreElements()){
				list.add(stk.nextToken());
				System.out.println("list.get("+ ii + "): "+ list.get(ii) + " 를 담았습니다");
				System.out.println("list size = " + list.size());
				ii++;
			}
			list.remove(Integer.parseInt(del_num)-1);
		List<MedicamentDTO> add_mlist = new ArrayList<MedicamentDTO>();
			for(int i=0; i<list.size(); i++){
				MedicamentDTO mdto = new MedicamentDTO();
				mdto = (MedicamentDTO) medicamentDAO.getSelectChoice2(list.get(i));
				add_mlist.add(mdto);
			}
			/*MedicamentDTO mdto = new MedicamentDTO();
			mdto = (MedicamentDTO) medicamentDAO.getSelectChoice2(list.get(0));
			add_mlist.add(mdto);*/
		//넘겨줄 리스트에 select문 담고...
		/*List<MedicamentDTO> addmlist = medicamentDAO.getSelectChoice(list);*/
		model.addAttribute("addmdto" , add_mlist);
		}
		model.addAttribute("pdto", petDTO);
		model.addAttribute("mdto", mlist);
		
		return "/history/historyInsertForm";
	}
	@RequestMapping("inserthistoryend.pet")
	public String inserthistoryend(PetHistoryDTO petHistoryDTO, String test, String pet_name, String am_count){
		PetHistoryDAO petHistoryDAO = sqlSession.getMapper(PetHistoryDAO.class);
		System.out.println("coments = " + petHistoryDTO.getPethistory_coments());
		System.out.println("code = " + petHistoryDTO.getPethistory_petcode());
		System.out.println("command = " + test);
		medicamentUpdate(test,am_count);
		if(test.equals("")){
			test = "해당없음";
			petHistoryDTO.setPethistory_medicine(test);
		}else{
			String temp = "";
			List<String> list = new ArrayList<String>();
			StringTokenizer stk = new StringTokenizer(test, ",");
			int i = 0;
			while(stk.hasMoreElements()){
				list.add(stk.nextToken());
				temp += list.get(i) + ",";
				i += 1;
			}
			petHistoryDTO.setPethistory_medicine(temp);
		}
		petHistoryDTO.setPethistory_name(pet_name);
		/*System.out.println("m_amount = " + m_amount);
		System.out.println("m_cost = " + m_cost);*/
		petHistoryDAO.insertHistory(petHistoryDTO);
		return "redirect:../home.pet";
	}
	public void medicamentUpdate(String test, String am_count){
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
	@RequestMapping("script.pet")
	public String script(){
		PetHistoryDAO petHistoryDAO = sqlSession.getMapper(PetHistoryDAO.class);
		return "/history/script";
	}
	@RequestMapping("script2.pet")
	public String script2(){
		PetHistoryDAO petHistoryDAO = sqlSession.getMapper(PetHistoryDAO.class);
		return "/history/script2";
	}
	@RequestMapping("test.pet")
	public String test(int pet_code, String test, String am_count, Model model) throws Exception{
		System.out.println("-----test.pet 안이에요");
		System.out.println("test : " + test);
		System.out.println("am_count : " + am_count);
		System.out.println("pet_code : " + pet_code);
		return "/history/script2";
	}
}
