package in.sp.main.Entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Pattern;

@Entity
@Table(name="register")
public class Employee {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	//@NotEmpty(message="Name Can't be empty")
	@Pattern(regexp = "^[a-zA-Z ]{5,30}$",message = "Name is not valid ")
	private String name;
	@Pattern(regexp = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$",message = "email is not valid ")
	private String email;
	@Pattern(regexp = "^[0-9]{10}$",message = "Phone no. is not valid ")
	private String phoneno;
	@Pattern(regexp = "^[a-zA-Z0-9]{6,30}$",message = "password is not valid ")
	private String password;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhoneno() {
		return phoneno;
	}
	public void setPhoneno(String phoneno) {
		this.phoneno = phoneno;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	// Default constructor (Required by JPA)
    public Employee() {
    }

    // All-Args constructor
    public Employee(Integer id, String name, String email, String phoneno, String password) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phoneno = phoneno;
        this.password = password;
    }
	
	
}
