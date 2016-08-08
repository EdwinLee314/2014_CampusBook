package pojo;

public class UsedBook{
	private Book book;
	private Copy copy;
	private User seller;
	private User buyer;
	
	public Book getBook(){
		return book;
	}
	
	public void setBook(Book book){
		this.book = book;
	}
	
	public Copy getCopy(){
		return copy;
	}
	
	public void setCopy(Copy copy){
		this.copy = copy;
	}
	
	public User getSeller(){
		return seller;
	}
	
	public void setSeller(User seller){
		this.seller = seller;
	}
	
	public User getBuyer(){
		return buyer;
	}
	
	public void setBuyer(User buyer){
		this.buyer = buyer;
	}
	
}