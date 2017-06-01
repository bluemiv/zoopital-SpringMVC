package com.pet.model;

import java.util.List;

public interface MessageDAO {

	// 전체 쪽지함 가져옴
	public List<MessageDTO> selectAllMessage(MessageDTO messageDTO) throws Exception;

	// 쪽지 보내기
	public int sendMessage(MessageDTO messageDTO) throws Exception;
	
	// 쪽지 지우기
	public int deleteMessage(MessageDTO messageDTO) throws Exception;

	// 쪽지 한명만 지운경우
	public int updateMessage(MessageDTO messageDTO) throws Exception;
	
}
