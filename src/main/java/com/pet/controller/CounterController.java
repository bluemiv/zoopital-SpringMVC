package com.pet.controller;

import java.sql.Date;
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
import com.pet.model.PetDTO;
import com.pet.model.PetHistoryDAO;
import com.pet.model.PetHistoryDTO;
import com.pet.model.SalesLogDAO;
import com.pet.model.ShotDAO;
import com.pet.model.ShotDTO;

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
	
	@RequestMapping("searchCounter.pet")
	public String search(String petname, HttpSession session, Model model) throws Exception{
		CounterDAO counterDAO = sqlSession.getMapper(CounterDAO.class);
		String store_code = (String)session.getAttribute("session_store_code");
		PetDTO dto=new PetDTO();
		dto.setPet_name(petname);
		dto.setStore_code(store_code);
		List<PetDTO> list= counterDAO.searchList(dto);
		model.addAttribute("plist", list);
		
		return "/counter/counterPetList";
	}
	
	@RequestMapping("accept.pet")
	public String accept(int pet_code, Model model, HttpSession session) throws Exception{
		CounterDAO counterDAO = sqlSession.getMapper(CounterDAO.class);
		String store_code = (String)session.getAttribute("session_store_code");
		PetDTO petDTO = new PetDTO();
		petDTO = counterDAO.getPetInfo(pet_code);
		List<CounterDTO> clist = counterDAO.getDoctorName(store_code);
		model.addAttribute("pdto", petDTO);
		model.addAttribute("clist", clist);
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
		System.out.println("payingEnd 접근");
		// dao 객체 생성
		PetHistoryDAO petHistoryDAO = sqlSession.getMapper(PetHistoryDAO.class);
		SalesLogDAO salesLogDAO = sqlSession.getMapper(SalesLogDAO.class);
		ShotDAO shotDAO=sqlSession.getMapper(ShotDAO.class);
		MedicamentDAO medicamentDAO=sqlSession.getMapper(MedicamentDAO.class);
		
		// 세션 값 가져옴
		String store_code = (String)session.getAttribute("session_store_code");
		
		// 모든 처방약 가져옴
		String str=petHistoryDTO.getPethistory_medicine();
		// 약 나눔
		String[] medicine=str.split(",");
		
		for(int i=0; i< medicine.length; i++){
			// 종류가 주사인 약만 가져옴 
			MedicamentDTO medicamentDTO = new MedicamentDTO();
			medicamentDTO.setMedicament_name(medicine[i]);
			medicamentDTO.setStore_code(store_code);
			medicamentDTO = medicamentDAO.selectShot_medicine(medicamentDTO);
			
			// 값이 있을때만 실행(약종류 == 주사)
			if(medicamentDTO != null){
				int shot_cycle=medicamentDTO.getMedicament_cycle();
				String shot_name=medicamentDTO.getMedicament_name();
				
				// shot table에 들어갈 주사 정보를 가져옴
				ShotDTO shotDTO = new ShotDTO();
				shotDTO.setShot_name(shot_name);
				shotDTO.setPetaccept_code(petHistoryDTO.getPetaccept_code());
				shotDTO = shotDAO.selectShot(shotDTO);
				
				// 위에서 가져온 shot 정보를 insert
				shotDTO.setShot_cycle(shot_cycle);
				insert_shotPro(shotDTO);
			}
		}
	
		SalesLogController sc = new SalesLogController();
		String today = sc.checkSalesDB(store_code,salesLogDAO);
		petHistoryDTO.setToday(today);
		salesLogDAO.upDateIncome(petHistoryDTO);
		salesLogDAO.upDateNIncome(petHistoryDTO);
		System.out.println("완료?");
		petHistoryDAO.deleteWaiting(petHistoryDTO.getPetaccept_code());
		return "redirect:payingList.pet";
	}
	
	public void insert_shotPro(ShotDTO dto) throws Exception{
		
		System.out.println("insertShotPro 접근");
		
		System.out.println("insertShotPro: "+dto.toString());
		//시간 계산
		long time = System.currentTimeMillis();
		Date shot_date = new Date(time);
		System.out.println("shot_date: "+ shot_date);
		
		Date shot_must=calMustDate(shot_date, dto.getShot_cycle());
		System.out.println("shot_must: "+ shot_must);
		
		dto.setShot_date(shot_date);
		dto.setShot_must(shot_must);
		
		System.out.println(dto.toString());

		ShotDAO shotDAO = sqlSession.getMapper(ShotDAO.class);
		shotDAO.insertShot(dto);
		
	}
	//날짜 더하기 계산
	private Date calMustDate (Date startDate, int cycle) throws Exception {
	       
	       // java.sql.Date -> String 형변환
	       String d1 = String.valueOf(startDate);
	       
	       int year_int = Integer.parseInt(d1.split("-")[0]);
	       int month_int = Integer.parseInt(d1.split("-")[1]);
	       int day_int = Integer.parseInt(d1.split("-")[2]);
	       
	       int cal_year_int = year_int;
	       int cal_month_int = (month_int + cycle);
	       if(cal_month_int > 12){
	          cal_year_int++;
	          cal_month_int -= 12;
	       }
	       String mustDate_str = String.valueOf(cal_year_int+"-"+cal_month_int+"-"+day_int);
	       Date mustDate = Date.valueOf(mustDate_str);
	       
	       return mustDate;
	    }
}

