package com.doggadata.teach.utils;

import java.io.InputStream;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class PoiFacade {

	public XSSFWorkbook createXSSFWorkbook() throws Exception{
		return new XSSFWorkbook();
	}

	public XSSFWorkbook createXSSFWorkbook(InputStream inputStream) throws Exception{
		return new XSSFWorkbook(inputStream);
	}
	
	public XSSFSheet createXSSFSheet(XSSFWorkbook workbook,String sheetName) throws Exception{
		if(StringUtils.isNotBlank(sheetName)){
			return workbook.createSheet(sheetName);
		}else{
			return workbook.createSheet();
		}
	}
	
	public XSSFSheet getXSSFSheet(XSSFWorkbook workbook,String sheetName) throws Exception{
		if(StringUtils.isNotBlank(sheetName)){
			return workbook.getSheet(sheetName);
		}else{
			return workbook.getSheetAt(0);
		}
	}
	
	public XSSFSheet getXSSFSheet(XSSFWorkbook workbook,int index) throws Exception{
		return workbook.getSheetAt(index);
	}
}
