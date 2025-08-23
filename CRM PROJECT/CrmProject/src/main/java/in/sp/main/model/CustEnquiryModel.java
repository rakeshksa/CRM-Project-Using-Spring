package in.sp.main.model;

import in.sp.main.Entity.CustFollowup;
import in.sp.main.Entity.CustomerEnquiry;

public class CustEnquiryModel {
	private String phoneno;
	private CustomerEnquiry customerEnquiry;
	private CustFollowup custFollowup;
	public String getPhoneno() {
		return phoneno;
	}
	public void setPhoneno(String phoneno) {
		this.phoneno = phoneno;
	}
	public CustomerEnquiry getCustomerEnquiry() {
		return customerEnquiry;
	}
	public void setCustomerEnquiry(CustomerEnquiry customerEnquiry) {
		this.customerEnquiry = customerEnquiry;
	}
	public CustFollowup getCustFollowup() {
		return custFollowup;
	}
	public void setCustFollowup(CustFollowup custFollowup) {
		this.custFollowup = custFollowup;
	}
	

}
