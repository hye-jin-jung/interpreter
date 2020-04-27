package admin.ad;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import cscenter.vo.MemberVo;

public class AdminAdServiceIpml implements AdminAdService {
	
	AdminAdDAO adminAdDAO;

	public void setAdminAdDAO(AdminAdDAO adminAdDAO) {
		this.adminAdDAO = adminAdDAO;
	}

	public AdminAdServiceIpml() {

	}
	
	
	
	@Override
	public List<AdminAdAppVO> adAppList() {
		return adminAdDAO.adAppList();
	}
	
	@Override
	public int adListCount() {
		return adminAdDAO.adListCount();
	}
	
	@Override
	public AdminAdAppVO selectAdApp(String pageNo) {
		return adminAdDAO.selectAdApp(pageNo);
	}
	
	@Override
	public void deleteAdApp(String pageNo) {
		adminAdDAO.deleteAdApp(pageNo);
	}
	
	@Override
	public List<AdminAdVO> selectAdContents() {
		return adminAdDAO.selectAdContents();
	}
	
	@Override
	public MemberVo adUserCodeCheck(String userCode) {
		return adminAdDAO.adUserCodeCheck(userCode);
	}
	
	@Override
	public AdminAdAppVO checkAdAppNo(AdminAdAppVO vo) {
		return adminAdDAO.checkAdAppNo(vo);
	}
	
	
	@Override
	public void insertAd(HashMap<String, String> map) {
		adminAdDAO.insertAd(map);
	}
	
	@Override
	public void deleteAd(HashMap<String,ArrayList<String>> map) {
		adminAdDAO.deleteAd(map);
	}
	
	
	
	
	
	
	
}
