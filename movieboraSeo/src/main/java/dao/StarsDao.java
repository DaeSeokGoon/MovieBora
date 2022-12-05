package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Movie;
import model.Stars;

public class StarsDao 
{
	private static StarsDao instance = new StarsDao();
	
	private StarsDao() { }
	
	public static StarsDao getInstance()
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

	public int getTotal(String memberId) // 별점 먹인 수 
	{
		return (int)session.selectOne("starsns.getTotal", memberId);
	}

	public List<Stars> StarsList(String memberId) // 별점 먹인 영화 리스트
	{
		return session.selectList("starsns.starsList", memberId);
	}

	public List<Stars> starsPageList(int memberNo, int startRow, int endRow) 
	{
		HashMap<String, Integer> starsMap = new HashMap<>();
		starsMap.put("memberNo", memberNo);
		starsMap.put("startRow", startRow);
	    starsMap.put("endRow", endRow);
	    
		return (List<Stars>) session.selectList("starsns.starsPageList", starsMap);
	}

	public int getScore(int movieNo) 
	{
		System.out.println(" getStore movieNo ="+movieNo);
		return (int) session.selectOne("starsns.getScore", movieNo);
	}

	public int getCount(int movieNo) 
	{
		return (int) session.selectOne("starsns.getCount", movieNo);
	}

	public int average(int movieNo) 
	{
		return (int) session.selectOne("starsns.average", movieNo);
	}	
	public int starsInsert(Stars stars ) {
		return (int)session.insert("reviewns.starsInsert", stars);
		
	}

	public int scoreChk(Stars stars) {
		return (int) session.selectOne("starsns.scoreChk", stars);
	}
	
	public int insertScore(Stars stars) {
		return (int)session.insert("starsns.insertScore", stars);
	}
	public int updateScore(Stars stars) {
		return (int)session.update("starsns.updateScore", stars);
		
	}
	
	public Movie selectAll(int movieNo)	
	{
		return (Movie) session.selectOne("moviens.selectAll", movieNo);
	}
	
	public List<Movie> recommendPageList(int memberNo, int genreNo, int startRow, int endRow) 
	{
		HashMap<String, Integer> recommendMap = new HashMap<>();
		recommendMap.put("memberNo", memberNo);
		recommendMap.put("genreNo", genreNo);
		recommendMap.put("startRow", startRow);
		recommendMap.put("endRow", endRow);
		
		return (List<Movie>) session.selectList("moviens.recommendPageList", recommendMap);
	}
	
	public List<Movie> recommendPageListTotal(int memberNo, int genreNo) 
	{
		HashMap<String, Integer> recommendTotalMap = new HashMap<>();
		recommendTotalMap.put("memberNo", memberNo);
		recommendTotalMap.put("genreNo", genreNo);
		
		return (List<Movie>) session.selectList("moviens.recommendPageListTotal", recommendTotalMap);
	}
	
	public List<Movie> TotalMovieList() 
	{
		return (List<Movie>) session.selectList("moviens.TotalMovieList");
	}
	
	public List<Movie> TotalMoviePageList(int startRow, int endRow) 
	{
		HashMap<String, Integer> TMPLmap = new HashMap<>();
		TMPLmap.put("startRow", startRow);
		TMPLmap.put("endRow", endRow);
		
		return (List<Movie>) session.selectList("moviens.TotalMoviePageList", TMPLmap);
	}
	
	public List<Movie> GenreMovieList(int genreNo) 
	{
		return (List<Movie>) session.selectList("moviens.GenreMovieList", genreNo);
	}

	public List<Movie> GenreTotalMoviePageList(int movieGenreNo, int startRow, int endRow) 
	{
		HashMap<String, Integer> GTMPLmap = new HashMap<>();
		GTMPLmap.put("movieGenreNo", movieGenreNo);
		GTMPLmap.put("startRow", startRow);
		GTMPLmap.put("endRow", endRow);
		
		return (List<Movie>) session.selectList("moviens.GenreTotalMoviePageList", GTMPLmap);
	}
	
	public List<Movie> TopList() 
	{
		return (List<Movie>) session.selectList("moviens.TopList");
	}
	public List<Movie> ManList() 
	{
		return (List<Movie>) session.selectList("moviens.ManList");
	}
	public List<Movie> WomanList() 
	{
		return (List<Movie>) session.selectList("moviens.WomanList");
	}
	
	public List<Movie> TopPageList(int startRow1, int endRow1) 
	{
		HashMap<String, Integer> TPLmap = new HashMap<>();
		TPLmap.put("startRow", startRow1);
		TPLmap.put("endRow", endRow1);
		
		return (List<Movie>) session.selectList("moviens.TopPageList", TPLmap);
	}
	public List<Movie> ManPageList(int startRow2, int endRow2) 
	{
		HashMap<String, Integer> MPLmap = new HashMap<>();
		MPLmap.put("startRow", startRow2);
		MPLmap.put("endRow", endRow2);
		
		return (List<Movie>) session.selectList("moviens.ManPageList", MPLmap);
	}
	
	public List<Movie> WomanPageList(int startRow3, int endRow3) 
	{
		HashMap<String, Integer> WPLmap = new HashMap<>();
		WPLmap.put("startRow", startRow3);
		WPLmap.put("endRow", endRow3);
		
		return (List<Movie>) session.selectList("moviens.WomanPageList", WPLmap);
	}
	
	public int getAvgScore(int genreNo, int memberNo) 
	{
		HashMap<String, Integer> ASmap = new HashMap<>();
		ASmap.put("genreNo", genreNo);
		ASmap.put("memberNo", memberNo);
		
		return (int) session.selectOne("moviens.getAvgScore", ASmap);
	}
	
	public double getAvgScore2(int genreNo) 
	{
		return (int) session.selectOne("moviens.getAvgScore2", genreNo);
	}
	
	public List<Movie> resultMovieList(String searchKey, String searchValue) 
	{
		HashMap<String, String> RMLmap = new HashMap<>();
		RMLmap.put("searchKey", searchKey);
		RMLmap.put("searchValue", searchValue);
		
		return (List<Movie>) session.selectList("moviens.resultMovieList", RMLmap);
	}
	
	public List<Movie> resultMoviePageList(String searchKey, String searchValue, String startRow2, String endRow2) 
	{
		HashMap<String, String> RMPLmap = new HashMap<>();
		RMPLmap.put("searchKey", searchKey);
		RMPLmap.put("searchValue", searchValue);
		RMPLmap.put("startRow2", startRow2);
		RMPLmap.put("endRow2", endRow2);
		
		return (List<Movie>) session.selectList("moviens.resultMoviePageList", RMPLmap);
	}
}