package com.mire.shop.Service.item;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.mire.shop.model.ItemVO;
import com.mire.shop.repository.ItemDAO;

@Service
public class ItemServiceImpl implements ItemService {

	private final ItemDAO itemDAO;

	@Autowired
	public ItemServiceImpl(ItemDAO itemDAO) {
		this.itemDAO = itemDAO;
	}

	@Override
	public void insertItem(@ModelAttribute ItemVO vo, HttpServletRequest request) {
	    MultipartFile uploadFile = vo.getFile();
	    System.out.println(vo.getMemberId());
	    
	    

	    if (uploadFile != null) {
	    	 UUID randomName = UUID.randomUUID();
	        vo.setImgName(randomName + "_" + uploadFile.getOriginalFilename());

	        String relativePath = "/resources/img"; // Relative path within the webapp directory

	        // Use the servlet context to get the absolute path to the webapp directory
	        String absolutePath = request.getServletContext().getRealPath(relativePath);

	        File directory = new File(absolutePath);
	        if (!directory.exists()) {
	            directory.mkdirs();
	        }
           
	        String filePath = absolutePath + File.separator + vo.getImgName();
	        System.out.println(filePath);

	        File saveFile = new File(filePath);

	        try {
	            uploadFile.transferTo(saveFile);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    itemDAO.insertItem(vo);
	}
	

	@Override
	public void updateItem(@ModelAttribute ItemVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteItem(@ModelAttribute ItemVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public ItemVO getItem(@ModelAttribute ItemVO vo) {
		// TODO Auto-generated method stub
		return itemDAO.getItem(vo.getNo());
	}
	@Override
	public List<ItemVO> getItemList() {
		// TODO Auto-generated method stub
		return itemDAO.getItemList();
	}

}
