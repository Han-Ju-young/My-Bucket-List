package Command;

import java.util.ArrayList;
import Dao.BDao;
import Dao.BDaoImpl;
import Dto.BDto;

public class BoardServiceImpl implements BoardService {
	public ArrayList<BDto> showBoardList(int startRow, int pageSize) {
		ArrayList<BDto> dtos = null;
		BDao bdao = new BDaoImpl();
		dtos = bdao.showBoardList(startRow, pageSize);
		return dtos;
	}
	
	public ArrayList<BDto> showBoardLists(int startRow, int pageSize) {
		ArrayList<BDto> dtos = null;
		BDao bdao = new BDaoImpl();
		dtos = bdao.showBoardList(startRow, pageSize);
		return dtos;
	}
	
	public int writeContent(BDto bdto, String bmId) {
		int ret = 0;
		BDao bdao = new BDaoImpl();
		ret = bdao.writeContent(bdto, bmId);
		return ret;
	}

	public BDto viewContent(int id) {
		BDto dto = null; // null이 아닌 new BDto()로 해도 동작은 되지만 버려지는 객체 주소가 생성됨 즉, 각각의 변수가 어디를 가르키고 있는지 - 객체의 개념에 대해 잘 알고 있는것이 중요
		BDao dao = new BDaoImpl();
		dto = dao.viewContent(id);
		return dto;
	}
	
	public void modifyContent(BDto bdto) {
		BDao dao = new BDaoImpl();
		dao.modifyContent(bdto);
	}

	public int deleteContent(int id) {
		int ret = 0;
		BDao dao = new BDaoImpl();
		ret = dao.deleteContent(id);
		return ret;
	}
}
