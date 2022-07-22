package board.bean;

import org.springframework.stereotype.Component;

@Component
public class BoardPaging {
	//현재 페이지
	private int currenPage; 
	
	//[이전][1][2][3][다음]
	private int pageBlock;
	
	//1페이지당 5개씩
	private int pageSize;
	
	//총글수 
	private int totalA;
	
	private StringBuffer pagingHTML;
	
	public void makePagingHTML() {
		pagingHTML = new StringBuffer();
		
		
		// 총페이지수 
		//int totalP = (totalA-1) / pageSize + 1;
		int totalP = (totalA+pageSize-1) / pageSize;
		
		//시작 페이지 번호 
		int startPage = (currenPage-1) / pageBlock*pageBlock +1 ;
		
		//끝 페이지 번호
		int endPage = startPage + pageBlock -1 ;
		if(endPage > totalP) {
			endPage = totalP;
		}//if
		
		if(startPage != 1) {
			pagingHTML.append("[ <span id='paging' onclick='boardPaging("+(startPage-1)+")'>이전</span> ]");
		}//if
		for(int i=startPage; i<=endPage; i++) {
			if(i == currenPage) {
				pagingHTML.append(" <span id='currentPaging' onclick = 'boardPaging("+i+")'>"+i+"</span> ");
			}else {
				pagingHTML.append(" <span id='paging' onclick = 'boardPaging("+i+")'>"+i+"</span> ");
				
			}
			
		}//for
		
		if(endPage < totalP) {
			pagingHTML.append("[ <span id='paging' onclick='boardPaging("+(endPage+1)+")'>다음</span> ]");
		}//if
		
	}
	
	
//-------------------------------------겟셋터
	public int getCurrenPage() {
		return currenPage;
	}


	public void setCurrenPage(int currenPage) {
		this.currenPage = currenPage;
	}


	public int getPageBlock() {
		return pageBlock;
	}


	public void setPageBlock(int pageBlock) {
		this.pageBlock = pageBlock;
	}


	public int getPageSize() {
		return pageSize;
	}


	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}


	public int getTotalA() {
		return totalA;
	}


	public void setTotalA(int totalA) {
		this.totalA = totalA;
	}


	public StringBuffer getPagingHTML() {
		return pagingHTML;
	}


	public void setPagingHTML(StringBuffer pagingHTML) {
		this.pagingHTML = pagingHTML;
	}

	
	
	
}
