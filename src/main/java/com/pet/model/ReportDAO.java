package com.pet.model;

import java.util.List;

public interface ReportDAO {
	//report 보고서 DB저장
	public int insertReport(ReportDTO dto) throws Exception;	
	
	//reportList 보기
	public List<ReportDTO> getReportList(ReportDTO dto) throws Exception;
	
	// report 결재 여부
	public int checkReport(ReportDTO dto) throws Exception;

	// 보고서 수정
	public int updateReport(ReportDTO reportDTO);

	// 보고서 삭제
	public int deleteReport(ReportDTO reportDTO);

	// 보고서 세부정보 가져오기
	public ReportDTO getReportDetail(ReportDTO reportDTO);
}
