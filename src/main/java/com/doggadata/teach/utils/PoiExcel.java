package com.doggadata.teach.utils;


import java.io.OutputStream;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;


import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.hssf.util.Region;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFColor;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;


/**
 * Poi生成EXCEL
 * 读取EXCEL的功能由具体业务应用实现
 * @author HYC
 *
 */
public abstract class PoiExcel {

   protected transient final Log log = LogFactory.getLog(getClass());
	protected XSSFWorkbook workBook;
	
	protected XSSFSheet sheet;

	protected DecimalFormat decimalFormat = new java.text.DecimalFormat("0.00"); 
	public PoiExcel(XSSFWorkbook workBook,XSSFSheet sheet) throws Exception{
		this.workBook = workBook;
		this.sheet = sheet;
	}
	
	public PoiExcel(XSSFWorkbook workBook) throws Exception{
      this.workBook = workBook;
   }
	public int totalPage(int total){
	   int count=total/65535;
	   int mod = total%65535;
	   if (mod != 0)
	       count++;
	   count=count==0 ? 1 : count;
	   return count;
	}
	  public void writeExcel(List<List<Map>> listSrs, String [] sheetName,List<Integer> totals,
	         List<List<String>> listCol,List<String> titles,List<String> totalTitle) throws Exception{
	      
	      
	      Cell cell = null;
	      Row row  = null;
	      XSSFCellStyle style = null;
	      int index=0;
	      for(List<Map> list:listSrs){
	         int count=list.size()>0?list.get(0).size():0;
	         int pages=totalPage(count);
	         //first step deal with head
	         sheet=workBook.createSheet(sheetName[index]);
	         for(int i=0;i<titles.size();i++){
	            row= sheet.createRow(i);
	            style = workBook.createCellStyle();
	            cell = row.createCell(0);
	            cell.setCellType(HSSFCell.CELL_TYPE_STRING);
	            String title=i==0?sheetName[index]:titles.get(i);
	            cell.setCellValue((i+1)==titles.size()?totalTitle.get(index)+":"+totals.get(index)+"单":title);
	            style.setBorderBottom((short)1); //下边框          
	            style.setBorderRight((short)1);//右边框
	            style.setAlignment(HSSFCellStyle.ALIGN_LEFT); // 水平  垂直
	            style.setVerticalAlignment(HSSFCellStyle.ALIGN_CENTER);   // 居中  垂直
	            if(i==0){
	               row.setHeightInPoints((short)40);
	               XSSFFont font=workBook.createFont();
	               font.setFontHeightInPoints((short)24);
	               font.setBoldweight(XSSFFont.BOLDWEIGHT_BOLD);
	               style.setFont(font);
	               sheet.addMergedRegion(new CellRangeAddress(i, i,i, count));
	            }
	            cell.setCellStyle(style);
	         }
	        /* if(pages<=1){
	          //second step report title
	            row = sheet.createRow(titles.size());
	            List<String> columnNames=listCol.get(index);
	            for(int j=0;j<columnNames.size();j++){
	               style = workBook.createCellStyle();
	               cell = row.createCell(j);
	               cell.setCellType(HSSFCell.CELL_TYPE_STRING);
	               cell.setCellValue(columnNames.get(j));
	               style.setBorderBottom((short)1); //下边框          
	               style.setBorderRight((short)1);//右边框
	               style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 水平  垂直
	               style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);   // 居中  垂直
	               style=setBackColor(style,IndexedColors.TURQUOISE.getIndex(),CellStyle.SOLID_FOREGROUND);
	               cell.setCellStyle(style);
	            }
	            
	            //third step loading data
	            for(int a=0;a<list.size();a++){
	               row = sheet.createRow(a+titles.size()+1);//因为多出一行表头
	               int s=0;
	               Map m=list.get(a);
	               Iterator iter=m.keySet().iterator();
	               while(iter.hasNext()){
	                  String key=iter.next().toString();
	                  String value=m.get(key)==null?"":m.get(key).toString();
	                  
	                  style = workBook.createCellStyle();
	                  cell = row.createCell(s);
	                  cell.setCellType(HSSFCell.CELL_TYPE_STRING);
	                  cell.setCellValue(value);
	                  style.setBorderBottom((short)1); //下边框          
	                  style.setBorderRight((short)1);//右边框
	                  style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 水平  垂直
	                  style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);   // 居中  垂直  
	                  //style .setWrapText(true);
	                  cell.setCellStyle(style);
	                  s++;
	               }
	              // sheet.autoSizeColumn(a+1);
	            }
	            index++;
	         }else{*/
	            
	            for(int h=0;h<pages;h++){
	               
	               //second step report title
	               int rownum=h==0?titles.size():0;
	               row = sheet.createRow(rownum);
	               List<String> columnNames=listCol.get(index);
	               for(int j=0;j<columnNames.size();j++){
	                  style = workBook.createCellStyle();
	                  cell = row.createCell(j);
	                  cell.setCellType(HSSFCell.CELL_TYPE_STRING);
	                  cell.setCellValue(columnNames.get(j));
	                  style.setBorderBottom((short)1); //下边框          
	                  style.setBorderRight((short)1);//右边框
	                  style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 水平  垂直
	                  style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);   // 居中  垂直
	                  style=setBackColor(style,IndexedColors.TURQUOISE.getIndex(),CellStyle.SOLID_FOREGROUND);
	                  cell.setCellStyle(style);
	               }
	               
	               //third step loading data
	               int titlenum=rownum+1;
	               for(int a=0;a<list.size();a++){
	                  row = sheet.createRow(titlenum+a);//因为多出一行表头
	                  int s=0;
	                  Map m=list.get(a);
	                  Iterator iter=m.keySet().iterator();
	                  while(iter.hasNext()){
	                     String key=iter.next().toString();
	                     String value=m.get(key)==null?"":m.get(key).toString();
	                     
	                     style = workBook.createCellStyle();
	                     cell = row.createCell(s);
	                     cell.setCellType(HSSFCell.CELL_TYPE_STRING);
	                     cell.setCellValue(value);
	                     style.setBorderBottom((short)1); //下边框          
	                     style.setBorderRight((short)1);//右边框
	                     style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 水平  垂直
	                     style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);   // 居中  垂直  
	                     //style .setWrapText(true);
	                     cell.setCellStyle(style);
	                     s++;
	                  }
	                 // sheet.autoSizeColumn(a+1);
	               }
	               index++;
	               
	          //  }
	         }
	         
	         
	      }
	      
	   }
	
	
	public void writeExcel(List<List<Map>> listSrs, List<String> sheetName,List<Integer> totals,
	      List<List<String>> listCol,List<String> titles,List<String> totalTitle) throws Exception{
	   
	   
	   Cell cell = null;
	   Row row  = null;
	   XSSFCellStyle style = null;
	   int index=0;
	   try{
	   for(List<Map> list:listSrs){
	      int count=list.size()>0?list.get(0).size():0;
	      int pages=totalPage(count);
	      //first step deal with head
	      sheet=workBook.createSheet(sheetName.get(index));
         for(int i=0;i<titles.size();i++){
            row= sheet.createRow(i);
            style = workBook.createCellStyle();
            cell = row.createCell(0);
            cell.setCellType(HSSFCell.CELL_TYPE_STRING);
            String title=i==0?sheetName.get(index):titles.get(i);
            if((i+1)==titles.size()){
               String v=totalTitle.get(index).replace("$total", totals.get(index).toString());
               cell.setCellValue(v);
            }else
               cell.setCellValue(title);
            style.setBorderBottom((short)1); //下边框          
            style.setBorderRight((short)1);//右边框
            style.setAlignment(HSSFCellStyle.ALIGN_LEFT); // 水平  垂直
            style.setVerticalAlignment(HSSFCellStyle.ALIGN_CENTER);   // 居中  垂直
            if(i==0){
               row.setHeightInPoints((short)40);
               XSSFFont font=workBook.createFont();
               font.setFontHeightInPoints((short)24);
               font.setBoldweight(XSSFFont.BOLDWEIGHT_BOLD);
               style.setFont(font);
               sheet.addMergedRegion(new CellRangeAddress(i, i,i, count));
            }
            cell.setCellStyle(style);
         }
	     /* if(pages<=1){
	       //second step report title
	         row = sheet.createRow(titles.size());
	         List<String> columnNames=listCol.get(index);
	         for(int j=0;j<columnNames.size();j++){
	            style = workBook.createCellStyle();
	            cell = row.createCell(j);
	            cell.setCellType(HSSFCell.CELL_TYPE_STRING);
	            cell.setCellValue(columnNames.get(j));
	            style.setBorderBottom((short)1); //下边框          
	            style.setBorderRight((short)1);//右边框
	            style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 水平  垂直
	            style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);   // 居中  垂直
	            style=setBackColor(style,IndexedColors.TURQUOISE.getIndex(),CellStyle.SOLID_FOREGROUND);
	            cell.setCellStyle(style);
	         }
	         
	         //third step loading data
	         for(int a=0;a<list.size();a++){
	            row = sheet.createRow(a+titles.size()+1);//因为多出一行表头
	            int s=0;
	            Map m=list.get(a);
	            Iterator iter=m.keySet().iterator();
	            while(iter.hasNext()){
	               String key=iter.next().toString();
	               String value=m.get(key)==null?"":m.get(key).toString();
	               
	               style = workBook.createCellStyle();
	               cell = row.createCell(s);
	               cell.setCellType(HSSFCell.CELL_TYPE_STRING);
	               cell.setCellValue(value);
	               style.setBorderBottom((short)1); //下边框          
	               style.setBorderRight((short)1);//右边框
	               style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 水平  垂直
	               style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);   // 居中  垂直  
	               //style .setWrapText(true);
	               cell.setCellStyle(style);
	               s++;
	            }
	           // sheet.autoSizeColumn(a+1);
	         }
	         index++;
	      }else{*/
	         
	         for(int h=0;h<pages;h++){
	            
	            //second step report title
	            int rownum=h==0?titles.size():0;
	            row = sheet.createRow(rownum);
	            List<String> columnNames=listCol.get(index);
	            for(int j=0;j<columnNames.size();j++){
	               style = workBook.createCellStyle();
	               cell = row.createCell(j);
	               cell.setCellType(HSSFCell.CELL_TYPE_STRING);
	               cell.setCellValue(columnNames.get(j));
	               style.setBorderBottom((short)1); //下边框          
	               style.setBorderRight((short)1);//右边框
	               style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 水平  垂直
	               style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);   // 居中  垂直
	               style=setBackColor(style,IndexedColors.TURQUOISE.getIndex(),CellStyle.SOLID_FOREGROUND);
	               cell.setCellStyle(style);
	            }
	            
	            //third step loading data
	            int titlenum=rownum+1;
	            for(int a=0;a<list.size();a++){
	               row = sheet.createRow(titlenum+a);//因为多出一行表头
	               int s=0;
	               Map m=list.get(a);
	               Iterator iter=m.keySet().iterator();
	               while(iter.hasNext()){
	                  String key=iter.next().toString();
	                  String value=m.get(key)==null?"":m.get(key).toString();
	                  
	                  style = workBook.createCellStyle();
	                  cell = row.createCell(s);
	                  cell.setCellType(HSSFCell.CELL_TYPE_STRING);
	                  cell.setCellValue(value);
	                  style.setBorderBottom((short)1); //下边框          
	                  style.setBorderRight((short)1);//右边框
	                  style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 水平  垂直
	                  style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);   // 居中  垂直  
	                  //style .setWrapText(true);
	                  cell.setCellStyle(style);
	                  s++;
	               }
	              // sheet.autoSizeColumn(a+1);
	            }
	            index++;
	            
	       //  }
	      }
	      
   	   
	   }
	   }catch(Exception e){
	      log.info("down data error:-----------------------:"+e.getMessage());
	      e.printStackTrace();
	   }
	   
	}
	
	
	public void writeExcel(List<Map> listSrs,List<String> titles, List<String> listCol,List<String> clunms) throws Exception{
	      Cell cell = null;
	      Row row  = null;
	      XSSFCellStyle style = null;
	      int index=0;

         sheet=workBook.createSheet("花名册");
         //课程名称信息
         row= sheet.createRow(0);
         style = workBook.createCellStyle();
         row.setHeightInPoints((short)20);
         XSSFFont font=workBook.createFont();
         font.setFontHeightInPoints((short)18);
         font.setBoldweight(XSSFFont.BOLDWEIGHT_BOLD);
         style.setFont(font);
         for(int i=0;i<listCol.size();i++){
            cell = row.createCell(i==0?0:i+5);
            cell.setCellType(HSSFCell.CELL_TYPE_STRING);
            cell.setCellValue(listCol.get(i));
            style.setBorderBottom((short)1); //下边框          
            style.setBorderRight((short)1);//右边框
            style.setAlignment(HSSFCellStyle.ALIGN_LEFT); // 水平  垂直
            style.setVerticalAlignment(HSSFCellStyle.ALIGN_CENTER);   // 居中  垂直
            if(i==0){
            	sheet.addMergedRegion(new CellRangeAddress(i,i,i, 5));
            }
            cell.setCellStyle(style);
         }
        //学员信息
         row = sheet.createRow(1);
         for(int j=0;j<titles.size();j++){
            style = workBook.createCellStyle();
            cell = row.createCell(j);
            cell.setCellType(HSSFCell.CELL_TYPE_STRING);
            cell.setCellValue(titles.get(j));
            style.setBorderBottom((short)1); //下边框          
            style.setBorderRight((short)1);//右边框
            style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 水平  垂直
            style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);   // 居中  垂直
            style=setBackColor(style,IndexedColors.TURQUOISE.getIndex(),CellStyle.SOLID_FOREGROUND);
            cell.setCellStyle(style);
         }
         //学员记录
         for(int a=0;a<listSrs.size();a++){
             row = sheet.createRow(2+a);//因为多出一行表头
             int s=0;
             Map m=listSrs.get(a);
             Iterator iter=m.keySet().iterator();
             for(String colum:clunms){
                String key=iter.next().toString();
                String value=m.get(colum).toString();
                
                style = workBook.createCellStyle();
                cell = row.createCell(s);
                cell.setCellType(HSSFCell.CELL_TYPE_STRING);
                cell.setCellValue(dimType(key,value));
                style.setBorderBottom((short)1); //下边框          
                style.setBorderRight((short)1);//右边框
                style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 水平  垂直
                style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);   // 居中  垂直  
                //style .setWrapText(true);
                cell.setCellStyle(style);
                s++;
             }
             /*Iterator iter=m.keySet().iterator();
             while(iter.hasNext()){
                String key=iter.next().toString();
                String value=m.get(key)==null?"":m.get(key).toString();
                
                style = workBook.createCellStyle();
                cell = row.createCell(s);
                cell.setCellType(HSSFCell.CELL_TYPE_STRING);
                cell.setCellValue(value);
                style.setBorderBottom((short)1); //下边框          
                style.setBorderRight((short)1);//右边框
                style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 水平  垂直
                style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);   // 居中  垂直  
                //style .setWrapText(true);
                cell.setCellStyle(style);
                s++;
             }*/
            // sheet.autoSizeColumn(a+1);
          }
	         
	         
	      
	      
	   }
	
	public String dimType(String type,String value){
		String result=value;
		if(type.equals("payType")){
			result=value.equals("1")?"微信支付":"现金支付";
		}
		return result;
	}
	
		private void setBoderStyle(HSSFRow row) {
			Cell cel=row.getCell(0);
			XSSFCellStyle style = workBook.createCellStyle();
			style.setBorderBottom((short)1); //下边框
			style.setBorderLeft((short)1);//左边框
			style.setBorderTop((short)1);//上边框
			style.setBorderRight((short)1);//右边框
			cel.setCellStyle(style);
		  
		 }
		
	
	
	public void printExcel(OutputStream output) throws Exception{
		this.workBook.write(output);
	}
	
	public void setHSSFSheet(XSSFSheet sheet) throws Exception{
		this.sheet = sheet;
	}
	public static XSSFCellStyle setBackColor(XSSFCellStyle style,short backColor,short fillPattern){  
      //设置背景颜色  
      //style.setFillBackgroundColor(backColor); 
      style.setFillForegroundColor(backColor);
      //设置填充模式  
      style.setFillPattern(fillPattern);  
      return style;  
      }  
 
   public static CellStyle setBackColorByCustom(XSSFCellStyle style,int red ,int green,int blue){         
      //设置前端颜色  
      style.setFillForegroundColor(new XSSFColor(new java.awt.Color(red, green, blue)));  
      //设置填充模式  
      style.setFillPattern(CellStyle.SOLID_FOREGROUND);  
      return style;  
      }  

  public Cell setCell(Cell cell,String value){
     CellStyle cellStyle=workBook.createCellStyle();
     cellStyle.setFillBackgroundColor(HSSFColor.GOLD.index);
     Font font=workBook.createFont();
     font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
     cellStyle.setFont(font);
     cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
     cellStyle.setWrapText(true);
     cell.setCellType(HSSFCell.CELL_TYPE_STRING);
     cell.setCellValue(value);
     cell.setCellStyle(cellStyle);
     return cell;
  }
	
	public void mergedRegion(int $starRow, short $startCell, int $endRow, short $endCell,String value,boolean $isCreaRow){
		Row row = null;
		if($isCreaRow){
			row = sheet.createRow($starRow);
		}else
			row = sheet.getRow($starRow);
		Cell cell = row.createCell($startCell);
		sheet.addMergedRegion(new CellRangeAddress($starRow,$startCell,$endRow,$endCell));
		cell.setCellType(HSSFCell.CELL_TYPE_STRING);
		cell.setCellValue(value == null?"":value);
	}
	
	
	/**
	 * 读取EXCEL内容
	 * @param columnAmount:int excel列数
	 */
	public abstract void readExcel(int columnAmount) throws Exception;
	
	
	
}
