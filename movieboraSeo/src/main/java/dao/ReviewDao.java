package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Review;
import model.Stars;

public class ReviewDao 
{
	private static ReviewDao instance = new ReviewDao();
	
	private ReviewDao() { }
	
	public static ReviewDao getInstance()
	{
		return instance;
	}
	
	private static SqlSession session;
	
	static
	{
		try
		{
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			//	openSession(true) : 입력/삭제/수정 후에 commit : 뭔지모름 ㅋㅋ
			session = ssf.openSession(true);
			// reader.close(); : 얘도 왜들어가있는지 모름
		} 
		catch (Exception e) 
		{
			System.out.println(e.getMessage());
		}
	}

	public int getTotal(String id) 
	{
		return (int)session.selectOne("reviewns.getTotal", id);
	}

	public List<Review> ReviewList(String id) 
	{
		return session.selectList("reviewns.reviewList", id);
	}
	public int reviewNo() {
		return (int)session.selectOne("reviewns.reviewNo");
	}

	public int reviewInsert(Review review) {
		System.out.println(review.getReviewNo());
		System.out.println(review.getMemberNo());
		System.out.println(review.getMovieNo());
		System.out.println(review.getReviewContent());
		
		return (int)session.insert("reviewns.reviewInsert", review);
		
	}

	public int getTotalReview(int movieNo) {

		return (int)session.selectOne("reviewns.getTotalReview", movieNo);
	}
	public List<Review> ReviewContents(int startRow , int endRow , int movieNo) 
	{
		Map<String, Integer> map = new HashMap<>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("movieNo", movieNo);
		
		return session.selectList("reviewns.reviewContents", map);
	}

	public Review reviewContent(int reviewNo) {
		return (Review)session.selectOne("reviewns.reviewContent", reviewNo);
	}
	public int reviewUpdate(Review review) {
		return (int)session.update("reviewns.reviewUpdate", review);
	}

	public int reviewDelete(int reviewNo) {
		return (int)session.update("reviewns.reviewDelete", reviewNo);
		
	}

	public int starsInsert(Stars stars ) {
		return (int)session.insert("reviewns.starsInsert", stars);
		
	}

	public int confirmReSelect(int memberNo) {
		return (int)session.selectOne("reviewns.confirmReSelect", memberNo);
		
	}

	public Review chkReviewNo(Review review) {
		return (Review)session.selectOne("reviewns.chkReviewNo", review);
	}
	public List<Review> reviewPageList(int memberNo, int startRow, int endRow) 
	{
		HashMap<String, Integer> reviewMap = new HashMap<>();
		reviewMap.put("memberNo", memberNo);
		reviewMap.put("startRow", startRow);
		reviewMap.put("endRow", endRow);
	    
		return (List<Review>) session.selectList("reviewns.reviewPageList", reviewMap);
	}

	public int countDel(int movieNo, int startRow, int endRow) 
	{
		HashMap<String, Integer> Dmap = new HashMap<>();
		Dmap.put("movieNo", movieNo);
		Dmap.put("startRow", startRow);
		Dmap.put("endRow", endRow);
		
		return (int) session.selectOne("reviewns.countDel", Dmap);
	}

	public int countAll(int movieNo, int startRow, int endRow) 
	{
		HashMap<String, Integer> Amap = new HashMap<>();
		Amap.put("movieNo", movieNo);
		Amap.put("startRow", startRow);
		Amap.put("endRow", endRow);
		
		return (int) session.selectOne("reviewns.countAll", Amap);
	}

	public int checkDel(int memberNo, int movieNo) 
	{
		HashMap<String, Integer> map = new HashMap<>();
		map.put("movieNo", movieNo);
		map.put("memberNo", memberNo);
		
		return (int) session.selectOne("reviewns.checkDel", map);
	}

	public int checkAll(int memberNo, int movieNo) 
	{
		HashMap<String, Integer> map = new HashMap<>();
		map.put("movieNo", movieNo);
		map.put("memberNo", memberNo);
		
		return (int) session.selectOne("reviewns.checkAll", map);
	}

	public int chkReview(Review review) {
		return (int) session.selectOne("reviewns.chkReview", review);
	}
}