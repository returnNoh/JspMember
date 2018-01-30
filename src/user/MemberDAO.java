package user;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


//웹상에서 필요로 하는 기능을 가진 메소드를 선언, 구현된 클래스
public class MemberDAO { // DB연결
	//1.연결하고자 하는 클래스 객체를 선언      
	private DBConnectionMgr pool ;
	
	//2.생성자 -> 연결하고자 하는 클래스객체를 생성하는 구문을 사용 -> 자연스럽다.
	public MemberDAO() {
		try {
			pool = DBConnectionMgr.getInstance();
			System.out.println("pool=> "+pool);
		}catch(Exception e) {
			System.out.println("DB연결 실패"+e);
		}
	}//생성자 끝
	
	//3. 업무에 따른 어떤 기능을 가진 메소드를 작성? 
	
	//1) 회원로그인을 인증?
				public boolean login_Check(String mem_id,String mem_passwd) {
					//1.  DB연결
					//2. 메소드 목적에 맞는 SQL구문
					//3. DB연결 해제 
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					boolean check = false;
					String sql = "select id,passwd from member where id=? and passwd=?";
					
					try {
						
						con = pool.getConnection();
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, mem_id);
						pstmt.setString(2, mem_passwd);
						rs = pstmt.executeQuery();
						check = rs.next();
						
					}catch(Exception e) {
						System.out.println("login_Check 실패"+e);
					}finally {
						pool.freeConnection(con,pstmt,rs);
					}
					return check;
							
				}
	//2) 중복id값을 체크해주는 메소드
				public boolean register_Check_Id(String mem_id) {
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					boolean check = false;
					String sql = "select id from member where id=?";
					try {
						con=pool.getConnection();
						pstmt=con.prepareStatement(sql);
						pstmt.setString(1, mem_id);
						rs=pstmt.executeQuery();
						check = rs.next();
						
					}catch(Exception e) {
						System.out.println("중복값 체크 실패"+e);
					}finally {
						pool.freeConnection(con,pstmt,rs);
					}
					return check;
				}
	
	//3) 우편번호를 실시간으로 검색
				
				public ArrayList<ZipcodeDTO> zipcode_Check(String area3) {
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					boolean check = false;
					ArrayList<ZipcodeDTO> zipcode = new ArrayList();
					ZipcodeDTO code ;
					
					String sql = "select * from zipcode where area3 like '%"+area3+"%'";
					try {
						con=pool.getConnection();
						pstmt=con.prepareStatement(sql);
						
						System.out.println(sql);
						System.out.println(rs=pstmt.executeQuery());
						
						
						
						while(rs.next()) {
							
							code = new ZipcodeDTO();
							code.setMem_zipcode(rs.getString(1));
							code.setArea1(rs.getString(2));
							code.setArea2(rs.getString(3));
							code.setArea3(rs.getString(4));
							code.setArea4(rs.getString(5));
							zipcode.add(code);
							
						}
						
						
						
						
					}catch(Exception e) {
						System.out.println("우편번호 못불러옴"+e);
					}finally {
						pool.freeConnection(con,pstmt,rs);
					}
					return zipcode;

				}
				
	
	//4) 회원가입 시켜주는 메소드
				
				public boolean member_regist(MemberDTO mem) {
					
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					boolean check = false;
					String sql = "insert into member values(?,?,?,?,?,?,?,?)";
					try {
						con=pool.getConnection();
						
						con.setAutoCommit(false); // 트랜잭션 시작 설정 디폴트가 true라서 따로 설정하지않으면 바로바로 commit 됨.
						
						pstmt=con.prepareStatement(sql);
						pstmt.setString(1, mem.getMem_id());
						pstmt.setString(2, mem.getMem_passwd());
						pstmt.setString(3, mem.getMem_name());
						pstmt.setString(4, mem.getMem_email());
						pstmt.setString(5, mem.getMem_phone());
						pstmt.setString(6, mem.getMem_zipcode());
						pstmt.setString(7, mem.getMem_address());
						pstmt.setString(8, mem.getMem_job());
						
						int check2 = pstmt.executeUpdate();
						if(check2>0) {
							check=true;
						}
						
						con.commit(); // 트랜잭션 수동 commit
						
					}catch(Exception e) {
						System.out.println("회원가입 실패"+e);
					}finally {
						pool.freeConnection(con,pstmt,rs);
					}
					return check;
				}
	
	//5) 회원수정을 시켜주는 메소드
				
					public boolean member_modify(MemberDTO mem) {	
					
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					boolean check = false;
					String sql = "update member set id=?,passwd=?,email=?,phone=?,zipcode=?,address=?,job=? where name ="+mem.getMem_name();
					try {
						con=pool.getConnection();
						pstmt=con.prepareStatement(sql);
						pstmt.setString(1, mem.getMem_id());
						pstmt.setString(2, mem.getMem_passwd());
						pstmt.setString(3, mem.getMem_name());
						pstmt.setString(4, mem.getMem_email());
						pstmt.setString(5, mem.getMem_phone());
						pstmt.setString(6, mem.getMem_zipcode());
						pstmt.setString(7, mem.getMem_address());
						pstmt.setString(8, mem.getMem_job());
						
						int check2 = pstmt.executeUpdate();
						if(check2>0) {
							check=true;
						}
						
					}catch(Exception e) {
						System.out.println("정보수정 실패"+e);
					}finally {
						pool.freeConnection(con,pstmt,rs);
					}
					return check;
				}
				

	
	//6) 회원정보를 가져오는 메소드
				
				public MemberDTO member_info(String mem_id) {
					
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					boolean check = false;
					MemberDTO member_info = new MemberDTO();
					
					String sql = "select * from member where id="+mem_id;
					try {
						con=pool.getConnection();
						pstmt=con.prepareStatement(sql);
						
						System.out.println(sql);
						System.out.println(rs=pstmt.executeQuery());
						
						member_info.setMem_id(rs.getString(1));
						member_info.setMem_passwd(rs.getString(2));
						member_info.setMem_name(rs.getString(3));
						member_info.setMem_email(rs.getString(4));
						member_info.setMem_phone(rs.getString(5));
						member_info.setMem_zipcode(rs.getString(6));
						member_info.setMem_address(rs.getString(7));
						member_info.setMem_job(rs.getString(8));
						
						
					}catch(Exception e) {
						System.out.println("정보가져오기 실패"+e);
					}finally {
						pool.freeConnection(con,pstmt,rs);
					}
					return member_info;

					
				}
	
	//7) 회원탈퇴를 시켜주는 메소드
				
				public boolean member_delete(String mem_id) {
					
					Connection con = null;
					PreparedStatement pstmt = null;
					boolean check = false;
					
					String sql = "delete from member where id="+mem_id;
					try {
						con=pool.getConnection();
						pstmt=con.prepareStatement(sql);
						
						check=pstmt.execute();
						
					}catch(Exception e) {
						System.out.println("탈퇴실패"+e);
					}finally {
						pool.freeConnection(con,pstmt);
					}
					return check;
				}
	
	//8) 회원리스트를 보여주는 메소드 
				
				public ArrayList<MemberDTO> member_list(String mem_id) {
					
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					boolean check = false;
					ArrayList<MemberDTO> member_list = new ArrayList<MemberDTO>();
					
					
					String sql = "select * from member where id="+mem_id;
					try {
						con=pool.getConnection();
						pstmt=con.prepareStatement(sql);
						
						System.out.println(sql);
						System.out.println(rs=pstmt.executeQuery());
						
						
						
						
							while(rs.next()) {
								MemberDTO M = new MemberDTO();
									M.setMem_id(rs.getString(1));
									M.setMem_passwd(rs.getString(2));
									M.setMem_name(rs.getString(3));
									M.setMem_email(rs.getString(4));
									M.setMem_phone(rs.getString(5));
									M.setMem_zipcode(rs.getString(6));
									M.setMem_address(rs.getString(7));
									M.setMem_job(rs.getString(8));
							member_list.add(M);
						//System.out.println(rs.getString(1));	
						
						
							}
						
						
					}catch(Exception e) {
						System.out.println("리스트 불러오기 실패"+e);
					}finally {
						pool.freeConnection(con,pstmt,rs);
					}
					return member_list;

					
				}
	
	
}
