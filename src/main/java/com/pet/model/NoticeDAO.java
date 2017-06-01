package com.pet.model;

import java.util.List;

public interface NoticeDAO {

	// 삽입
	public int insertNotice(NoticeDTO noticeDTO)throws Exception;

	// 자세한 정보
	public NoticeDTO getNoticeDetail(NoticeDTO noticeDTO)throws Exception;

	// 수정
	public int updateNotice(NoticeDTO noticeDTO)throws Exception;

	// 전체 리스트
	public List<NoticeDTO> selectAllList(NoticeDTO noticeDTO)throws Exception;

	// 삭제 
	public int deleteNotice(NoticeDTO noticeDTO)throws Exception;

	// 전체 리스트 개수
	public int getTotalCountOfNotice(NoticeDTO noticeDTO) throws Exception;

}
