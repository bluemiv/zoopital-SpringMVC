package com.pet.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pet.model.EmpDAO;
import com.pet.model.EmpDTO;
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
	
	//날짜별로 선택해서 예약리스트 볼때 사용하는 컨트롤러
		@RequestMapping("/dateSelectedList.pet")
		public String dateSelectedList(ReserveDTO reserveDTO,HttpSession session, Model model){
			System.out.println("날짜선택 리스트 컨트롤러 진입");
			System.out.println(reserveDTO.getReserve_date());
			reserveDTO.setStore_code((String)session.getAttribute("session_store_code"));		
			
			ReserveDAO reserveDAO = sqlSession.getMapper(ReserveDAO.class);
			List<ReserveDTO> reserveList = reserveDAO.dateSelectedReserve(reserveDTO);
			model.addAttribute("reserveList", reserveList);
			
			return "/reserve/reserveListForm";
		}
	

	//예약 추가 시 직원선택하는 폼으로 연결되는 컨트롤러
	@RequestMapping("/reserveInsertForm.pet")
	public String reserveInsertForm(HttpSession session, Model model){
		System.out.println("reserveListForm 컨트롤러 진입");
		
		EmpDTO dto = new EmpDTO();
		dto.setStore_code((String)session.getAttribute("session_store_code"));
		EmpDAO empDAO = sqlSession.getMapper(EmpDAO.class);
		List<EmpDTO> empList = empDAO.getEmpList(dto);
		
		model.addAttribute("empList", empList);
		
		return "/reserve/reserveInsertForm";
	}
	
	//예약 추가 시 직원선택 후 날짜/시간 선택하는 폼으로 연결되는 컨트롤러
	@RequestMapping("/reserveInsertForm2.pet")
	public String reserveInsertForm2(ReserveDTO dto, HttpSession session, Model model){
		System.out.println("reserveListForm2 컨트롤러 진입");
		System.out.println(dto.getReserve_date());
		System.out.println(dto.getEmp_name());
		
		EmpDAO empDAO = sqlSession.getMapper(EmpDAO.class);
		
		ReserveDAO reserveDAO = sqlSession.getMapper(ReserveDAO.class);

		dto.setStore_code((String)session.getAttribute("session_store_code"));	
		
		List<ReserveDTO> reservedList = reserveDAO.select_available_time(dto);
		
		//해당 일에 가능한 시간만 리스트형태로 저장해서 넘기기
		List available_list = time(reservedList);
		
		System.out.println("-------------------");
		System.out.println(available_list.toString());
		
		model.addAttribute("available_list", available_list);
		model.addAttribute("emp_name", dto.getEmp_name());
		model.addAttribute("reserve_date", dto.getReserve_date());
		
		return "/reserve/reserveInsertForm2";
	}	
	
	//예
	@RequestMapping(value="/reserveInsertPro.pet")
	public String reserveInsertPro(ReserveDTO dto, HttpSession session, HttpServletRequest request){

		String startTime = request.getParameter("reserve_start_time");
		String endTime = request.getParameter("reserve_end_time");
		
		System.out.println(startTime + " " + endTime);
		
		
		dto.setReserve_start_time(Integer.parseInt(startTime));
		dto.setReserve_end_time(Integer.parseInt(endTime));
		System.out.println(dto);
		
		System.out.println("reserveInsertPro 컨트롤러 진입");
		int reserve_start_time = Integer.parseInt(request.getParameter("reserve_start_time"));
		System.out.println("reserve_start_time: "+reserve_start_time);
				
		
		System.out.println(dto.getReserve_start_time());
		System.out.println(dto.getReserve_end_time());
		
		
		ReserveDAO reserveDAO = sqlSession.getMapper(ReserveDAO.class);

		dto.setStore_code((String)session.getAttribute("session_store_code"));	
		reserveDAO.insertReserve(dto);
		
		return "redirect:reserveListForm.pet";

	}
	
	//예약 리스트에서 방문완료/미방문 버튼 클릭 시 실행되는 컨트롤러
	@RequestMapping("/reserveVisited.pet")
	public String reserveVisited(HttpServletRequest request){
		System.out.println("reserveVisited 컨트롤러 진입");		
	
		ReserveDAO reserveDAO = sqlSession.getMapper(ReserveDAO.class);
		
		if (request.getParameter("visited") != null) {

			String reserve_code = request.getParameter("reserve_code");
			reserveDAO.changeStatusVisited(reserve_code);
		}
		
		if (request.getParameter("notvisited") != null) {
			
			String reserve_code = request.getParameter("reserve_code");
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
	
	
	private List<Integer> end_time(List<ReserveDTO> reserveDTOList){
		final int INPUT_SIZE = reserveDTOList.size();
		
		int[] arr = {10, 11, 12, 13, 14, 15, 16, 17, 18, 19};
		
		for(int i=0; i < INPUT_SIZE; i++){
			for(int j = 0; j < arr.length; j++){
				if((reserveDTOList.get(i).getReserve_end_time()<= arr[j]) && (reserveDTOList.get(i).getReserve_end_time() > arr[j])){
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
	
}
