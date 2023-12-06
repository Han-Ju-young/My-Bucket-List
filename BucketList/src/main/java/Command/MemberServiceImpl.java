package Command;

import Dao.*;
import Dto.MDto;

public class MemberServiceImpl implements MemberService {
	public void joinMember(MDto mdto) {
		MDao mdao = new MDaoImpl();
		mdao.joinMember(mdto);
	}
}
