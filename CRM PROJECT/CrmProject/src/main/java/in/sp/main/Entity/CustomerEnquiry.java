package in.sp.main.Entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class CustomerEnquiry {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	@Column(name = "phoneno")
	private String phoneno;
	@Column(name = "name")
	private String name;
	@Column(name = "interested_course")
	private String interestedcourse;
	@Column(name = "discussion")
	private String discussion;
	@Column(name = "enquiry_type")
	private String enquirytype;
	@Column(name = "status")
	private String status;
	
	@Column(name = "call_to")
	private String callto;
	@Column(name = "enquiry_date")
	private String enquirydate;
	@Column(name = "enquiry_time")
	private String enquirytime;
	@Column(name="emp_Email")
	private String empEmail;
	
	
	public String getEmpEmail() {
		return empEmail;
	}
	public void setEmpEmail(String empEmail) {
		this.empEmail = empEmail;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getPhoneno() {
		return phoneno;
	}
	public void setPhoneno(String phoneno) {
		this.phoneno = phoneno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getInterestedcourse() {
		return interestedcourse;
	}
	public void setInterestedcourse(String interestedcourse) {
		this.interestedcourse = interestedcourse;
	}
	public String getDiscussion() {
		return discussion;
	}
	public void setDiscussion(String discussion) {
		this.discussion = discussion;
	}
	public String getEnquirytype() {
		return enquirytype;
	}
	public void setEnquirytype(String enquirytype) {
		this.enquirytype = enquirytype;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	public String getCallto() {
		return callto;
	}
	public void setCallto(String callto) {
		this.callto = callto;
	}
	public String getEnquirydate() {
		return enquirydate;
	}
	public void setEnquirydate(String enquirydate) {
		this.enquirydate = enquirydate;
	}
	public String getEnquirytime() {
		return enquirytime;
	}
	public void setEnquirytime(String enquirytime) {
		this.enquirytime = enquirytime;
	}
	
	
	
}
