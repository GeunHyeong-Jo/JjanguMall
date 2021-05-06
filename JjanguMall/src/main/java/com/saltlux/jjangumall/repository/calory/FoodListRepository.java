package com.saltlux.jjangumall.repository.calory;

import java.util.List;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.saltlux.jjangumall.dto.FoodlistDTO;
import com.saltlux.jjangumall.dto.UserDTO;

@Repository
public class FoodListRepository {
	@Autowired
	private SqlSession sqlSession;

	public List<FoodlistDTO> findIdAllList(String Id) {
		return sqlSession.selectList("foodlist.findIdAllList",Id);
  }

	public boolean insert(FoodlistDTO vo) {
		int count=sqlSession.insert("foodlist.insert",vo);
		return count==1;
	}

//  private FoodVo getFood(String name) {
//    Connection conn = null;
//    PreparedStatement pstmt = null;
//    try {
//      conn = this.dataSource.getConnection();
//      String sql = "select name, calory from food where name=?;";
//      pstmt = conn.prepareStatement(sql);
//      pstmt.setString(1, name);
//      ResultSet rs = pstmt.executeQuery();
//      FoodVo vo = new FoodVo();
//      if (rs.next()) {
//        vo.setName(rs.getString(1));
//        vo.setCalory(rs.getLong(2));
//        return vo;
//      } 
//      return null;
//    } catch (SQLException e) {
//      System.out.println("error: " + e);
//    } finally {
//      try {
//        if (pstmt != null)
//          pstmt.close(); 
//        if (conn != null)
//          conn.close(); 
//      } catch (SQLException e) {
//        e.printStackTrace();
//      } 
//    } 
//    return null;
//  }
//  
//  public boolean insert(FoodListVo vo) {
//    Connection conn = null;
//    PreparedStatement pstmt = null;
//    boolean result = false;
//    try {
//      conn = this.dataSource.getConnection();
//      String sql = "insert into foodlist values(null,?,?,?,now());";
//      pstmt = conn.prepareStatement(sql);
//      pstmt.setLong(1, vo.getUserVo().getNo());
//      pstmt.setString(2, vo.getFoodVo().getName());
//      pstmt.setString(3, vo.getEatTime());
//      int count = pstmt.executeUpdate();
//      return result = (count == 1);
//    } catch (SQLException e) {
//      System.out.println(e);
//    } finally {
//      try {
//        if (pstmt != null)
//          pstmt.close(); 
//        if (conn != null)
//          conn.close(); 
//      } catch (SQLException e) {
//        e.printStackTrace();
//      } 
//    } 
//    return result;
//  }
//  
//  public boolean delete(long no) {
//    Connection conn = null;
//    PreparedStatement pstmt = null;
//    boolean result = false;
//    try {
//      conn = this.dataSource.getConnection();
//      String sql = "delete from foodlist where no = ?;";
//      pstmt = conn.prepareStatement(sql);
//      pstmt.setLong(1, no);
//      int count = pstmt.executeUpdate();
//      return result = (count == 1);
//    } catch (SQLException e) {
//      System.out.println(e);
//    } finally {
//      try {
//        if (pstmt != null)
//          pstmt.close(); 
//        if (conn != null)
//          conn.close(); 
//      } catch (SQLException e) {
//        e.printStackTrace();
//      } 
//    } 
//    return result;
//  }
//  
//  public boolean update(FoodListVo vo) {
//    Connection conn = null;
//    PreparedStatement pstmt = null;
//    boolean result = false;
//    try {
//      conn = this.dataSource.getConnection();
//      String sql = "update foodlist set Food_name = ?, eat_time=? where no = ?;";
//      pstmt = conn.prepareStatement(sql);
//      pstmt.setString(1, vo.getFoodVo().getName());
//      pstmt.setString(2, vo.getEatTime());
//      pstmt.setLong(3, vo.getNo());
//      int count = pstmt.executeUpdate();
//      return result = (count == 1);
//    } catch (SQLException e) {
//      System.out.println(e);
//    } finally {
//      try {
//        if (pstmt != null)
//          pstmt.close(); 
//        if (conn != null)
//          conn.close(); 
//      } catch (SQLException e) {
//        e.printStackTrace();
//      } 
//    } 
//    return result;
//  }
//  
//  public FoodListVo findNo(long no) {
//    Connection conn = null;
//    PreparedStatement pstmt = null;
//    try {
//      conn = this.dataSource.getConnection();
//      String sql = "select no from foodlist where no=?;";
//      pstmt = conn.prepareStatement(sql);
//      pstmt.setLong(1, no);
//      ResultSet rs = pstmt.executeQuery();
//      if (rs.next()) {
//        FoodListVo eatListVo = new FoodListVo();
//        eatListVo.setNo(rs.getLong(1));
//        return eatListVo;
//      } 
//      return null;
//    } catch (SQLException e) {
//      System.out.println("error: " + e);
//    } finally {
//      try {
//        if (pstmt != null)
//          pstmt.close(); 
//        if (conn != null)
//          conn.close(); 
//      } catch (SQLException e) {
//        e.printStackTrace();
//      } 
//    } 
//    return null;
//  }
//  
//  public List<FoodListVo> findListDays(UserVo vo, int no) {
//    Connection conn = null;
//    PreparedStatement pstmt = null;
//    try {
//      conn = this.dataSource.getConnection();
//      String sql = "select no,Food_name,eat_Time,reg_date from foodlist where user_no=? and reg_date > date_add(now(),INTERVAL -? day) and reg_date<= date_add(now(),interval -? day);";
//      pstmt = conn.prepareStatement(sql);
//      pstmt.setLong(1, vo.getNo());
//      pstmt.setLong(2, (no + 1));
//      pstmt.setInt(3, no);
//      ResultSet rs = pstmt.executeQuery();
//      List<FoodListVo> list = new ArrayList<>();
//      while (rs.next()) {
//        FoodListVo eatListVo = new FoodListVo();
//        eatListVo.setNo(rs.getLong(1));
//        eatListVo.setUserVo(vo);
//        eatListVo.setFoodVo(getFood(rs.getString(2)));
//        eatListVo.setEatTime(rs.getString(3));
//        eatListVo.setDate(rs.getDate(4));
//        list.add(eatListVo);
//      } 
//      return list;
//    } catch (SQLException e) {
//      System.out.println("error: " + e);
//    } finally {
//      try {
//        if (pstmt != null)
//          pstmt.close(); 
//        if (conn != null)
//          conn.close(); 
//      } catch (SQLException e) {
//        e.printStackTrace();
//      } 
//    } 
//    return null;
//  }
//  
//  public List<FoodListVo> findListweeks(UserVo vo, int no) {
//    Connection conn = null;
//    PreparedStatement pstmt = null;
//    try {
//      conn = this.dataSource.getConnection();
//      String sql = "select no,Food_name,eat_Time,reg_date from foodlist where user_no=? and reg_date between date_add(now(),INTERVAL -? week) and date_add(now(),INTERVAL -? week);";
//      pstmt = conn.prepareStatement(sql);
//      pstmt.setLong(1, vo.getNo());
//      pstmt.setInt(2, no + 1);
//      pstmt.setInt(3, no);
//      ResultSet rs = pstmt.executeQuery();
//      List<FoodListVo> list = new ArrayList<>();
//      while (rs.next()) {
//        FoodListVo eatListVo = new FoodListVo();
//        eatListVo.setNo(rs.getLong(1));
//        eatListVo.setUserVo(vo);
//        eatListVo.setFoodVo(getFood(rs.getString(2)));
//        eatListVo.setEatTime(rs.getString(3));
//        eatListVo.setDate(rs.getDate(4));
//        list.add(eatListVo);
//      } 
//      return list;
//    } catch (SQLException e) {
//      System.out.println("error: " + e);
//    } finally {
//      try {
//        if (pstmt != null)
//          pstmt.close(); 
//        if (conn != null)
//          conn.close(); 
//      } catch (SQLException e) {
//        e.printStackTrace();
//      } 
//    } 
//    return null;
//  }
}
