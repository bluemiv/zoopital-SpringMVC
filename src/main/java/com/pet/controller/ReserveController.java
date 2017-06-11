package com.pet.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSplitPaneUI;

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
import com.pet.model.EmpDAO;
import com.pet.model.EmpDTO;
import com.pet.model.PetDAO;
import com.pet.model.PetDTO;
import com.pet.model.ReserveDAO;
import com.pet.model.ReserveDTO;

@Controller
@RequestMapping("/reserve/")
public class ReserveController {
	
	//Mybatis
	@Autowired
	private SqlSession sqlSession;
			
	//전체 예약리스트 볼때 사용하는 컨트롤러
	
	@RequestMapping("/reserveListForm.pet")
	public String reserveListForm(Model model, HttpSession session){
		System.out.println("reserveListForm 컨트롤러 진입");
		
		ReserveDTO reserveDTO = new ReserveDTO();
		reserveDTO.setStore_code((String)session.getAttribute("session_store_code"));		
		
		ReserveDAO reserveDAO = sqlSession.getMapper(ReserveDAO.class);
		List<ReserveDTO> reserveList = reserveDAO.selectReserve(reserveDTO);
		
		model.addAttribute("reserveList", reserveList);

		return "/reserve/reserveListForm";
	}
	
	//예약 삭제
		@RequestMapping("/reserveDeletePro.pet")
		public String reserveDeletePro(ReserveDTO dto, HttpSession session){
			System.out.println("reserveDeletePro 컨트롤러 진입");
			
			ReserveDAO reserveDAO = sqlSession.getMapper(ReserveDAO.class);
			reserveDAO.deleteReserve(dto.getReserve_code());
			
			return "redirect:reserveListForm.pet";
		}
	
	//날짜별로 선택해서 예약리스트 볼때 사용하는 컨트롤러
		@RequestMapping("/dateSelectedList.pet")
		public String dateSelectedList(ReserveDTO reserveDTO,HttpSession session, Model model){
			System.out.println("날짜선택 리스트 컨트롤러 진입");
			reserveDTO.setStore_code((String)session.getAttribute("session_store_code"));		
			
			ReserveDAO reserveDAO = sqlSession.getMapper(ReserveDAO.class);
			List<ReserveDTO> reserveList = reserveDAO.dateSelectedReserve(reserveDTO);
			model.addAttribute("reserveList", reserveList);
			
			return "/reserve/reserveListForm";
		}
	

	//동물리스트에서 예약 추가 버튼 클릭 시 연결되는 컨트롤러
	@RequestMapping("/reserveCalendarForm.pet")
	public String reserveInsertForm(HttpServletRequest request,HttpSession session, Model model) throws Exception{
		System.out.println("reserveListForm 컨트롤러 진입");
		
		//세션값 얻기 위해 직원 DTO 생성
		EmpDTO empDTO = new EmpDTO();
		EmpDAO empDAO = sqlSession.getMapper(EmpDAO.class);
		empDTO.setStore_code((String)session.getAttribute("session_store_code"));
		
		//해당 지점에 대한 직원 리스트 뽑아오기
		List<EmpDTO> empList = empDAO.getEmpList(empDTO);
		
		//개별 동물에 대한 예약목록 작성 위해 펫DTO 생성 후 DB에서 해당 동물 정보 얻어서
		PetDTO petDTO = new PetDTO();
		petDTO.setPet_code(Integer.parseInt(request.getParameter("pet_code")));
		PetDAO petDAO = sqlSession.getMapper(PetDAO.class);
		petDTO = petDAO.select_code(petDTO);
		
		//해당 지점 직원 리스트와, 예약 대상 동물 정보 보내기!
		model.addAttribute("empList", empList);
		model.addAttribute("petInfo", petDTO);
		
		return "/reserve/reserveCalendarForm";
	}
	
	//예약 추가 시 직원선택 후 날짜/시간 선택하는 폼으로 연결되는 컨트롤러
	@RequestMapping("/reserveInsertForm2.pet")
	public String reserveInsertForm2(ReserveDTO dto, HttpSession session,HttpServletRequest request, Model model) throws Exception{
		System.out.println("reserveInsertForm2 컨트롤러 진입");
		
		EmpDAO empDAO = sqlSession.getMapper(EmpDAO.class);
		ReserveDAO reserveDAO = sqlSession.getMapper(ReserveDAO.class);
		dto.setStore_code((String)session.getAttribute("session_store_code"));	
		
		List<ReserveDTO> reservedList = reserveDAO.select_available_time(dto);
		
		//해당 일에 가능한 시간만 리스트형태로 저장해서 넘기기
		List available_list = time(reservedList);
		
		
		//개별 동물에 대한 예약목록 작성 위해 펫DTO 생성 후 DB에서 해당 동물 정보 얻어서
		PetDTO petDTO = new PetDTO();
		petDTO.setPet_code(Integer.parseInt(request.getParameter("pet_code")));
		PetDAO petDAO = sqlSession.getMapper(PetDAO.class);
		petDTO = petDAO.select_code(petDTO);

		
		model.addAttribute("available_list", available_list);
		model.addAttribute("emp_name", dto.getEmp_name());
		model.addAttribute("reserve_date", dto.getReserve_date());
		model.addAttribute("petInfo", petDTO);
		
		return "/reserve/reserveInsertForm2";
	}	
	
	//예약 추가
	@RequestMapping("/reserveInsertPro.pet")
	public String reserveInsertPro(ReserveDTO dto, HttpSession session){
		System.out.println("reserveInsertPro 컨트롤러 진입");
		
		ReserveDAO reserveDAO = sqlSession.getMapper(ReserveDAO.class);

		dto.setStore_code((String)session.getAttribute("session_store_code"));
		dto.toString();
		
		reserveDAO.insertReserve(dto);
		
		return "redirect:reserveListForm.pet";

	}
	
	//예약 리스트에서 방문완료/미방문 버튼 클릭 시 실행되는 컨트롤러
	@Transactional
	@RequestMapping("/reserveVisited.pet")
	public String reserveVisited(HttpServletRequest request) throws Exception{
		System.out.println("reserveVisited 컨트롤러 진입");		
	
		ReserveDAO reserveDAO = sqlSession.getMapper(ReserveDAO.class);
		CounterDAO counterDAO = sqlSession.getMapper(CounterDAO.class);
		if (request.getParameter("visited") != null) {
			String reserve_code = request.getParameter("visited");
			CounterDTO counterDTO = reserveDAO.getReserveInfoForAccept(reserve_code);
			counterDAO.insertAccept(counterDTO);
			reserveDAO.changeStatusVisited(reserve_code);
		}
		
		if (request.getParameter("notvisited") != null) {
			
			String reserve_code = request.getParameter("notvisited");
			reserveDAO.changeStatusNotVisited(reserve_code);
		}
		
		return "redirect:reserveListForm.pet";
	}
	
	
	//////////////////////////////////////////////
	private List<Integer> time(List<ReserveDTO> reserveDTOList){
	       final int INPUT_SIZE = reserveDTOList.size();
	       
	       int[] arr = {9, 10, 11, 12, 13, 14, 15, 16, 17, 18};
	       
	       for(int i=0; i < INPUT_SIZE; i++){
	          for(int j = 0; j < arr.length; j++){
	              if((reserveDTOList.get(i).getReserve_start_time()<= arr[j]) && (reserveDTOList.get(i).getReserve_end_time() > arr[j])){
	                 arr[j] = 0;
	              }
	          }
	       }
	       List<Integer> output_list= new ArrayList<Integer>();
	       for(int i=0; i < arr.length; i++){
	          if(arr[i] != 0){
	             output_list.add(arr[i]);
	          }
	       }
	       return output_list;
	    }
	
	
	//예약 변경 폼컨트롤러
	@RequestMapping("/reserveUpdateForm.pet")
	public String reserveUpdateForm(ReserveDTO dto, Model model, HttpSession session){
		System.out.println("reserveUpdateForm 컨트롤러 진입");
		
		ReserveDAO reserveDAO = sqlSession.getMapper(ReserveDAO.class);
		dto = reserveDAO.getReserveInfo(dto);
		
		//직원 변경 위해 해당 지점 직원 모두 불러와서 드롭박스에 띄워줘야 함
		EmpDAO empDAO = sqlSession.getMapper(EmpDAO.class);
		EmpDTO empDTO = new EmpDTO();
		empDTO.setStore_code((String)session.getAttribute("session_store_code"));
		List<EmpDTO> empList = empDAO.getEmpList(empDTO);
		
		//변경 시 선택된 날짜에 따라.. 다시 가능 시간 띄워줘야 하는뎅...?Ajax?
		List<ReserveDTO> reservedList = reserveDAO.select_available_time(dto);
		
		//해당 일에 가능한 시간만 리스트형태로 저장해서 넘기기
		List available_list = time(reservedList);

		model.addAttribute("reservation", dto);
		model.addAttribute("empList", empList);
		model.addAttribute("available_list", available_list);

		return "/reserve/reserveUpdateForm";
	}
	
	//예약 변경 실행 컨트롤러
	@RequestMapping("/reserveUpdatePro.pet")
	public String reserveUpdatePro(ReserveDTO dto, HttpSession session){
		System.out.println("reserveUpdatePro 컨트롤러 진입");
				
		ReserveDAO reserveDAO = sqlSession.getMapper(ReserveDAO.class);
		reserveDAO.updateReserve(dto);
		
		return "redirect:reserveListForm.pet";
	}
	
	//지난 예약 보기 위해 실행되는 컨트롤러!
	@RequestMapping("/passReservationList.pet")
	public String passReservationList(Model model, HttpSession session){
		System.out.println("passReservationList 컨트롤러 진입");
		
		ReserveDTO reserveDTO = new ReserveDTO();
		reserveDTO.setStore_code((String)session.getAttribute("session_store_code"));		
		
		ReserveDAO reserveDAO = sqlSession.getMapper(ReserveDAO.class);
		List<ReserveDTO> passReservationList = reserveDAO.passReservationList(reserveDTO);
		model.addAttribute("passReservationList", passReservationList);
		
		return "/reserve/passReservationList";
	}
	
	/////////////////////////////////////////////
	//////////////////// AJAX ///////////////////
	/////////////////////////////////////////////
	@ResponseBody
	@RequestMapping("available_timeSearchAjax.pet")
	public List available_timeSearchAjax(@RequestBody String date, @RequestBody String emp_name, HttpSession session) throws Exception {
		
		System.out.println("Ajax 실행????");
		StringTokenizer tokenizer = new StringTokenizer(emp_name, "=");
		
		while (tokenizer.hasMoreTokens()) {
			emp_name = tokenizer.nextToken();
		}
		System.out.println(date);
		date = date.split("=")[1];
		System.out.println("date = "  + date);
		
		
		System.out.println(emp_name);
		ReserveDTO reserveDTO = new ReserveDTO();
//		reserveDTO.setReserve_date();
		reserveDTO.setEmp_name(emp_name);

		// 세션 store 값 가져옴
		reserveDTO.setStore_code((String) session.getAttribute("session_store_code"));

		System.out.println("------------------------------");
		System.out.println(reserveDTO.toString());
		
		ReserveDAO reserveDAO = sqlSession.getMapper(ReserveDAO.class);
		List<ReserveDTO> reservedList = reserveDAO.select_available_time(reserveDTO);
		
		//해당 일에 가능한 시간만 리스트형태로 저장해서 넘기기
		List available_list = time(reservedList);
		
		return available_list;
	} // 검색 추천 기능
	
	@ResponseBody
	@RequestMapping("end_timeSearchAjax.pet")
	public List<Integer> end_timeSearchAjax(@RequestBody ReserveDTO reserveDTO, HttpSession session) throws Exception {
		System.out.println("end_timeSearchAjax 접근");
		ReserveDAO reserveDAO = sqlSession.getMapper(ReserveDAO.class);
		String store_code = (String)session.getAttribute("session_store_code");
		reserveDTO.setStore_code(store_code);
		List<Integer> reservedList = reserveDAO.getStartNum(reserveDTO);
		reservedList.add(20);
		int start_time = reserveDTO.getReserve_start_time(); // 시작 시간
		List test = new ArrayList();
		boolean check = false;
		for(int i = start_time + 1; i<20; i++){
			if(check == true){
				break;
			}
			for(int j = 0; j<reservedList.size(); j++){
				if(reservedList.get(j) >= i){
					test.add(i);
					if(reservedList.get(j) == i){
						check = true;
					}
					break;
				}
			}
		}
		
		return test;
	}

	
	// 모든 예약 일정 가져옴
	@ResponseBody
	@RequestMapping("reserveCalendarFormAjax.pet")
	public List<ReserveDTO> reserveCalendarFormAjax(HttpSession session) throws Exception{
		System.out.println("reserveCalendarFormAjax");
		
		// DB에서 모든 일정을 불러온다
		ReserveDTO reserveDTO = new ReserveDTO();
		reserveDTO.setStore_code((String)session.getAttribute("session_store_code"));		
		ReserveDAO reserveDAO = sqlSession.getMapper(ReserveDAO.class);
		List<ReserveDTO> passReservationList = reserveDAO.reservationListAll(reserveDTO);
		
		// 시작 시간, 시작 날짜 가져오기
		for(int i=0; i < passReservationList.size(); i++){
			String start = String.valueOf(passReservationList.get(i).getReserve_date()) + " " + passReservationList.get(i).getReserve_start_time() + ":00:00";
			String end = String.valueOf(passReservationList.get(i).getReserve_date()) + " " + passReservationList.get(i).getReserve_end_time() + ":00:00";
			passReservationList.get(i).setStart(start);
			passReservationList.get(i).setEnd(end);
		}
		
		return passReservationList;
	}
}

	

