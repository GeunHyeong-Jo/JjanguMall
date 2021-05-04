package com.saltlux.jjangumall.repository.used;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.saltlux.jjangumall.dto.used.ImageVo;
import com.saltlux.jjangumall.dto.used.ItemDetailVo;
import com.saltlux.jjangumall.dto.used.ItemVo;
import com.saltlux.jjangumall.dto.used.SearchVo;

@Repository
public class ItemRepository {

	private static final String SAVE_PATH = "C:/Workspace/trade/src/main/webapp/upload/";

	@Autowired
	SqlSession sqlSession;

	public List<ItemVo> index() {

		return sqlSession.selectList("item.index");
	}
	
	public List<ItemVo> search(SearchVo vo) {
		return sqlSession.selectList("item.searchPaging", vo);
	}
	
	public List<ItemVo> index(Long page) {
		return sqlSession.selectList("item.indexPaging", page * 3);
	}
	
	public Long itemCount() {
		
		return sqlSession.selectOne("item.itemCount");
	}
	public Long itemCount(SearchVo vo) {
		
		return sqlSession.selectOne("item.searchCount", vo);
	}

	public int regist(ItemVo vo) {

		int ret = sqlSession.insert("item.regist", vo);

		return ret;
	}

	public ItemDetailVo detailContents(Long no) {

		return sqlSession.selectOne("item.detail", no);
	}

	public List<ItemVo> myItem(String id) {

		return sqlSession.selectList("item.myItem", id);
	}

	public List<ImageVo> getImageNo(Long boardNo){
		
		return sqlSession.selectList("item.getImageNo", boardNo);
	}
	
	public void pictureUpload(MultipartFile picture, Long boardNo) {

		sqlSession.insert("item.uploadImage", boardNo);
		String name = sqlSession.selectOne("item.getLastImageNo") + ".png";
		
		writeFile(picture, name);
	}

	private boolean writeFile(MultipartFile picture, String saveFileName)  {
		boolean result = false;

		try {
			byte[] data;
			data = picture.getBytes();
			FileOutputStream fos = new FileOutputStream(SAVE_PATH + saveFileName);
			
			fos.write(data);
			fos.close();
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;

	}

	public int itemSuccess(Long itemNo) {
		
		return sqlSession.update("item.itemSucsess", itemNo);
	}


}
