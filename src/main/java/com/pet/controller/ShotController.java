package com.pet.controller;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pet.model.CounterDTO;
import com.pet.model.ShotDAO;
import com.pet.model.ShotDTO;

@Controller
@RequestMapping("/shot/")
public class ShotController {
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping("shotList.pet")
	public ModelAndView listForm(ShotDTO dto, HttpSession session, HttpServletRequest request){
		String month= request.getParameter("month");
		System.out.println("month: "+month);
		
		System.out.println("shotList 접근");
		
		ModelAndView mav= new ModelAndView();
		
		DateFormat simple= new SimpleDateFormat("yyyy-MM-dd");
		long time = System.currentTimeMillis();
		Date Time = new Date(time);
		String currentTime=simple.format(Time);

		String d = String.valueOf(currentTime);
		String year_str = d.split("-")[0];
		String month_str = d.split("-")[1];
		String day_str = d.split("-")[2];
		
		
		if(month != null){
		month_str=month;
		}
		day_str="30";
		
		
		String lastDay1 = year_str + "-" + month_str + "-" + day_str;
		String firstDay1 = year_str + "-" + month_str + "-" + "01";
		System.out.println("lastDay1: "+ lastDay1);
		
		
		Date lastDay = Date.valueOf(lastDay1);
		Date firstDay = Date.valueOf(firstDay1);
		
		String store_code = (String) session.getAttribute("session_store_code");
		
		ShotDAO shotDAO = sqlSession.getMapper(ShotDAO.class);
		List list= shotDAO.selectAll(store_code);
		
	    mav.addObject("list", list);
	    mav.addObject("lastDay", lastDay);
	    mav.addObject("firstDay", firstDay);
	    mav.addObject("currentTime", currentTime);
	    mav.addObject("month", month_str);
		mav.setViewName("/shot/shotList");
		return mav;
	
	}
	
	
	/*@RequestMapping("insertShot.pet")
	public ModelAndView insert_shot(ShotDTO dto, HttpSession session){
		ModelAndView mav= new ModelAndView();
		String store_code = (String) session.getAttribute("session_store_code");
	
		System.out.println("dto: "+dto.toString());
		
		ShotDAO shotDAO = sqlSession.getMapper(ShotDAO.class);
		List list= shotDAO.selectShot(store_code);
	
		mav.addObject("list", list);
		mav.setViewName("/shot/insertShotForm");
		return mav;
	}
	
	@RequestMapping("insertShotPro.pet")
	public String insert_shotPro(ShotDTO dto) throws Exception{
		
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
		
		return "redirect:shotList.pet";
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
	    }*/
}
