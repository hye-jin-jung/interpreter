package myBlog.myBlog;

import java.sql.Date;

public class BbomGeVO {
   
   private int num;
   private String writerCode;
   private String showCode;
   private String title;
   private String contents;
   private String registDate;
   private int hit;
   private String thumb;
   
   public BbomGeVO() {
      super();
      // TODO Auto-generated constructor stub
   }
   
   
   public BbomGeVO(int num, String writerCode, String showCode, String title, String contents, String registDate,
         int hit, String thumb) {
      super();
      this.num = num;
      this.writerCode = writerCode;
      this.showCode = showCode;
      this.title = title;
      this.contents = contents;
      this.registDate = registDate;
      this.hit = hit;
      this.thumb = thumb;
   }

   
   public String getShowCode() {
      return showCode;
   }
   public void setShowCode(String showCode) {
      this.showCode = showCode;
   }
   public String getTitle() {
      return title;
   }
   public void setTitle(String title) {
      this.title = title;
   }
   public String getContents() {
      return contents;
   }
   public void setContents(String contents) {
      this.contents = contents;
   }
   public String getRegistDate() {
      return registDate;
   }
   public void setRegistDate(String registDate) {
      this.registDate = registDate;
   }
   public int getHit() {
      return hit;
   }
   public void setHit(int hit) {
      this.hit = hit;
   }
   public String getThumb() {
      return thumb;
   }
   public void setThumb(String thumb) {
      this.thumb = thumb;
   }


   public int getNum() {
      return num;
   }


   public void setNum(int num) {
      this.num = num;
   }


   public String getWriterCode() {
      return writerCode;
   }


   public void setWriterCode(String writerCode) {
      this.writerCode = writerCode;
   }
   
   
   
   
}