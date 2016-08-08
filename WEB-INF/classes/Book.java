package pojo;

public class Book{
	private int book_id;
	private String isbn;
	private String unit_code;
	private String title;
	private String author;
	
	public int getBookId(){
		return book_id;
	}
	
	public void setBookId(int book_id){
		this.book_id = book_id;
	}
	
	public String getIsbn(){
		return isbn;
	} 
	
	public void setIsbn(String isbn){
		this.isbn = isbn;
	}
	
	public String getUnitCode(){
		return unit_code;
	}
	
	public void setUnitCode(String unit_code){
		this.unit_code = unit_code;
	}
	
	public String getTitle(){
		return title;
	}
	
	public void setTitle(String title){
		this.title = title;
	}
	
	public String getAuthor(){
		return author;
	}
	
	public void setAuthor(String author){
		this.author = author;
	}
	

}