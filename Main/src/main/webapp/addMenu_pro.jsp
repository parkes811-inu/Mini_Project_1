<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="store.DTO.Product"%>
<%@page import="org.apache.commons.io.FilenameUtils"%>
<%@page import="store.DAO.ProductDAO"%>
<%@page import="java.net.URL"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%


	//String uploadPath = "/msa5t5/upload/img";

	// 파일 저장 경로 및 크기 설정
	String saveDirectory = application.getRealPath("/static/img");
	int maxPostSize = 10 * 1024 * 1024;  // 최대 10 MB
	
	// 파일 업로드 요청을 파싱합니다.
	FileItemFactory factory = new DiskFileItemFactory();
	ServletFileUpload upload = new ServletFileUpload(factory);
	upload.setSizeMax(maxPostSize);
	
	try {
	    List<FileItem> items = upload.parseRequest(request);
	    Map<String, String> formFields = new HashMap<String, String>();
	
	    String fileName = null;
	    // 폼 필드를 반복하여 데이터 처리
	    for (FileItem item : items) {
	        if (item.isFormField()) {
	            // 일반 필드
	            formFields.put(item.getFieldName(), item.getString("UTF-8"));
	        } else {
	            // 파일 필드
	            fileName = item.getName();
	            if (fileName != null && !fileName.isEmpty()) {
	                fileName = FilenameUtils.getName(fileName);
	                File uploadedFile = new File(saveDirectory, fileName);
	                item.write(uploadedFile);
	            }
	        }
	    }
	
	    // 데이터베이스에 추가
	    String productName = formFields.get("productName");
	    String description = formFields.get("description");
	    String category = formFields.get("Category");
	    int price = Integer.parseInt(formFields.get("price"));
	
	    ProductDAO productDao = new ProductDAO();
	    Product product = new Product();
	    product.setName(productName);
	    product.setDescription(description);
	    product.setCategory(category);
	    product.setPrice(price);
	    product.setImagePath("/static/img/" + fileName);
	
	    int result = productDao.addProduct(product);
	    if (result > 0) {
	        out.println("<script>alert('메뉴가 성공적으로 추가되었습니다.');location.href='owner_panel.jsp';</script>");
	    } else {
	        out.println("<script>alert('메뉴 추가에 실패했습니다.');history.back();</script>");
	    }
	} catch (Exception e) {
	    out.println("<script>alert('파일 업로드 중 오류가 발생했습니다.');history.back();</script>");
	    e.printStackTrace();
	}
%>