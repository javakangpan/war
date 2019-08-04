package dao;

import java.util.List;

import vo.ContactInfo;

public interface IContactInfoDao {
	
	public boolean inser(ContactInfo contactInfo);
	
	public List<ContactInfo>  queryAllInfo();
}
