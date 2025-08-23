package in.sp.main.service;

import java.util.List;

import in.sp.main.Entity.Product;
import in.sp.main.Entity.SaleCourse;

public interface ProductService {

	public boolean addProductService(Product product);
	public List<Product> getAllProductsListService();
	public Product getProductDetailsService(String coursename);
	public List<String> getAllCourseNameService();
	
	public Product getSelectedCourseDetailService(String coursename);
	
	public boolean addSaleCourseDetailService(SaleCourse saleCourse);
	
	public List<Object[]> getPurchasedCourseCountService();
}
