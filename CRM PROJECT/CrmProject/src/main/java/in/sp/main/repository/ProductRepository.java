package in.sp.main.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import in.sp.main.Entity.Product;
import java.util.List;


public interface ProductRepository extends JpaRepository<Product, Integer>
{

	Product findByCoursename(String coursename);
	@Query("SELECT coursename from Product ")
	List<String> findCourseName();
}
