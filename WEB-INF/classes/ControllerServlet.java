import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import dao.DBConnection;
import dao.UserBean;
import dao.BookBean;
import dao.CopyBean;
import dao.UsedBookBean;

public class ControllerServlet extends HttpServlet {

  /**Initialize global variables*/
  public void init(ServletConfig config) throws ServletException {

    System.out.println("initializing controller servlet.");

    ServletContext context = config.getServletContext();
    context.setAttribute("base", config.getInitParameter("base"));
		context.setAttribute("asset", config.getInitParameter("asset"));
		try{
			DBConnection conn = new DBConnection();
			// instantiating the Bean
			UserBean userBean = new UserBean();
			userBean.setConnection(conn);
			context.setAttribute("userBean", userBean);  
			System.out.println("UserBean initialized");
			
			BookBean bookBean = new BookBean();
			bookBean.setConnection(conn);
			context.setAttribute("bookBean", bookBean);  
			System.out.println("BookBean initialized");
			
			CopyBean copyBean = new CopyBean();
			copyBean.setConnection(conn);
			context.setAttribute("copyBean", copyBean);  
			System.out.println("CopyBean initialized");
			
			UsedBookBean usedBookBean = new UsedBookBean();
			usedBookBean.setConnection(conn);
			usedBookBean.setBookBean(bookBean);
			usedBookBean.setCopyBean(copyBean);
			usedBookBean.setUserBean(userBean);
			context.setAttribute("usedBookBean", usedBookBean);  
			System.out.println("UsedBookBean initialized");
			
		}catch (Exception e) {
      System.out.println(e.toString());
    }
		
		
    super.init(config);
  }


  /**Process the HTTP Get request*/
  public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doPost(request, response);
  }

  /**Process the HTTP Post request*/
  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    String base = "/jsp/";
    String url = base + "Index.jsp";
    String action = request.getParameter("action");

    if (action!=null) {
			if(action.equals("join"))
				url = base + "Join.jsp";
			else 
			if(action.equals("joinSubmit"))
				url = base + "doJoin.jsp";
			else 
			if(action.equals("login"))
				url = base + "Login.jsp";
			else 
			if(action.equals("loginSubmit"))
				url = base + "doLogin.jsp";
			else 
			if(action.equals("logout"))
				request.getSession().invalidate();
			else
			if(	action.equals("bookDetail")){
				url = base + "BookDetail.jsp";
			}
			else
			if(	action.equals("search")){
				url = base + "SearchResult.jsp";
			}
			else 
			if(action.equals("userCenter")){
				if(request.getSession().getAttribute("loginUser") != null){
				url = base + "Profile.jsp";}
				if(request.getSession().getAttribute("admin") != null){
				url = base + "adminUsers.jsp";}
			}
			else 
			if(action.equals("editProfile")) //user edit profile
				url = base + "doProfile.jsp";
			else 
			if(action.equals("deleteUser")){ //admin delete user profile
				if(request.getSession().getAttribute("admin") != null){
				url = base + "adminUsers.jsp";}
			}
			else 
			if(	action.equals("adminBooks")||
					action.equals("deleteBook")){
				if(request.getSession().getAttribute("admin") != null){
				url = base + "adminBooks.jsp";}
			}
			else
			if(	action.equals("adminAddBook") ||
					action.equals("adminAddBookSubmit")){
				if(request.getSession().getAttribute("admin") != null){
				url = base + "adminAddBooks.jsp";}
			}
			else
			if(	action.equals("sellUsedBook") ||
					action.equals("sellUsedBookSubmit")){
				if(request.getSession().getAttribute("loginUser") != null){
				url = base + "SellUsedBook.jsp";}
			}
			else
			if(	action.equals("sellingUsedBook")){
				if(request.getSession().getAttribute("loginUser") != null){
				url = base + "SellingUsedBook.jsp";}
			}
			else
			if(	action.equals("boughtUsedBook")){
				if(request.getSession().getAttribute("loginUser") != null){
				url = base + "BoughtUsedBook.jsp";}
			}
			else 
			if (	action.equals("addToCart") ||
						action.equals("removeFromCart") ||
						action.equals("shoppingCart"))
        url = base + "ShoppingCart.jsp";
			else 
			if (	action.equals("checkout"))
        url = base + "Checkout.jsp";
			
		/*
      if (action.equals("search"))
        url = base + "SearchResults.jsp";
      else if (action.equals("browseCatalog"))
        url = base + "BrowseCatalog.jsp";
      else if (action.equals("productDetails"))
        url = base + "ProductDetails.jsp";
      else if (action.equals("productDetails"))
        url = base + "ProductDetails.jsp";
      else if (action.equals("addShoppingItem") ||
        action.equals("updateShoppingItem") ||
        action.equals("deleteShoppingItem") ||
        action.equals("displayShoppingCart"))
        url = base + "ShoppingCart.jsp";
      else if (action.equals("checkOut"))
        url = base + "CheckOut.jsp";
      else if (action.equals("order"))
        url = base + "Order.jsp";
		*/
    }
    RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher(url);
    requestDispatcher.forward(request, response);

  }
}
