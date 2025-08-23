package in.sp.main.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import in.sp.main.Entity.SaleCourse;
@Repository
public interface SaleCourseRepository extends JpaRepository<SaleCourse, Integer> {
	@Query("SELECT date,COUNT(id) from SaleCourse Group BY date")
	List<Object[]> cocountByPurchasedDate();
}
