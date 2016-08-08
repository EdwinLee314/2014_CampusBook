package dao;
import java.sql.ResultSet;
import pojo.User;
import dao.DBConnection;
import java.util.Hashtable;

public class UserBean{
	
	private DBConnection conn = null;
	
	public UserBean(){
	}
	
	public void setConnection(DBConnection conn){
		this.conn = conn;
	}
	
	public boolean createUser(User user)throws Exception{
		try{
			String sql =	"Insert into users" 
								+ "(email, password, nickname, firstname, surname, postcode, phone, gender)" 
								+ "value" + "( ?, ?, ?, ?, ?, ?, ?, ?) " ;
							
			String email = user.getEmail();
			String password = user.getPassword();
			String nickname = user.getNickname();
			String firstname = user.getFirstname();
			String surname = user.getSurname();
			int postcode = user.getPostcode();
			int phone = user.getPhone();
			String gender = user.getGender();			
			return conn.insert(sql, email,password,nickname,firstname,surname,postcode,phone,gender);
	
		}catch(Exception e){
			throw e;
		}finally{
		
		}
	}
	
	public boolean findJoin(User user)throws Exception{
		String sql ="select email from users where email = ?";
		String email = user.getEmail();
		try{
			ResultSet rs = conn.query(sql, email);
			if(rs.next())
				return false;
			else
				return true;
		}catch(Exception e){
			throw e;
		}finally{
		
		}
	}
	public User findUserById(int id)throws Exception{ 
    try{ 
			String sql="select * from users where users_id=?"; 
			ResultSet rs = conn.query(sql, id);
			if (rs.next()) {  		
				User tuser=new User();  
				tuser.setUserId(rs.getInt("users_id"));  
				tuser.setEmail(rs.getString("email"));  
				tuser.setPassword(rs.getString("password")); 
				tuser.setNickname(rs.getString("nickname"));
				tuser.setFirstname(rs.getString("firstname"));
				tuser.setSurname(rs.getString("surname"));
				tuser.setPostcode(rs.getInt("postcode"));
				tuser.setPhone(rs.getInt("phone"));
				tuser.setGender(rs.getString("gender"));
				tuser.setRegisterat(rs.getTimestamp("register_at"));			
				return tuser;  
			}  
			return null;  
    }catch(Exception e){
			throw e;
		}finally{
		
		}
  }
	
	public User findUser(User user)throws Exception{ 
    try{ 
			String sql="select * from users where email=? and password=?"; 
			String email = user.getEmail();
			String password = user.getPassword();
			ResultSet rs = conn.query(sql, email,password);
			if (rs.next()) {  		
				User tuser=new User();  
				tuser.setUserId(rs.getInt("users_id"));  
				tuser.setEmail(email);  
				tuser.setPassword(password); 
				tuser.setNickname(rs.getString("nickname"));
				tuser.setFirstname(rs.getString("firstname"));
				tuser.setSurname(rs.getString("surname"));
				tuser.setPostcode(rs.getInt("postcode"));
				tuser.setPhone(rs.getInt("phone"));
				tuser.setGender(rs.getString("gender"));
				tuser.setRegisterat(rs.getTimestamp("register_at"));			
				return tuser;  
			}  
			return null;  
    }catch(Exception e){
			throw e;
		}finally{
		
		}
  }
	
	public Hashtable getAllUsers()throws Exception{ 
		Hashtable allUsers = new Hashtable();
    try{ 
			String sql="select * from users"; 
			ResultSet rs = conn.query(sql);
			while(rs.next()) {  		
				User tuser=new User();  
				tuser.setUserId(rs.getInt("users_id"));  
				tuser.setEmail(rs.getString("email"));  
				tuser.setPassword(rs.getString("password")); 
				tuser.setNickname(rs.getString("nickname"));
				tuser.setFirstname(rs.getString("firstname"));
				tuser.setSurname(rs.getString("surname"));
				tuser.setPostcode(rs.getInt("postcode"));
				tuser.setPhone(rs.getInt("phone"));
				tuser.setGender(rs.getString("gender"));
				tuser.setRegisterat(rs.getTimestamp("register_at"));			
				allUsers.put(tuser.getUserId(), tuser); 
			}  
			return allUsers;  
    }catch(Exception e){
			throw e;
		}finally{
		
		}
  }
	
	public void editUser(User user)throws Exception{
		try{
			String sql =	"Update users " +
										"Set password = ? , nickname = ? , firstname = ? , surname = ? , postcode = ? , phone = ? , gender = ? " +
										"Where users_id = ? AND email = ? ";
						
			String email = user.getEmail();
			String password = user.getPassword();
			String nickname = user.getNickname();
			String firstname = user.getFirstname();
			String surname = user.getSurname();
			int postcode = user.getPostcode();
			int phone = user.getPhone();
			String gender = user.getGender();
			int users_id = user.getUserId();
			
			conn.modify(sql, password, nickname, firstname, surname, postcode, phone, gender, users_id, email);
	
		}catch(Exception e){
			throw e;
		}finally{
		
		}
	}
	
	public void deleteUser(int userId)throws Exception{
		try{
			String sql = 	"Delete from users Where users_id = ?";
			conn.modify(sql, userId);
		}catch(Exception e){
			throw e;
		}finally{
		
		}
	
	}
}