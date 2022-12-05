package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Member;

public class MemberDao {
	private static MemberDao instance = new MemberDao();
	private MemberDao() {
	}
	 
	public static MemberDao getInstance() {
		return instance;
	}

	private static SqlSession session;
		static {
			try {
				Reader reader = Resources.getResourceAsReader("configuration.xml");
				SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
				session = ssf.openSession(true);
				reader.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		// joinResult, IdConfirm, LoginResult
		public Member selectId(String memberId) {
			return (Member) session.selectOne("memberns.selectId", memberId);
		}
		public Member selectEmail(String memberEmail) {
			return (Member) session.selectOne("memberns.selectEmail", memberEmail);
		}
		
		// confirmNick_nm
		public Member confirmNick(String memberNickname) {
			return (Member) session.selectOne("memberns.confirmNick", memberNickname);
		}
		
		// joinAction
		public int insert(Member member) {		
			return session.insert("memberns.insert", member);
		}
		
		// FindIdResult
		public Member findId(String memberName, String memberEmail) {
//			System.out.println("name= "+memberName);
//			System.out.println("memberEmail= "+memberEmail);
			HashMap<String, String> hm = new HashMap<String, String>();
			hm.put("memberName", memberName);
			hm.put("memberEmail", memberEmail);
			return (Member) session.selectOne("memberns.findId", hm);
		}
		
		// FindPwResult
		public Member findPassword(String memberId, String memberName) {
			HashMap<String, String> hm = new HashMap<String, String>();
			hm.put("memberId", memberId);
			hm.put("memberName", memberName);
			return (Member) session.selectOne("memberns.findPassword", hm);
		}
		
		// UpdateResult
		public int update(Member member) {
			return session.update("memberns.update", member);
		}

		// Delete
		public int delete(int memberNo) {
			return session.update("memberns.delete", memberNo);
		}
		
		//AdminMember - 전체 회원정보 조회
		public List<Member> list(int startRow, int endRow) {
			HashMap<String, Integer> hm = new HashMap<>();
			hm.put("startRow", startRow);
			hm.put("endRow", endRow);
			return (List<Member>)session.selectList("memberns.list",hm);
		}
		
		//AdminMember - 총 회원수
		public int getTotal() {
			return (int) session.selectOne("memberns.getTotal");
		}
		
		// 다른 테이블에서 회원번호를 활용한 닉네임 찾기
		public String selectNick(int memberNo) {
			return (String) session.selectOne("memberns.selectNick", memberNo);
		}
		
		// 다른 테이블에서 세션 아이디를 활용한 회원번호 찾기
		public int selectMno(String memberId) {
			return (int) session.selectOne("memberns.selectMno", memberId);
		}
		
		// mno로 회원 정보 조회
		public Member select(int memberNo) {
			return (Member) session.selectOne("memberns.selectReserve", memberNo);
		}
		
		// adminFindMember 관리자계정으로 member 검색
		public List<Member> searchMember(String searchKey, String searchValue) {
			HashMap<String, String> hm = new HashMap<>();
			hm.put("searchKey", searchKey);
			hm.put("searchValue", searchValue);
			return (List<Member>)session.selectList("memberns.searchMember",hm);
		}

		public int memberNo() {			
			return (int) session.selectOne("memberns.selectMemberNo");
		}
		
		public Member selectMember(String memberId) 
		{
			return (Member) session.selectOne("memberns.selectMember", memberId);
		}

}
