package join.member;

public class MemberAdminVo {
   private int usernum;
   private String usercode;
   private String email;
   private int warningCount;
   private String regiDate;
   private int cfCount;
   private int loveCount;
   private int warnningCount;
   
   public int getCfCount() {
      return cfCount;
   }
   public void setCfCount(int cfCount) {
      this.cfCount = cfCount;
   }
   public int getLoveCount() {
      return loveCount;
   }
   public void setLoveCount(int loveCount) {
      this.loveCount = loveCount;
   }
   public int getWarnningCount() {
      return warnningCount;
   }
   public void setWarnningCount(int warnningCount) {
      this.warnningCount = warnningCount;
   }
   public MemberAdminVo() {
   }
   public int getUsernum() {
      return usernum;
   }
   public String getUsercode() {
      return usercode;
   }
   public String getEmail() {
      return email;
   }
   public int getWarningCount() {
      return warningCount;
   }
   public String getRegiDate() {
      return regiDate;
   }
   public void setUsernum(int usernum) {
      this.usernum = usernum;
   }
   public void setUsercode(String usercode) {
      this.usercode = usercode;
   }
   public void setEmail(String email) {
      this.email = email;
   }
   public void setWarningCount(int warningCount) {
      this.warningCount = warningCount;
   }
   public void setRegiDate(String regiDate) {
      this.regiDate = regiDate;
   }
   
   
   

}