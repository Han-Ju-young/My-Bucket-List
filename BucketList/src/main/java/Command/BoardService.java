package Command;

import java.util.ArrayList;
import Dto.BDto;

public interface BoardService {
	ArrayList<BDto> showBoardList(int startRow, int pageSize);
	ArrayList<BDto> showBoardLists(int startRow, int pageSize);
	int writeContent(BDto bdto, String bmId);
	BDto viewContent(int id);
	void modifyContent(BDto bdto);
	int deleteContent(int id);
}
