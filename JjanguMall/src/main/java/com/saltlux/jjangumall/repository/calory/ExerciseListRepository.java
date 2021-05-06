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

import com.saltlux.jjangumall.dto.ExerciselistDTO;

@Repository
public class ExerciseListRepository {

	@Autowired
	private SqlSession sqlSession;

	@Autowired
	private DataSource dataSource;

	public List<ExerciselistDTO> findListDays(String vo, long no) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = this.dataSource.getConnection();
			String sql = "select exerciseListno,user_no, exerciseno,Time,reg_date from exerciselist where user_no=? and reg_date between date_add(now(),INTERVAL -? day) and date_add(now(),INTERVAL -? day);";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo);
			pstmt.setLong(2, no+1L);
			pstmt.setLong(3, no);
			ResultSet rs = pstmt.executeQuery();
			List<ExerciselistDTO> list = new ArrayList<ExerciselistDTO>();
			while (rs.next()) {
				ExerciselistDTO eatListVo = new ExerciselistDTO();
				eatListVo.setExerciseListNo(rs.getInt(1));
				eatListVo.setUser_no(rs.getString(2));
				eatListVo.setExerciseNo(rs.getInt(3));
				eatListVo.setTime(rs.getInt(4));
				eatListVo.setReg_date(rs.getDate(5));
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

	public List<ExerciselistDTO> findListweeks(String vo, long no) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = this.dataSource.getConnection();
			String sql = "select exerciseListno,user_no, exerciseno,Time,reg_date from exerciselist where user_no=? and reg_date between date_add(now(),INTERVAL -? week) and date_add(now(),INTERVAL -? week);";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo);
			pstmt.setLong(2, no + 1);
			pstmt.setLong(3, no);
			ResultSet rs = pstmt.executeQuery();
			List<ExerciselistDTO> list = new ArrayList<ExerciselistDTO>();
			while (rs.next()) {
				ExerciselistDTO eatListVo = new ExerciselistDTO();
				eatListVo.setExerciseListNo(rs.getInt(1));
				eatListVo.setUser_no(rs.getString(2));
				eatListVo.setExerciseNo(rs.getInt(3));
				eatListVo.setTime(rs.getInt(4));
				eatListVo.setReg_date(rs.getDate(5));
				
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

	public List<ExerciselistDTO> findIdAllList(String Id) {
		return sqlSession.selectList("exerciselist.findIdAllList", Id);
	}

	public boolean insert(ExerciselistDTO vo) {
		int count = sqlSession.insert("exerciselist.insert",vo);
		return count == 1;
	}

	public boolean delete(long no) {
		int count = sqlSession.delete("exerciselist.delete",no);
		return count==1;
	}

	public boolean update(ExerciselistDTO vo) {
		int count = sqlSession.update("exerciselist.update",vo);
		return count==1;
	}
}
