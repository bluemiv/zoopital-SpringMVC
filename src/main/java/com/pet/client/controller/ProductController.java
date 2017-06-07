package com.pet.client.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.pet.client.model.ProductDAO;
import com.pet.client.model.ProductDTO;

@Controller
@RequestMapping("/client/product/")
public class ProductController {

	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping("productListForm.pet")
	public String productListForm(Model model) throws Exception{
		System.out.println("productListForm 접근");

		ProductDAO productDAO = sqlSession.getMapper(ProductDAO.class);
		List<ProductDTO> list = productDAO.selectAll();
		
		model.addAttribute("list", list);
		return "client/product/productListForm";
	}
	
	@RequestMapping("productInsertForm.pet")
	public String productInsertForm() throws Exception{
		System.out.println("productInsertForm 접근");
		
		return "client/product/productInsertForm";
	}
	
	@RequestMapping("productInsertPro.pet")
	public String productInsertPro(HttpServletRequest request,ProductDTO productDTO, @RequestParam("imgFile") MultipartFile imgFile, Model model) throws Exception{
		System.out.println("productInsertPro 접근");
		
		// 서버에 이미지 저장
	    String savePath = request.getRealPath("/resources/images/product_img"); // 파일이 저장될 프로젝트 안의 폴더 경로
	    String originalFilename = imgFile.getOriginalFilename(); // fileName.jpg
	    String onlyFileName = originalFilename.substring(0, originalFilename.indexOf(".")); // fileName
	    String extension = originalFilename.substring(originalFilename.indexOf(".")); // .jpg
	    String rename = onlyFileName + "_" + getCurrentDayTime() + extension; // fileName_20150721-14-07-50.jpg
	    String fullPath = savePath + "\\" + rename;
	    if (!imgFile.isEmpty()) {
	        try {
	            byte[] bytes = imgFile.getBytes();
	            BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(fullPath)));
	            stream.write(bytes);
	            stream.close();
	        } catch (Exception e) {
	        }
	    }
	    
	    // 이미지 복사
	    String saveLocalPath = "C:/git/pet/src/main/webapp/resources/images/product_img";
	    imgCopy(fullPath, saveLocalPath, rename);
	    
	    // 이미지 이름 셋팅
	    productDTO.setProduct_url(rename);
		
		boolean check = false;
		ProductDAO productDAO = sqlSession.getMapper(ProductDAO.class);
		if(productDAO.insertProduct(productDTO) > 0){
			check=true;
		}
		
		return "redirect:productListForm.pet";
	}
	
	@RequestMapping("productUpdateForm.pet")
	public String productUpdateForm(Model model, ProductDTO productDTO_input) throws Exception{
		System.out.println("productUpdateForm 접근");
		ProductDAO productDAO = sqlSession.getMapper(ProductDAO.class);
		ProductDTO productDTO = productDAO.getProduct(productDTO_input);
		
		model.addAttribute("productDTO", productDTO);
		return "client/product/productUpdateForm";
	}
	
	@RequestMapping("productUpdatePro.pet")
	public String productUpdatePro(ProductDTO productDTO) throws Exception{
		System.out.println("productUpdatePro 접근");
		System.out.println(productDTO.toString());
		boolean check = false;
		ProductDAO productDAO = sqlSession.getMapper(ProductDAO.class);
		if(productDAO.updateProduct(productDTO) > 0){
			check=true;
		}
		
		return "redirect:productListForm.pet";
	}
	
	@RequestMapping("productDeletePro.pet")
	public String productDeletePro(ProductDTO productDTO) throws Exception{
		System.out.println("productDeletePro 접근");

		boolean check = false;
		ProductDAO productDAO = sqlSession.getMapper(ProductDAO.class);
		if(productDAO.deleteProduct(productDTO) > 0){
			check=true;
		}
		
		return "redirect:productListForm.pet";
	}

	@RequestMapping("productDetailForm.pet")
	public String productDetailForm(Model model, ProductDTO productDTO_input) throws Exception{
		System.out.println("productDetailForm 접근");
		ProductDAO productDAO = sqlSession.getMapper(ProductDAO.class);
		ProductDTO productDTO = productDAO.getProduct(productDTO_input);
		
		model.addAttribute("productDTO", productDTO);
		return "client/product/productDetailForm";
	}
	
	public String getCurrentDayTime(){
	    long time = System.currentTimeMillis();
	    SimpleDateFormat dayTime = new SimpleDateFormat("yyyyMMdd-HH-mm-ss", Locale.KOREA);
	    return dayTime.format(new Date(time));
	}
	
	// 이미지 복사
	public void imgCopy(String inputFullPath ,String outputImgPath, String img_name) throws Exception{
		
		String fullPath = outputImgPath + "\\" + img_name;
		
		FileInputStream fis = null;
		FileOutputStream fos = null;

		try {
			fis = new FileInputStream(inputFullPath + "\\" + img_name); // 원본파일
			fos = new FileOutputStream(fullPath); // 복사위치

			byte[] buffer = new byte[1024];
			int readcount = 0;

			while ((readcount = fis.read(buffer)) != -1) {
				fos.write(buffer, 0, readcount); // 파일 복사
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			fis.close();
			fos.close();
		}
	}
}
