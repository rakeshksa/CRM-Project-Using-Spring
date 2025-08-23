package in.sp.main.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import in.sp.main.Entity.CustomerEnquiry;
import java.util.List;


@Repository
public interface CustEnquiryRepository extends JpaRepository<CustomerEnquiry, Integer> {
	boolean existsByPhoneno(String phoneno);
	List<CustomerEnquiry> findAllByPhoneno(String phoneno); 
}
