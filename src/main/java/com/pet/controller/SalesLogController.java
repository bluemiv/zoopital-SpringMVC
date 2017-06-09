package com.pet.controller;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pet.model.SalesLogDAO;
import com.pet.model.SalesLogDTO;

@Controller
@RequestMapping("/saleslog/")
public class SalesLogController {
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping("dailylog.pet")
	public String dailylog(HttpSession session, Model model) throws Exception{
		String store_code = (String)session.getAttribute("session_store_code");
		SalesLogDAO salesLogDAO = sqlSession.getMapper(SalesLogDAO.class);
		checkSalesDB(store_code,salesLogDAO);
		List<SalesLogDTO> slist = salesLogDAO.getSalesList(store_code);
		model.addAttribute("slist", slist);
		return "/saleslog/dailylogView";
	}
	//처음으로 접근했을때 초기DB insert
	public String checkSalesDB(String store_code, SalesLogDAO salesLogDAO) throws Exception{
//		SalesLogDAO salesLogDAO = sqlSession.getMapper(SalesLogDAO.class);
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat ("yy/MM/dd");
		String today=(String)formatter.format(date);
		int result = salesLogDAO.getList(today,store_code);
		if(result==0){
			SalesLogDTO salesLogDTO = new SalesLogDTO();
			salesLogDTO.setSaleslog_date(today);
			salesLogDTO.setStore_code(store_code);
			StringTokenizer stk = new StringTokenizer(today, "/");
			int todayArr[] = new int[3];
			int i=0;
			while(stk.hasMoreElements()){
				todayArr[i] = Integer.parseInt(stk.nextToken());
				i++;
			}
			salesLogDTO.setSaleslog_year(todayArr[0]);
			salesLogDTO.setSaleslog_month(todayArr[1]);
			salesLogDTO.setSaleslog_day(todayArr[2]);
			
			salesLogDAO.insertSaleslog(salesLogDTO);
			
		}
		return today;
	}
	
	
	@RequestMapping("dailyChart.pet")
	public String dailyChart() throws Exception{
		System.out.println("dailyChart 접근");
		return "/saleslog/dailyChart";
	}
	
	@ResponseBody
	@RequestMapping("dailyChartAjax.pet")
	public List<SalesLogDTO> dailyChartAjax() throws Exception{
		System.out.println("dailyChartAjax 접근");
		
		SalesLogDTO salesLogDTO = new SalesLogDTO();
		salesLogDTO.setSaleslog_year(17);
		
		SalesLogDAO salesLogDAO = sqlSession.getMapper(SalesLogDAO.class);
		List<SalesLogDTO> list = salesLogDAO.getMonthList(salesLogDTO);
		System.out.println("dailyChartAjax 접근3");
		return list;
	}
}
