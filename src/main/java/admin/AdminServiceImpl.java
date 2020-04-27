package admin;

public class AdminServiceImpl implements AdminService {
	
	AdminDAO adminDAO;

	public void setAdminDAO(AdminDAO adminDAO) {
		this.adminDAO = adminDAO;
	}
	
	
	@Override
	public AdminVO adminLogIn(AdminVO vo) {
		return adminDAO.adminLogIn(vo);
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
