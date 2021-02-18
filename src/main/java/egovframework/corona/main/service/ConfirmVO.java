package egovframework.corona.main.service;

import java.util.Date;

public class ConfirmVO {
	private int cno;
	private String name;
	private String state;
	private Date confirm_date;
	private Date update_date;
	private String address_no;
	private String address;
	private String address_detail;
	private String address_extra;
	private String gender;
	private String birth;
	private String local;
	private String phone;
	private String region;
	private String sortno;
	private String cellOs;
	private int rnum;
	private int age;
	private String birthinfo;

	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}

	public Date getConfirm_date() {
		return confirm_date;
	}
	public void setConfirm_date(Date confirm_date) {
		this.confirm_date = confirm_date;
	}
	public Date getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}
	   public String getAddress_no() {
		return address_no;
	}
	public void setAddress_no(String address_no) {
		this.address_no = address_no;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddress_detail() {
		return address_detail;
	}
	public void setAddress_detail(String address_detail) {
		this.address_detail = address_detail;
	}
	public String getAddress_extra() {
		return address_extra;
	}
	public void setAddress_extra(String address_extra) {
		this.address_extra = address_extra;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getLocal() {
		return local;
	}
	public void setLocal(String local) {
		this.local = local;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getSortno() {
		return sortno;
	}
	public void setSortno(String sortno) {
		this.sortno = sortno;
	}
	public String getCellOs() {
		return cellOs;
	}
	public void setCellOs(String cellOs) {
		this.cellOs = cellOs;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getBirthinfo() {
		return birthinfo;
	}
	public void setBirthinfo(String birthinfo) {
		this.birthinfo = birthinfo;
	}
	@Override
	   public String toString() {
	      return "AdminloginVO [ cno="+ cno+ ", state=" + state + ", name="+name+ 
	    		  ", confirm_date="+confirm_date+", update_date="+update_date+ " ]";
	   }

}
