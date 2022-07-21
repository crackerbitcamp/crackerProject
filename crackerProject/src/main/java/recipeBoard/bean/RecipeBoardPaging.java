package recipeBoard.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class RecipeBoardPaging {
	// 현재 페이지
	private int currenPage;

	// [이전][1][2][3][다음]
	private int pageBlock;

	// 1페이지당 5개씩
	private int pageSize;

	// 총글수
	private int totalA;

	private StringBuffer pagingHTML;

	public void makePagingHTML() {
		pagingHTML = new StringBuffer();

		// 총페이지수
		// int totalP = (totalA-1) / pageSize + 1;
		int totalP = (totalA + pageSize - 1) / pageSize;

		// 시작 페이지 번호
		int startPage = (currenPage - 1) / pageBlock * pageBlock + 1;

		// 끝 페이지 번호
		int endPage = startPage + pageBlock - 1;
		if (endPage > totalP) {
			endPage = totalP;
		} // if

		if (startPage != 1) {
			pagingHTML.append("[ <span id='paging' onclick='recipeBoardPaging(" + (startPage - 1) + ")'>이전</span> ]");
		} // if
		for (int i = startPage; i <= endPage; i++) {
			if (i == currenPage) {
				pagingHTML.append(" <span id='currentPaging' onclick = 'recipeBoardPaging(" + i + ")'>" + i + "</span> ");
			} else {
				pagingHTML.append(" <span id='paging' onclick = 'recipeBoardPaging(" + i + ")'>" + i + "</span> ");

			}

		} // for

		if (endPage < totalP) {
			pagingHTML.append("[ <span id='paging' onclick='recipeBoardPaging(" + (endPage + 1) + ")'>다음</span> ]");
		} // if

	}
}
