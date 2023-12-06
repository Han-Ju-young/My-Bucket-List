package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Dto.MDto;

public class MDaoImpl implements MDao {
	public void joinMember(MDto mdto) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String mId = mdto.getmId();
		String mPw = mdto.getmPw();
		String mName = mdto.getmName();
		
		try {
			con = getConnection();
			String query = "insert into bucket_member values (?, ?, ?)";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, mId);
			pstmt.setString(2, mPw);
			pstmt.setString(3, mName);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(rs, pstmt, con);
		}
	}
	
	public int loginCheck(String mId, String mPw) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String dbPw = "";
		int check = -1;
		
		try {
			con = getConnection();
			String query = "select member_pw from bucket_member where member_id=?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, mId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dbPw = rs.getString("member_pw");
				if(dbPw.equals(mPw)) {
					check = 1;
				} else {
					check = 0;
				}
			} else {
				check = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(rs, pstmt, con);
		}
		return check;
	}
	
	
	public Connection getConnection() {	
		Connection conn=null;		
		String DBName = "bucket";
		String dbURL = "jdbc:mysql://localhost:3306/" + DBName;
		String sslStr="?useSSL=false";

		try {
			
			Class.forName("com.mysql.jdbc.Driver"); 
			System.out.println("JDBC driver load success");

			conn = DriverManager.getConnection(dbURL+sslStr, "root","1234"); 			
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
