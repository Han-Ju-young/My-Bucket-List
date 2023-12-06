package Dao;

import java.sql.Timestamp;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import Dto.BDto;

public class BDaoImpl implements BDao {
	public ArrayList<BDto> showBoardList(int startRow, int pageSize) {
		ArrayList<BDto> dtosList = new ArrayList<BDto>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = getConnection();
			String query = "select * from bucket_board where board_open='공개' order by board_id desc limit ?,?";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int dbId = rs.getInt("board_id");
				String dbmId = rs.getString("board_mid");
				String dbTitle = rs.getString("board_title");
				String dbContent = rs.getString("board_content");
				Timestamp dbDate = rs.getTimestamp("board_date");
				String dbOpen = rs.getString("board_open");
				int dbHit = rs.getInt("board_hit");
				BDto bdto = new BDto(dbId, dbmId, dbTitle, dbContent, dbDate, dbOpen, dbHit);
				dtosList.add(bdto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(rs, pstmt, con);
		}
		return dtosList;
	}
	public ArrayList<BDto> showBoardLists(int startRow, int pageSize, String bmId) {
		ArrayList<BDto> dtosList = new ArrayList<BDto>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = getConnection();
			String query = "select * from bucket_board where board_mid=? order by board_id desc limit ?,?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, bmId);
			pstmt.setInt(2, startRow-1);
			pstmt.setInt(3, pageSize);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int dbId = rs.getInt("board_id");
				String dbmId = rs.getString("board_mid");
				String dbTitle = rs.getString("board_title");
				String dbContent = rs.getString("board_content");
				Timestamp dbDate = rs.getTimestamp("board_date");
				String dbOpen = rs.getString("board_open");
				int dbHit = rs.getInt("board_hit");
				BDto bdto = new BDto(dbId, dbmId, dbTitle, dbContent, dbDate, dbOpen, dbHit);
				dtosList.add(bdto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(rs, pstmt, con);
		}
		return dtosList;
	}
	
	public ArrayList<BDto> getSearch(int startRow, int pageSize, String searchField, String searchText) {
		ArrayList<BDto> dtosList = new ArrayList<BDto>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = "select * from bucket_board where board_open='공개' and "+searchField.trim();
		try {
			con = getConnection();
			if(searchText != null && !searchText.equals("")) {
				query += " like '%"+searchText.trim()+"%' order by board_id desc limit ?,?";
			}
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				int dbId = rs.getInt("board_id");
				String dbmId = rs.getString("board_mid");
				String dbTitle = rs.getString("board_title");
				String dbContent = rs.getString("board_content");
				Timestamp dbDate = rs.getTimestamp("board_date");
				String dbOpen = rs.getString("board_open");
				int dbHit = rs.getInt("board_hit");
				BDto bdto = new BDto(dbId, dbmId, dbTitle, dbContent, dbDate, dbOpen, dbHit);
				dtosList.add(bdto);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(rs, pstmt, con);
		}
		return dtosList;
	}
	public ArrayList<BDto> getSearchs(int startRow, int pageSize, String searchField, String searchText, String bmId) {
		ArrayList<BDto> dtosList = new ArrayList<BDto>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = getConnection();
			String query = "select * from bucket_board where board_mid=? and "+searchField.trim();
			if(searchText != null && !searchText.equals("")) {
				query += " like '%"+searchText.trim()+"%' order by board_id desc limit ?,?";
			}
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, bmId);
			pstmt.setInt(2, startRow-1);
			pstmt.setInt(3, pageSize);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				int dbId = rs.getInt("board_id");
				String dbmId = rs.getString("board_mid");
				String dbTitle = rs.getString("board_title");
				String dbContent = rs.getString("board_content");
				Timestamp dbDate = rs.getTimestamp("board_date");
				String dbOpen = rs.getString("board_open");
				int dbHit = rs.getInt("board_hit");
				BDto bdto = new BDto(dbId, dbmId, dbTitle, dbContent, dbDate, dbOpen, dbHit);
				dtosList.add(bdto);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(rs, pstmt, con);
		}
		return dtosList;
	}
	
	
	public int getBoardCount(){
		int count = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			String query = "select count(*) from bucket_board where board_open='공개'";
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery();

			if(rs.next()){
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(rs, pstmt, con);
		}
		return count;
	}
	public int getBoardCounts(String bmId){
		int count = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			String query = "select count(*) from bucket_board where board_mid=?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, bmId);
			rs = pstmt.executeQuery();

			if(rs.next()){
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(rs, pstmt, con);
		}
		return count;
	}
	public int getCount(String keyWord, String searchWord) {
		int count = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = "select count(*) from bucket_board where " + keyWord + " like ?";
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "%" + searchWord + "%");
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt("count(*)");
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(rs, pstmt, con);
		}
		return count;
	}
	
	
	public boolean nextPage(int pageNumber) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = "select * from bucket_board where board_id < ?";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(rs, pstmt, con);
		}
		return false;
	}
	
	public int getNext() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = "select board_id from bucket_board order by board_id desc";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(rs, pstmt, con);
		}
		return -1;
	}
	
	public int writeContent(BDto bdto, String bmId) {
		int ret = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String bTitle = bdto.getbTitle();
		String bContent = bdto.getbContent();
		String bOpen = bdto.getbOpen();
		System.out.println("member id: " + bmId);
		
		try {
			con = getConnection();
			String query = "insert into bucket_board values (?, ?, ?, ?, CURDATE(), ?, 0)";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bmId);
			pstmt.setString(3, bTitle);
			pstmt.setString(4, bContent);
			pstmt.setString(5, bOpen);
			ret = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(rs, pstmt, con);
		}
		return ret;
	}
	
	private void upHit(int bId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = getConnection();
			String query = "update bucket_board set board_hit = board_hit + 1 where board_id = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, bId);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(rs, pstmt, con);
		}
	}

	public BDto viewContent(int bId) {
		upHit(bId);
		BDto bdto = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			String query = "select * from bucket_board where board_id = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, bId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				int dbId = rs.getInt("board_id");
				String dbmId = rs.getString("board_mid");
				String dbTitle = rs.getString("board_title");
				String dbContent = rs.getString("board_content");
				Timestamp dbDate = rs.getTimestamp("board_date");
				String dbOpen = rs.getString("board_open");
				int dbHit = rs.getInt("board_hit");
				bdto = new BDto(dbId, dbmId, dbTitle, dbContent, dbDate, dbOpen, dbHit);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(rs, pstmt, con);
		}
		return bdto;
	}
	
	public int modifyContent(BDto bdto) {
		int ret = 0;
		int bId = bdto.getbId();
		String bTitle = bdto.getbTitle();
		String bContent = bdto.getbContent();
		String bOpen = bdto.getbOpen();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = getConnection();
			
			String query = "update bucket_board set board_title = ?, board_content = ?, board_open = ? where board_id = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, bTitle);
			pstmt.setString(2, bContent);
			pstmt.setString(3, bOpen);
			pstmt.setInt(4, bId);
			ret = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(rs, pstmt, con);
		}
		return ret;
	}
	
	public int deleteContent(int bId) {
		int ret = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = getConnection();
			String query = "delete from bucket_board where board_id = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, bId);
			ret = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(rs, pstmt, con);
		}
		
		return ret;
	}
	
	public Connection getConnection() {
		
		Connection conn=null;		
		String DBName = "bucket";
		String dbURL = "jdbc:mysql://localhost:3306/" + DBName;
		String sslStr="?useSSL=false";

		try {
			
			Class.forName("com.mysql.jdbc.Driver"); 
			System.out.println("JDBC driver load success");

			conn = DriverManager.getConnection(dbURL+sslStr
					, "root","1234"); 			
			System.out.println("DB connection success");
		} catch (ClassNotFoundException e) {
			System.out.println("JDBC driver load fail !!");
		} catch (SQLException e) {
			System.out.println("DB connection fail !!");
		}
		
		return conn;
	}
	public void closeConnection(ResultSet set, PreparedStatement pstmt, Connection connection) {
		if(set!=null)
		{
			try {
			set.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}	
		if(pstmt!=null)
		{
			try {
				pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		if(connection!=null)
		{
			try {
				connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
}
