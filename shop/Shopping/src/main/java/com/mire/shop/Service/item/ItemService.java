package com.mire.shop.Service.item;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.mire.shop.model.ItemVO;

public interface ItemService {
	void insertItem(ItemVO vo, HttpServletRequest request);
	void updateItem(ItemVO vo);
	void deleteItem(ItemVO vo);
	ItemVO getItem(ItemVO vo);
	List<ItemVO> getItemList();

}
