package egovframework.corona.main.service;

import java.util.Date;

public class AdminloginVO {
   private int ano;
   private String adminId;
   private String adminPassword;
   private String adminName;
   private String amail;
   private String acontact;
   private int rnum;
   private Date regDate;
   private Date updateDate;
   private String right;
   private int result;
   private String account;



   public int getAno() {
	return ano;
}


public void setAno(int ano) {
	this.ano = ano;
}


public AdminloginVO() {
      // TODO Auto-generated constructor stub
   }
   
   
   public AdminloginVO(String adminId, String adminPassword) {
      super();
      this.adminId = adminId;
      this.adminPassword = adminPassword;
  
   }


   public String getAdminId() {
      return adminId;
   }
   public void setAdminId(String adminId) {
      this.adminId = adminId;
   }
   public String getAdminPassword() {
      return adminPassword;
   }
   public void setAdminPassword(String adminPassword) {
      this.adminPassword = adminPassword;
   }




public String getAdminName() {
	return adminName;
}


public void setAdminName(String adminName) {
	this.adminName = adminName;
}


public String getAmail() {
	return amail;
}


public void setAmail(String amail) {
	this.amail = amail;
}


public String getAcontact() {
	return acontact;
}


public void setAcontact(String acontact) {
	this.acontact = acontact;
}


public int getRnum() {
	return rnum;
}


public void setRNum(int rnum) {
	this.rnum = rnum;
}


public Date getRegDate() {
	return regDate;
}


public void setRegDate(Date regDate) {
	this.regDate = regDate;
}


public Date getUpdateDate() {
	return updateDate;
}


public void setUpdateDate(Date updateDate) {
	this.updateDate = updateDate;
}


public String getRight() {
	return right;
}


public void setRight(String right) {
	this.right = right;
}


public int getResult() {
	return result;
}


public void setResult(int result) {
	this.result = result;
}


public String getAccount() {
	return account;
}


public void setAccount(String account) {
	this.account = account;
}


@Override
public String toString() {
	return "AdminloginVO [ano=" + ano + ", adminId=" + adminId + ", adminPassword=" + adminPassword + ", adminName="
			+ adminName + ", amail=" + amail + ", acontact=" + acontact + ", rnum=" + rnum + ", regDate=" + regDate
			+ ", updateDate=" + updateDate + ", right=" + right + ", result=" + result + ", account=" + account + "]";
}



   
   

}