package pojo;
import java.util.Date;

public class User { 
		private int user_id; 
		private String email; 
		private String password; 

		private String nickname;
		private String firstname;
		private String surname;

		private int postcode;
		private int phone;
		private String gender;
		private Date register_at;
		
		public int getUserId(){
			return user_id;
		}
		
		public void setUserId(int user_id){
			this.user_id = user_id;
		}
		
		public String getEmail(){
			return email;
		}
		
		public void setEmail(String email){
			this.email = email;
		}
		
		public String getPassword(){
			return password;
		}
		
		public void setPassword(String password){
			this.password = password;
		}
		
		public String getNickname() {
			return nickname;
		}
		
		public void setNickname(String nickname){
			this.nickname = nickname;
		}
		
		public String getFirstname(){
			return firstname;
		}
		
		public void setFirstname(String firstname){
			this.firstname = firstname;
		}
		
		public String getSurname(){
			return surname;
		}
		
		public void setSurname(String surname){
			this.surname = surname;
		}
		
		public int getPostcode(){
			return postcode;
		}
		
		public void setPostcode(int postcode){
			this.postcode = postcode;
		}
		
		public int getPhone(){
			return phone;
		}
		
		public void setPhone(int phone){
			this.phone = phone;
		}
		
		public String getGender(){
			return gender;
		}
		
		public void setGender(String gender){
			this.gender = gender;
		}
		
		public Date getRegisterat(){
			return register_at;
		}
		
		public void setRegisterat(Date register_at){
			this.register_at = register_at;
		}	
		
} 