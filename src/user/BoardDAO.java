package user;

import java.sql.*;


public class BoardDAO {
	
private DBConnectionMgr pool ;
	
	//2.생성자 -> 연결하고자 하는 클래스객체를 생성하는 구문을 사용 -> 자연스럽다.
	public BoardDAO() {
		try {
			pool = DBConnectionMgr.getInstance();
			System.out.println("pool=> "+pool);
		}catch(Exception e) {
			System.out.println("DB연결 실패"+e);
		}
	}//생성자 끝

	
	
	
	
	
	
}
