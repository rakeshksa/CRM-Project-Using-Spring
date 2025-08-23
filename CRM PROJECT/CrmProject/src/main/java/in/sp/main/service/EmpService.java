	package in.sp.main.service;
	
	import java.util.List;
	
	import in.sp.main.Entity.Employee;
	
	public interface EmpService {
		public Employee authenticate(String email);
		public boolean addEmplopyeeService(Employee emp);
		public List<Employee> getAllEmployeesService();
		public boolean deleteEmployeeService(String email);
		public boolean updateEmplopyeeService(Employee emp);
	}
