package admin.qna;


public class QuestionPageMaker {
	
	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;

	private int displayPageNum = 5;

	private QuestionCriteria qc;
	 
	public void setQc(QuestionCriteria qc) {
		this.qc = qc;
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

	public QuestionCriteria getQc() {
		return qc;
	}
	 
	private void calcData() {
		endPage = (int) (Math.ceil(qc.getPage() / (double)displayPageNum) * displayPageNum);
		startPage = (endPage - displayPageNum) + 1;
		int tempEndPage = (int) (Math.ceil(totalCount / (double)qc.getPerPageNum()));

		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		
		prev = startPage == 1 ? false : true;
		next = endPage * qc.getPerPageNum() >= totalCount ? false : true;
	}
}
