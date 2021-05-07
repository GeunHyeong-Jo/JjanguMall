package com.saltlux.jjangumall.repository.calory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.saltlux.jjangumall.dto.FoodlistDTO;

@Repository
public class FoodListRepository {
	@Autowired
	private DataSource dataSource;

	@Autowired
	private SqlSession sqlSession;

	public List<FoodlistDTO> findIdAllList(String Id) {
		return sqlSession.selectList("foodlist.findIdAllList", Id);
	}

	public boolean insert(FoodlistDTO vo) {
		int count = sqlSession.insert("foodlist.insert", vo);
		return count == 1;
	}

	public boolean delete(int no) {
		int count = sqlSession.delete("foodlist.delete", no);
		return false;
	}

	public boolean update(FoodlistDTO vo) {
		System.out.println(vo);
		int count = sqlSession.update("foodlist.update", vo);
		return count == 1;
	}

	public FoodlistDTO findNo(long no) {
		return sqlSession.selectOne("foodlist.findNo", no);
	}

	public List<FoodlistDTO> findListweeks(String vo, int no) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = this.dataSource.getConnection();
			String sql = "select foodlistno,foodno,eatTime,reg_date from foodlist where userNo=? and reg_date between date_add(now(),INTERVAL -? week) and date_add(now(),INTERVAL -? week);";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo);
			pstmt.setInt(2, no + 1);
			pstmt.setInt(3, no);
			ResultSet rs = pstmt.executeQuery();
			List<FoodlistDTO> list = new ArrayList<FoodlistDTO>();
			while (rs.next()) {
				FoodlistDTO eatListVo = new FoodlistDTO();
				eatListVo.setFoodListNo(rs.getInt(1));
				eatListVo.setUserNo(vo);
				eatListVo.setFoodNo(rs.getInt(2));
				eatListVo.setEatTime(rs.getString(3));
				eatListVo.setReg_date(rs.getDate(4));
				list.add(eatListVo);
			}
			return list;
		} catch (SQLException e) {
			System.out.println("error: " + e);
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	public List<FoodlistDTO> findListDays(String vo, int no) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = this.dataSource.getConnection();
			String sql = "select foodlistno,foodno,eatTime,reg_date from foodlist where userNo=? and reg_date between date_add(now(),INTERVAL -? day) and date_add(now(),INTERVAL -? day);";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo);
			pstmt.setInt(2, no + 1);
			pstmt.setInt(3, no);
			ResultSet rs = pstmt.executeQuery();
			List<FoodlistDTO> list = new ArrayList<FoodlistDTO>();
			while (rs.next()) {
				FoodlistDTO eatListVo = new FoodlistDTO();
				eatListVo.setFoodListNo(rs.getInt(1));
				eatListVo.setUserNo(vo);
				eatListVo.setFoodNo(rs.getInt(2));
				eatListVo.setEatTime(rs.getString(3));
				eatListVo.setReg_date(rs.getDate(4));
				list.add(eatListVo);
			}
			return list;
		} catch (SQLException e) {
			System.out.println("error: " + e);
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
}
