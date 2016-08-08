package dao;
import java.sql.ResultSet;
import pojo.Book;
import pojo.Copy;
import pojo.User;
import pojo.UsedBook;
import dao.DBConnection;
import dao.BookBean;
import dao.CopyBean;
import dao.UserBean;

import java.util.Hashtable;
import java.util.*;

public class UsedBookBean{
	
	private DBConnection conn = null;
	private BookBean bookBean = null;
	private CopyBean copyBean = null;
	private UserBean userBean = null;
	
	public UsedBookBean(){}
	
	public void setConnection(DBConnection conn){
		this.conn = conn;
	}
	
	public void setBookBean(BookBean bookBean){
		this.bookBean = bookBean;
	}
	
	public void setCopyBean(CopyBean copyBean){
		this.copyBean = copyBean;
	}
	
	public void setUserBean(UserBean userBean){
		this.userBean = userBean;
	}
	
	public boolean createUsedBook(Book book, Copy copy)throws Exception{
		boolean flag = false;
		try{
			String isbn = book.getIsbn();
			Book tBook = null;
			tBook = bookBean.findBookByIsbn(isbn);
			
			if(tBook == null){
				//user input a new book which is not in the database
				bookBean.createBook(book);
				tBook = bookBean.findBookByIsbn(isbn);
			}
			//user input a book which is in the database
			int book_id = tBook.getBookId();
			
			System.out.println(book_id);
			
			copy.setBookId(book_id);
			if(copyBean.createCopy(copy) == true){
				flag = true;
			}
		
			return flag;
		}catch(Exception e){
			throw e;
		}finally{
		
		}
	
	}
	
	public void buyUsedBook(int buyer_id, UsedBook usedBook)throws Exception{
		try{
			Copy tCopy = usedBook.getCopy();
			int copy_id = tCopy.getCopyId();
			copyBean.buyCopy(buyer_id, copy_id);
		
		}catch(Exception e){
			System.out.println("error in buy a used book");
			throw e;
		}finally{
		
		}
	
	}
	
	public UsedBook getSellingUsedBookByCopyId(int copyId)throws Exception{
		try{
			Copy tCopy = copyBean.getCopyByCopyId(copyId);
			int book_id = tCopy.getBookId();
			Book tBook = bookBean.findBookById(book_id);
			int seller_id = tCopy.getSellerId();
			User seller= userBean.findUserById(seller_id);
			UsedBook tp = new UsedBook();
			tp.setBook(tBook);
			tp.setCopy(tCopy);
			tp.setSeller(seller);
			return tp;
			
		}catch(Exception e){
			System.out.println("error in get a used book");
			throw e;
		}finally{
		
		}
	}
	
	public Hashtable getBoughtUsedBookByBuyerId(int buyer_id)throws Exception{
		Hashtable usedBooks = new Hashtable();
		try{
			Hashtable copies = copyBean.getBoughtCopiesOfABuyer(buyer_id);
			Enumeration copyIds = copies.keys();
			while(copyIds.hasMoreElements()){
				Object copyId = copyIds.nextElement();
				Copy tCopy = (Copy)copies.get(copyId);
				
				int book_id = tCopy.getBookId();
				Book tBook = bookBean.findBookById(book_id);
				
				int seller_id = tCopy.getSellerId();
				User seller= userBean.findUserById(seller_id);
				
				User buyer= userBean.findUserById(buyer_id);
				UsedBook tp = new UsedBook();
				tp.setBook(tBook);
				tp.setCopy(tCopy);
				tp.setSeller(seller);
				tp.setBuyer(buyer);
				usedBooks.put(tCopy.getCopyId(), tp);
			}
			return usedBooks;
		}catch(Exception e){
			throw e;
		}finally{
		
		}
	}
	
	public Hashtable getSellingUsedBookBySellerId(int seller_id)throws Exception{
		Hashtable usedBooks = new Hashtable();
		try{
			Hashtable copies = copyBean.getSellingCopiesOfASeller(seller_id);
			Enumeration copyIds = copies.keys();
			while(copyIds.hasMoreElements()){
				Object copyId = copyIds.nextElement();
				Copy tCopy = (Copy)copies.get(copyId);
				
				int book_id = tCopy.getBookId();
				Book tBook = bookBean.findBookById(book_id);
				
				User seller= userBean.findUserById(seller_id);
				
				UsedBook tp = new UsedBook();
				tp.setBook(tBook);
				tp.setCopy(tCopy);
				tp.setSeller(seller);
				usedBooks.put(tCopy.getCopyId(), tp);
			}
			return usedBooks;
		}catch(Exception e){
			throw e;
		}finally{
		
		}
	
	}
	
	public Hashtable getSellingUsedBookByBookId(int book_id)throws Exception{
		Hashtable usedBooks = new Hashtable();
		try{
			Hashtable copies = copyBean.getSellingCopiesOfABook(book_id);
			Enumeration copyIds = copies.keys();
			while(copyIds.hasMoreElements()){
				Object copyId = copyIds.nextElement();
				Copy tCopy = (Copy)copies.get(copyId);
				
				Book tBook = bookBean.findBookById(book_id);
				int seller_id = tCopy.getSellerId();
				User seller= userBean.findUserById(seller_id);
				
				UsedBook tp = new UsedBook();
				tp.setBook(tBook);
				tp.setCopy(tCopy);
				tp.setSeller(seller);
				usedBooks.put(tCopy.getCopyId(), tp);
			}
			return usedBooks;
		}catch(Exception e){
			throw e;
		}finally{
		
		}
	
	}
}