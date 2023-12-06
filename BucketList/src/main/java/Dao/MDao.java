package Dao;

import Dto.MDto;

public interface MDao {
	public void joinMember(MDto mdto);
	public int loginCheck(String mId, String mPw);
}
