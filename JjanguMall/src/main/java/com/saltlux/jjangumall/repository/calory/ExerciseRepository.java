//package com.saltlux.jjangumall.repository.calory;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.util.ArrayList;
//import java.util.List;
//
//import javax.sql.DataSource;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Repository;
//
//import com.saltlux.jjangumall.dto.ExerciselistDTO;
//import com.saltlux.jjangumall.dto.UserDTO;
//
//@Repository
//public class ExerciseRepository {
//	@Autowired
//	private DataSource dataSource;
//
//	public List<ExerciselistDTO> findIdAllList(UserDTO vo) {
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		try {
//			conn = this.dataSource.getConnection();
//			String sql = "select no, ex_name,Time,reg_date from exerciseList where user_no=?;";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setLong(1, vo.getNo());
//			ResultSet rs = pstmt.executeQuery();
//			List<ExerciselistDTO> list = new ArrayList<ExerciselistDTO>();
//			while (rs.next()) {
//				ExerciselistDTO eatListVo = new ExerciselistDTO();
//				eatListVo.setNo(rs.getLong(1));
//				eatListVo.setUserVo(vo);
//				eatListVo.setExerciseVo(getExercise(rs.getString(2)));
//				eatListVo.setTime(rs.getLong(3));
//				eatListVo.setDate(rs.getDate(4));
//				list.add(eatListVo);
//			}
//			return list;
//		} catch (SQLException e) {
//			System.out.println("error: " + e);
//		} finally {
//			try {
//				if (pstmt != null)
//					pstmt.close();
//				if (conn != null)
//					conn.close();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}
//		return null;
//	}
//
//	private ExerciseDTo getExercise(String name) {
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		try {
//			conn = this.dataSource.getConnection();
//			String sql = "select name, calory from exercise where name=?;";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, name);
//			ResultSet rs = pstmt.executeQuery();
//			ExerciseDTo vo = new ExerciseDTo();
//			if (rs.next()) {
//				vo.setName(rs.getString(1));
//				vo.setCalory(rs.getLong(2));
//				return vo;
//			}
//			return null;
//		} catch (SQLException e) {
//			System.out.println("error: " + e);
//		} finally {
//			try {
//				if (pstmt != null)
//					pstmt.close();
//				if (conn != null)
//					conn.close();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}
//		return null;
//	}
//
//	public boolean insert(ExerciseListVo vo) {
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		boolean result = false;
//		try {
//			conn = this.dataSource.getConnection();
//			String sql = "insert into exerciselist values(null,?,?,?,now());";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, vo.getExerciseVo().getName());
//			pstmt.setLong(2, vo.getUserVo().getNo());
//			pstmt.setLong(3, vo.getTime());
//			int count = pstmt.executeUpdate();
//			return result = (count == 1);
//		} catch (SQLException e) {
//			System.out.println(e);
//		} finally {
//			try {
//				if (pstmt != null)
//					pstmt.close();
//				if (conn != null)
//					conn.close();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}
//		return result;
//	}
//
//	public boolean delete(long no) {
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		boolean result = false;
//		try {
//			conn = this.dataSource.getConnection();
//			String sql = "delete from exerciselist where no = ?;";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setLong(1, no);
//			int count = pstmt.executeUpdate();
//			return result = (count == 1);
//		} catch (SQLException e) {
//			System.out.println(e);
//		} finally {
//			try {
//				if (pstmt != null)
//					pstmt.close();
//				if (conn != null)
//					conn.close();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}
//		return result;
//	}
//
//	public boolean update(ExerciseListVo vo) {
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		boolean result = false;
//		try {
//			conn = this.dataSource.getConnection();
//			String sql = "update exerciselist set ex_name = ?, time=? where no = ?;";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, vo.getExerciseVo().getName());
//			pstmt.setLong(2, vo.getTime());
//			pstmt.setLong(3, vo.getNo());
//			int count = pstmt.executeUpdate();
//			return result = (count == 1);
//		} catch (SQLException e) {
//			System.out.println(e);
//		} finally {
//			try {
//				if (pstmt != null)
//					pstmt.close();
//				if (conn != null)
//					conn.close();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}
//		return result;
//	}
//
//	public ExerciseListVo findNo(long no) {
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		try {
//			conn = this.dataSource.getConnection();
//			String sql = "select no from exerciselist where no=?;";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setLong(1, no);
//			ResultSet rs = pstmt.executeQuery();
//			if (rs.next()) {
//				ExerciseListVo exerciseListVo = new ExerciseListVo();
//				exerciseListVo.setNo(rs.getLong(1));
//				return exerciseListVo;
//			}
//			return null;
//		} catch (SQLException e) {
//			System.out.println("error: " + e);
//		} finally {
//			try {
//				if (pstmt != null)
//					pstmt.close();
//				if (conn != null)
//					conn.close();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}
//		return null;
//	}
//
//	public List<ExerciseListVo> findListDays(UserVo vo, long no) {
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		try {
//			conn = this.dataSource.getConnection();
//			String sql = "select no,ex_name, user_no,Time,reg_date from exerciselist where user_no=? and reg_date between date_add(now(),INTERVAL -? day) and now();";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setLong(1, vo.getNo());
//			pstmt.setLong(2, no);
//			ResultSet rs = pstmt.executeQuery();
//			List<ExerciseListVo> list = new ArrayList<>();
//			while (rs.next()) {
//				ExerciseListVo eatListVo = new ExerciseListVo();
//				eatListVo.setNo(rs.getLong(1));
//				eatListVo.setUserVo(vo);
//				eatListVo.setExerciseVo(getExercise(rs.getString(2)));
//				eatListVo.setTime(rs.getLong(3));
//				eatListVo.setDate(rs.getDate(4));
//				list.add(eatListVo);
//			}
//			return list;
//		} catch (SQLException e) {
//			System.out.println("error: " + e);
//		} finally {
//			try {
//				if (pstmt != null)
//					pstmt.close();
//				if (conn != null)
//					conn.close();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}
//		return null;
//	}
//
//	public List<ExerciseListVo> findListweeks(UserVo vo, long no) {
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		try {
//			conn = this.dataSource.getConnection();
//			String sql = "select no,ex_name, user_no,Time,reg_date from exerciselist where user_no=? and reg_date between date_add(now(),INTERVAL -? week) and date_add(now(),INTERVAL -? week);";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setLong(1, vo.getNo());
//			pstmt.setLong(2, no + 1L);
//			pstmt.setLong(3, no);
//			ResultSet rs = pstmt.executeQuery();
//			List<ExerciseListVo> list = new ArrayList<>();
//			while (rs.next()) {
//				ExerciseListVo eatListVo = new ExerciseListVo();
//				eatListVo.setNo(rs.getLong(1));
//				eatListVo.setUserVo(vo);
//				eatListVo.setExerciseVo(getExercise(rs.getString(2)));
//				eatListVo.setTime(rs.getLong(4));
//				eatListVo.setDate(rs.getDate(5));
//				list.add(eatListVo);
//			}
//			return list;
//		} catch (SQLException e) {
//			System.out.println("error: " + e);
//		} finally {
//			try {
//				if (pstmt != null)
//					pstmt.close();
//				if (conn != null)
//					conn.close();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}
//		return null;
//	}
//}
