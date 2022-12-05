package model;

public class Stars 
{
	private double score;
	private int memberNo;
	private int movieNo;
	private String movieName;
	private String movieDirector;
	private String movieGenre;
	
	public String getMovieName() 
	{
		return movieName;
	}
	public void setMovieName(String movieName) 
	{
		this.movieName = movieName;
	}
	public String getMovieDirector() 
	{
		return movieDirector;
	}
	public void setMovieDirector(String movieDirector) 
	{
		this.movieDirector = movieDirector;
	}
	public String getMovieGenre() 
	{
		return movieGenre;
	}
	public void setMovieGenre(String movieGenre) 
	{
		this.movieGenre = movieGenre;
	}
	public double getScore() 
	{
		return score;
	}
	public void setScore(double score) 
	{
		this.score = score;
	}
	public int getMemberNo() 
	{
		return memberNo;
	}
	public void setMemberNo(int memberNo) 
	{
		this.memberNo = memberNo;
	}
	public int getMovieNo() 
	{
		return movieNo;
	}
	public void setMovieNo(int movieNo) 
	{
		this.movieNo = movieNo;
	}
}
