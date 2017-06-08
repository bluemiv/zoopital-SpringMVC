package com.pet.client.model;

import java.util.List;

public interface ProductDAO {

	// 전체 리스트 가져오기
	public List<ProductDTO> selectAll() throws Exception;
	
	// 등록
	public int insertProduct(ProductDTO productDTO) throws Exception;
	
	// 삭제
	public int deleteProduct(ProductDTO productDTO) throws Exception;
	
	// 수정
	public int updateProduct(ProductDTO productDTO) throws Exception;

	// 특정한 상품 정보 가져오기
	public ProductDTO getProduct(ProductDTO productDTO) throws Exception;

	// 구매시 상품 개수 수정
	public int updateBuyProduct(ProductDTO productDTO)throws Exception;
}
