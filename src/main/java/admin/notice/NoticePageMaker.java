package admin.notice;

public class NoticePageMaker {
	
	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;

	private int displayPageNum = 4;

	private NoticeCriteria nc;
	 
	public void setNc(NoticeCriteria nc) {
		this.nc = nc;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}

	public int getTotalCount() {
		return totalCount;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public boolean isNext() {
		return next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public NoticeCriteria getNc() {
		return nc;
	}
	 
	private void calcData() {
		endPage = (int) (Math.ceil(nc.getPage() / (double)displayPageNum) * displayPageNum);
		startPage = (endPage - displayPageNum) + 1;
		int tempEndPage = (int) (Math.ceil(totalCount / (double)nc.getPerPageNum()));

		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		
		prev = startPage == 1 ? false : true;
		next = endPage * nc.getPerPageNum() >= totalCount ? false : true;
	}
	
}
