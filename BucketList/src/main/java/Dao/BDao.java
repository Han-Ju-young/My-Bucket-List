package Dao;

import java.util.ArrayList;
import Dto.BDto;

public interface BDao {
	public ArrayList<BDto> showBoardList(int startRow, int pageSize);
	public ArrayList<BDto> showBoardLists(int startRow, int pageSize, String bmId);
	
	public ArrayList<BDto> getSearch(int startRow, int pageSize, String searchField, String searchText);
	public ArrayList<BDto> getSearchs(int startRow, int pageSize, String searchField, String searchText, String bmId);
	
	public int writeContent(BDto bdto, String bmId);
	public BDto viewContent(int bId);
	public int modifyContent(BDto bdto);
	public int deleteContent(int bId);
	
	public boolean nextPage(int pageNumber);
	public int getBoardCount();
	public int getBoardCounts(String bmId);
	public int getCount(String keyWord, String searchWord);
}
