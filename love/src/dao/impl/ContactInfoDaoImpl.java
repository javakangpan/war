package dao.impl;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import dao.IContactInfoDao;
import dataBase.DataBase;
import vo.ContactInfo;

public class ContactInfoDaoImpl extends DataBase implements IContactInfoDao {

	@Override
	public boolean inser(ContactInfo contactInfo) {
		try {
			String sql = "insert into contactInfo (name,comments,time,creationDate) values(?,?,?,?)";
			baseUpdate(sql,contactInfo.getName(),contactInfo.getComments(),contactInfo.getTime()
					,contactInfo.getCreationDate());
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public List<ContactInfo> queryAllInfo() {
		SimpleDateFormat sdf = new SimpleDateFormat();// 格式化时间 
        sdf.applyPattern("yyyy-MM-dd");
        Date date = new Date();// 获取当前时间 
        String creationDate = sdf.format(date);
		String sql = "select * from contactInfo where creationDate like" + "'" + creationDate + "%'";
		try {
			return baseQuery(sql,ContactInfo.class);
		} catch (SQLException e) {
			return new ArrayList<ContactInfo>();
		}
		
	}

}
