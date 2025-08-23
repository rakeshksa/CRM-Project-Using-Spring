package in.sp.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import in.sp.main.Entity.CustomerEnquiry;
import in.sp.main.repository.CustEnquiryRepository;
@Service
public class CustEnquiryServiceImpl implements CustEnquiryService {

	@Autowired
	CustEnquiryRepository custEnquiryRepository;
	
	@Override
	public boolean addCustEnquiryDetailsService(CustomerEnquiry customerEnquiry) {
		boolean status=false;
		
		try {
			
			custEnquiryRepository.save(customerEnquiry);
			status=true;
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			status=false;
		}
		
		
		return status;
	}
	
	@Override
	public boolean isPhonenoExists(String phoneNumber) {
		
		return custEnquiryRepository.existsByPhoneno(phoneNumber);
	}
	@Override
	public List<CustomerEnquiry> getCustAllEnquiryHistory(String phoneno){
		
		return custEnquiryRepository.findAllByPhoneno(phoneno);
	}

	
}
