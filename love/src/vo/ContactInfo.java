package vo;

import java.io.Serializable;


import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

/**
 * 聊天信息
 * @author 康盼Java开发工程师
 *
 */
@RequiredArgsConstructor
public class ContactInfo implements Serializable {
	
	private static final long serialVersionUID = -2442156255945500917L;
	
	private int id;

	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}



	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}



	@Getter @Setter private String name;
	
	@Getter @Setter private String comments;
	
	private String time;
	
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}



	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}



	/**
	 * @return the comments
	 */
	public String getComments() {
		return comments;
	}



	/**
	 * @param comments the comments to set
	 */
	public void setComments(String comments) {
		this.comments = comments;
	}



	/**
	 * @return the time
	 */
	public String getTime() {
		return time;
	}



	/**
	 * @param time the time to set
	 */
	public void setTime(String time) {
		this.time = time;
	}
	
	private String CreationDate;

	/**
	 * @return the creationDate
	 */
	public String getCreationDate() {
		return CreationDate;
	}



	/**
	 * @param creationDate the creationDate to set
	 */
	public void setCreationDate(String creationDate) {
		CreationDate = creationDate;
	}
}
