package school.dto;


//출석부 DB
public class ADto {
	private int stNum;
	private String dep;
	private String stName;
	private String stPhoneNum;
	private String stAddr1;
	private String stAddr2;
	private int att;
	
	public int getStNum() {
		return stNum;
	}
	public void setStNum(int stNum) {
		this.stNum = stNum;
	}
	public String getDep() {
		return dep;
	}
	public void setDep(String dep) {
		this.dep = dep;
	}
	public String getStName() {
		return stName;
	}
	public void setStName(String stName) {
		this.stName = stName;
	}
	public String getStPhoneNum() {
		return stPhoneNum;
	}
	public void setStPhoneNum(String stPhoneNum) {
		this.stPhoneNum = stPhoneNum;
	}
	public String getStAddr1() {
		return stAddr1;
	}
	public void setStAddr1(String stAddr1) {
		this.stAddr1 = stAddr1;
	}
	public String getStAddr2() {
		return stAddr2;
	}
	public void setStAddr2(String stAddr2) {
		this.stAddr2 = stAddr2;
	}
	public int getAtt() {
		return att;
	}
	public void setAtt(int att) {
		this.att = att;
	}
	
}
