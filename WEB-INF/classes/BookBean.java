package dao;
import java.sql.ResultSet;
import pojo.Book;
import dao.DBConnection;
import java.util.Hashtable;

public class BookBean{
	
	private DBConnection conn = null;
	
	public BookBean(){}
	
	public void setConnection(DBConnection conn){
		this.conn = conn;
	}
	
	public boolean createBook(Book book)throws Exception{
		try{
			String sql =	"Insert into books" 
								+ 	"(isbn, unit_code, title, author)" 
								+ 	"value" + "( ?, ?, ?, ?) ";
							
			String isbn = book.getIsbn();
			String unit_code = book.getUnitCode();
			String title = book.getTitle();
			String author = book.getAuthor();
		
			return conn.insert(sql,isbn, unit_code, title, author);
	
		}catch(Exception e){
			throw e;
		}finally{
		
		}
	}
	
	public void deleteBook(int id)throws Exception{
		try{
			String sql = 	"Delete from books Where book_id = ?";
			conn.modify(sql, id);
		}catch(Exception e){
			throw e;
		}finally{
		
		}
	
	}
	
	public Hashtable getAllBooks()throws Exception{ 
		Hashtable allBooks = new Hashtable();
    try{ 
			String sql="select * from books"; 
			ResultSet rs = conn.query(sql);
			while(rs.next()) {  		
				Book tBook = new Book();
				tBook.setBookId(rs.getInt("book_id"));  
				tBook.setIsbn(rs.getString("isbn"));
				tBook.setUnitCode(rs.getString("unit_code"));
				tBook.setTitle(rs.getString("title"));
				tBook.setAuthor(rs.getString("author"));
				
				allBooks.put(tBook.getBookId(), tBook); 
			}  
			return allBooks;  
    }catch(Exception e){
			throw e;
		}finally{
		
		}
  }
			
	public Book findBookById(int id)throws Exception{
		String sql ="Select * From books Where book_id = ? "; 
		ResultSet rs = conn.query(sql, id);
		try{
			if (rs.next()) {  		
				Book tBook = new Book();
				tBook.setBookId(rs.getInt("book_id"));  
				tBook.setIsbn(rs.getString("isbn"));
				tBook.setUnitCode(rs.getString("unit_code"));
				tBook.setTitle(rs.getString("title"));
				tBook.setAuthor(rs.getString("author"));
				return tBook;  
			} 
			
			return null;  
			
    }catch(Exception e){
			throw e;
		}finally{
		
		}
	}


	public Book findBookByIsbn(String isbn)throws Exception{
		String sql ="Select * From books Where isbn = ? "; 
		ResultSet rs = conn.query(sql, isbn);
		try{
			if (rs.next()) {  		
				Book tBook = new Book();
				tBook.setBookId(rs.getInt("book_id"));  
				tBook.setIsbn(rs.getString("isbn"));
				tBook.setUnitCode(rs.getString("unit_code"));
				tBook.setTitle(rs.getString("title"));
				tBook.setAuthor(rs.getString("author"));
				return tBook;  
			} 
			
			return null;  
			
    }catch(Exception e){
			throw e;
		}finally{
		
		}
	}
	
	public Book findBookByUnitCode(String unit_code)throws Exception{
		String sql ="Select * From books Where unit_code = ? "; 
		ResultSet rs = conn.query(sql, unit_code);
		try{
			if (rs.next()) {  		
				Book tBook = new Book();
				tBook.setBookId(rs.getInt("book_id"));  
				tBook.setIsbn(rs.getString("isbn"));
				tBook.setUnitCode(rs.getString("unit_code"));
				tBook.setTitle(rs.getString("title"));
				tBook.setAuthor(rs.getString("author"));
				return tBook;  
			} 
			
			return null;  
			
    }catch(Exception e){
			throw e;
		}finally{
		
		}
	}
	
	public Book findBookByTitle(String title)throws Exception{
		String sql ="Select * From books Where title = ? "; 
		ResultSet rs = conn.query(sql, title);
		try{
			if (rs.next()) {  		
				Book tBook = new Book();
				tBook.setBookId(rs.getInt("book_id"));  
				tBook.setIsbn(rs.getString("isbn"));
				tBook.setUnitCode(rs.getString("unit_code"));
				tBook.setTitle(rs.getString("title"));
				tBook.setAuthor(rs.getString("author"));
				return tBook;  
			} 
			
			return null;  
			
    }catch(Exception e){
			throw e;
		}finally{
		
		}
	}
}
