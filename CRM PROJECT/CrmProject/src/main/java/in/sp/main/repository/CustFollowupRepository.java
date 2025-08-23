	package in.sp.main.repository;
	
	import org.springframework.data.jpa.repository.JpaRepository;
	
	import in.sp.main.Entity.CustFollowup;
	import java.util.List;
	
	
	public interface CustFollowupRepository extends JpaRepository<CustFollowup, Integer>{
		CustFollowup findByPhoneno(String phoneno);
		List<CustFollowup> findByFollowupdate(String followupdate);
	}
