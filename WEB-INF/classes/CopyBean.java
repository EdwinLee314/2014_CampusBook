package dao;
import java.sql.ResultSet;
import pojo.Book;
import pojo.Copy;
import dao.DBConnection;
import java.util.Hashtable;

public class CopyBean{
	
	private DBConnection conn = null;
	
	public CopyBean(){}
	
	public void setConnection(DBConnection conn){
		this.conn = conn;
	}
	
	public boolean createCopy(Copy copy)throws Exception{
		try{
			String sql =	"Insert into copies(book_id, seller_id, price, description, conditions) values(?, ?, ?, ?, ?)";
			int book_id = copy.getBookId();
			int seller_id = copy.getSellerId();
			String description = copy.getDescription();
			String price = copy.getPrice();
			String conditions = copy.getConditions();

			return conn.insert(sql, book_id, seller_id, price, description, conditions);
		
		}catch(Exception e){
			System.out.println("error in create a copy");
			throw e;
		}finally{
		
		}
	
	}
	
	public void buyCopy(int buyer_id,int copy_id)throws Exception{
		try{
			String sql = 	"Update copies Set buyer_id = ? Where copy_id = ?";
			conn.modify(sql, buyer_id, copy_id);
		}catch(Exception e){
			System.out.println("error in buy a copy");
			throw e;
		}finally{
		
		}
	
	}	
	
	public Copy getCopyByCopyId(int copy_id)throws Exception{
		try{
			String sql =	"Select * From copies Where copy_id = ? ";
			ResultSet rs = conn.query(sql, copy_id);
			if (rs.next()) {  		
				Copy tCopy = new Copy();  
				tCopy.setCopyId(rs.getInt("copy_id"));
				tCopy.setBookId(rs.getInt("book_id")); 
				tCopy.setSellerId(rs.getInt("seller_id")); 
				tCopy.setBuyerId(rs.getInt("buyer_id"));
				
				tCopy.setPrice(rs.getString("price"));
				tCopy.setConditions(rs.getString("conditions"));
				tCopy.setDescription(rs.getString("description"));	
				return tCopy;  
			}  
			return null;  
			
		}catch(Exception e){
			System.out.println("error in get a copy");
			throw e;
		}finally{
		
		}
	
	}
	
	public Hashtable getSellingCopiesOfABook(int book_id)throws Exception{
		Hashtable allCopies = new Hashtable();
		try{
			String sql =	"Select * From copies Where book_id = ? and buyer_id = 0";
			ResultSet rs = conn.query(sql, book_id);
			while(rs.next()) {  		
				Copy tCopy = new Copy();
				tCopy.setCopyId(rs.getInt("copy_id"));
				tCopy.setBookId(rs.getInt("book_id")); 
				tCopy.setSellerId(rs.getInt("seller_id")); 
				tCopy.setPrice(rs.getString("price"));
				tCopy.setConditions(rs.getString("conditions"));
				tCopy.setDescription(rs.getString("description"));
				allCopies.put(tCopy.getCopyId(), tCopy);
			}  
			return allCopies;
		}catch(Exception e){
			System.out.println("error in copies hash table");
			throw e;
		}finally{
		
		}
	
	}
	
	public Hashtable getBoughtCopiesOfABuyer(int buyer_id)throws Exception{
		Hashtable allCopies = new Hashtable();
		try{
			String sql =	"Select * From copies Where buyer_id = ?";
			ResultSet rs = conn.query(sql, buyer_id);
			while(rs.next()) {  		
				Copy tCopy = new Copy();
				tCopy.setCopyId(rs.getInt("copy_id"));
				tCopy.setBookId(rs.getInt("book_id")); 
				tCopy.setSellerId(rs.getInt("seller_id"));
				tCopy.setBuyerId(rs.getInt("buyer_id")); 				
				tCopy.setPrice(rs.getString("price"));
				tCopy.setConditions(rs.getString("conditions"));
				tCopy.setDescription(rs.getString("description"));
				allCopies.put(tCopy.getCopyId(), tCopy);
			}  
			return allCopies;
		}catch(Exception e){
			System.out.println("error in copies hash table");
			throw e;
		}finally{
		
		}
	}
	
	public Hashtable getSellingCopiesOfASeller(int seller_id)throws Exception{
		Hashtable allCopies = new Hashtable();
		try{
			String sql =	"Select * From copies Where seller_id = ? and buyer_id = 0";
			ResultSet rs = conn.query(sql, seller_id);
			while(rs.next()) {  		
				Copy tCopy = new Copy();
				tCopy.setCopyId(rs.getInt("copy_id"));
				tCopy.setBookId(rs.getInt("book_id")); 
				tCopy.setSellerId(rs.getInt("seller_id")); 
				tCopy.setPrice(rs.getString("price"));
				tCopy.setConditions(rs.getString("conditions"));
				tCopy.setDescription(rs.getString("description"));
				allCopies.put(tCopy.getCopyId(), tCopy);
			}  
			return allCopies;
		}catch(Exception e){
			System.out.println("error in copies hash table");
			throw e;
		}finally{
		
		}
	
	}
	

}