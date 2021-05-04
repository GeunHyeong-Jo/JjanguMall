package com.saltlux.jjangumall.service.used;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.saltlux.jjangumall.dto.used.ImageVo;
import com.saltlux.jjangumall.dto.used.ItemDetailVo;
import com.saltlux.jjangumall.dto.used.ItemVo;
import com.saltlux.jjangumall.dto.used.SearchVo;
import com.saltlux.jjangumall.repository.used.ItemRepository;
import com.saltlux.jjangumall.repository.used.UsedUserRepository;

@Service
public class ItemService {

	@Autowired
	ItemRepository itemRepository;
	
	@Autowired
	UsedUserRepository userRepository;

	public List<ItemVo> index() {

		return itemRepository.index();
	}
	
	public List<ItemVo> search(SearchVo vo) {
		
		return itemRepository.search(vo);
	}
	// --------- paging
	public List<ItemVo> index(Long page) {
		
		return itemRepository.index(page);
	}
	
	public Long itemCount() {
		
		return itemRepository.itemCount();
	}
	public Long itemCount(SearchVo vo) {
		
		return itemRepository.itemCount(vo);
	}

	public int regist(ItemVo vo, List<MultipartFile> pictures) {
		int ret = itemRepository.regist(vo);
		if(pictures.size() > 0) {
			for(MultipartFile picture : pictures) {
				itemRepository.pictureUpload(picture, vo.getLastInserId());
			}
		}
		System.out.println("service " + vo.getLastInserId());
		return ret;
	}
	
	public ItemDetailVo detail(Long no) {
		ItemDetailVo vo = itemRepository.detailContents(no);
		vo.setAvgPoint(userRepository.avgPoint(vo.getUserId()));
		
		return vo;
	}
	
	public List<ImageVo> getImageNo(Long boardNo){
		
		return itemRepository.getImageNo(boardNo);
	}
	
	public List<ItemVo> myItem(String id){
		
		return itemRepository.myItem(id);
	}

	public int itemSuccess(Long itemNo) {

		return itemRepository.itemSuccess(itemNo);
	}
	
	

}
