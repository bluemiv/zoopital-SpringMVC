package com.pet.model;

import java.util.List;

public interface ReportDAO {
	//report 보고서 DB저장
		public void reportPro(ReportDTO dto);	
		
		//reportList 보기
		public List<ReportDTO> getReportList(ReportDTO dto);
}
