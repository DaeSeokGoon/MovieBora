package model;

public class Likes 
{
	private int reviewLike;
	private int memberNo;
	private int reviewNo;
	
	public int getLikes() 
	{
		return reviewLike;
	}
	public void setLikes(int reviewLike) 
	{
		this.reviewLike = reviewLike;
	}
	public int getMemberNo() 
	{
		return memberNo;
	}
	public void setMemberNo(int memberNo) 
	{
		this.memberNo = memberNo;
	}
	public int getReviewNo() 
	{
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) 
	{
		this.reviewNo = reviewNo;
	}
}