package chatMatching.spring;

import java.util.List;

import chatMatching.vo.MatchingVo;
import join.member.PageReady;

public interface MatchingService {
	public int getErMatchingCount(String myUserCode);
	public int getEeMatchingCount(String myUserCode);
	public List<MatchingVo> getErMatching(String myUserCode, PageReady page);
	public List<MatchingVo> getEeMatching(String myUserCode, PageReady page);
	public void deleteMatching(String matchingCode);
	public void onMatchangeSms(String myUserCode);
	public void offMatchangeSms(String myUserCode);
	public void makeCf(String targetCode, String matchingCode);
	public void makeReview(String category, String matchingCode, String myuserCode, String targetCode, double star, String content);


	
}
