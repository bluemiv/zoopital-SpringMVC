package com.pet.model;

import java.util.List;

public interface ReplyDAO {

	// 댓글 리스트 가져옴
	public List<ReplyDTO> selectAllReply(ReplyDTO replyDTO) throws Exception;
	
	// 삽입
	public int insertReply(ReplyDTO replyDTO) throws Exception;

	// 자세한 정보
	public ReplyDTO getReplyInfo(ReplyDTO replyDTO) throws Exception;

	// 수정
	public int updateReply(ReplyDTO replyDTO) throws Exception;

	// 삭제 
	public int deleteReply(ReplyDTO replyDTO) throws Exception;
}
