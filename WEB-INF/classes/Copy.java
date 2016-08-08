package pojo;

public class Copy {
	private int copy_id;
	private int book_id;
	private int seller_id;
	private int buyer_id;
	
	private String description;
	private String price;
	private String conditions;
	
	public int getCopyId(){
		return copy_id;
	}
	
	public void setCopyId(int copy_id){
		this.copy_id = copy_id;
	}
	
	public int getBookId(){
		return book_id;
	}

	public void setBookId(int book_id){
		this.book_id = book_id;
	}
	
	public int getSellerId(){
		return seller_id;
	}
	
	public void setSellerId(int seller_id){
		this.seller_id = seller_id;
	}
	
	public int getBuyerId(){
		return buyer_id;
	}
	
	public void setBuyerId(int buyer_id){
		this.buyer_id = buyer_id;
	}
	
	public String getDescription(){
		return description;
	}
	
	public void setDescription(String description){
		this.description = description;
	}
	
	public String getPrice(){
		return price;
	}
	
	public void setPrice(String price){
		this.price = price;
	}
	
	public String getConditions(){
		return conditions;
	}
	
	public void setConditions(String conditions) {
		this.conditions = conditions;
	}
	
}