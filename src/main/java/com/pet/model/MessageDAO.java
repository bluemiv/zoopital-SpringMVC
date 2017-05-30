package com.pet.model;

import java.util.List;

public interface MessageDAO {

	// 전체 쪽지함 가져옴
	public List<MessageDTO> selectAllMessage(MessageDTO messageDTO) throws Exception;
}
