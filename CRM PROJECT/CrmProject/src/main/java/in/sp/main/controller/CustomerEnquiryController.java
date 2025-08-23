package in.sp.main.controller;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import in.sp.main.Entity.CustFollowup;
import in.sp.main.Entity.CustomerEnquiry;
import in.sp.main.Entity.Employee;
import in.sp.main.model.CustEnquiryModel;
import in.sp.main.service.CustEnquiryService;
import in.sp.main.service.CustFollowupService;
import in.sp.main.service.ProductService;
import jakarta.servlet.http.HttpSession;

@Controller
public class CustomerEnquiryController {
	@Autowired
	ProductService productService;
	@Autowired
	CustEnquiryService custEnquiryService;
	@Autowired
	CustFollowupService custFollowupService;
	
	@GetMapping("/customerEnquirypage")
	public String customerEnquirypage(Model model,
			@RequestParam(name="redirect_success",required = false) String success, 
			@RequestParam(name="redirect_error",required = false) String error) {
		List<String> list_coursenames = productService.getAllCourseNameService();
		model.addAttribute("model_coursename_list", list_coursenames);
		model.addAttribute("modelCustEnquiryAttr", new CustEnquiryModel());
		
		model.addAttribute("model_success", success);
		model.addAttribute("model_error", error);
		
		return "customer-enquiry";
	}
	
	@PostMapping("/custEnquiryForm")
	public String custEnquiryForm(HttpSession session, 
			@ModelAttribute("modelCustEnquiryAttr") CustEnquiryModel custEnquiryModel,
			RedirectAttributes redirectAttributes) {
		LocalDate date=LocalDate.now();
		String date1=date.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
		
		LocalTime time=LocalTime.now();
		String time1=time.format(DateTimeFormatter.ofPattern("HH:mm:ss"));
		
		Employee employee=(Employee)session.getAttribute("session_employee");
		String empEmail="";
		if (employee != null) {
			empEmail=employee.getEmail();
		}
		
		String phoneno = custEnquiryModel.getPhoneno();
		CustomerEnquiry customerEnquiry = custEnquiryModel.getCustomerEnquiry();
		customerEnquiry.setPhoneno(phoneno);
		customerEnquiry.setEnquirydate(date1);
		customerEnquiry.setEnquirytime(time1);
		customerEnquiry.setEmpEmail(empEmail);
		
		CustFollowup custFollowup = custEnquiryModel.getCustFollowup();
		custFollowup.setPhoneno(phoneno);
		
		boolean status1 = custEnquiryService.addCustEnquiryDetailsService(customerEnquiry);
		boolean status2 = custFollowupService.addCustFollowupDateService(custFollowup);
		if (status1&&status2) {
			redirectAttributes.addAttribute("redirect_success", "Customer enquiry detail added succesfully");
		}
		else {
			redirectAttributes.addAttribute("redirect_error", "Customer enquiry detail Not added Due to some error ");
			
		}
		
		return "redirect:/customerEnquirypage";
	}
	
	@GetMapping("/customerFolloupPage")
	public String customerFolloupPage(
	        Model model,
	        @RequestParam(name="selectedDate", required = false)
	        @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate selectedDate
	) {
	    String date1;
	    if (selectedDate != null) {
	        date1 = selectedDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
	    } else {
	        date1 = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
	    }
	    List<CustFollowup> list_followups = custFollowupService.getFollowupForProvidedDate(date1);
	    model.addAttribute("model_followups", list_followups);
	    return "customer-followups";
	}
	

	@GetMapping("/checkPhoneNumberAvailability")
	@ResponseBody
	public String checkPhoneno(@RequestParam("phoneNumber")String phoneno) {
		
		boolean status = custEnquiryService.isPhonenoExists(phoneno);
		
		if (status) {
			
			return "exits";
		}
		return "not_exits";
	}
	@GetMapping("/custEnquiryHistoryPage")
	public String opencustEnquiryHistoryPage(@RequestParam("phno")String phoneno,Model model) {
		List<CustomerEnquiry> list_custenq = custEnquiryService.getCustAllEnquiryHistory(phoneno);
		model.addAttribute("model_custenq", list_custenq);
		model.addAttribute("modelCustEnquiryAttr",new CustEnquiryModel() );
		
		List<String> list_coursenames = productService.getAllCourseNameService();
		model.addAttribute("model_coursename_list", list_coursenames); 	
		return "cusenq-history";
	}
	
	

	
}
