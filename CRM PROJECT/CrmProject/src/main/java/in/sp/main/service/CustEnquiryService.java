package in.sp.main.service;

import java.util.List;

import in.sp.main.Entity.CustomerEnquiry;

public interface CustEnquiryService {

	public boolean addCustEnquiryDetailsService(CustomerEnquiry customerEnquiry);
	public boolean isPhonenoExists(String phoneNumber);
	public List<CustomerEnquiry> getCustAllEnquiryHistory(String phoneno);
}
