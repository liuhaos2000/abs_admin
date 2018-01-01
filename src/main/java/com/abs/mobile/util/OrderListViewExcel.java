package com.abs.mobile.util;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFPrintSetup;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.springframework.web.servlet.view.document.AbstractExcelView;

/** 
* 生成excel视图，可用excel工具打开或者保存 
* 由ViewController的return new ModelAndView(viewExcel, model)生成 
*/  
public class OrderListViewExcel extends AbstractExcelView {     
     
    public void buildExcelDocument(Map model, HSSFWorkbook workbook,     
            HttpServletRequest request, HttpServletResponse response)     
            throws Exception {
        
        String excelName = "订单信息.xls";  
        // 设置response方式,使执行此controller时候自动出现下载页面,而非直接使用excel打开  
        response.setContentType("APPLICATION/OCTET-STREAM");  
        response.setHeader("Content-Disposition", "attachment; filename="+ URLEncoder.encode(excelName, "UTF-8"));    
        
        List<Map<String, Object>> orderList = (List) model.get("orderList");
        
        // 产生Excel表头  
        HSSFSheet sheet = workbook.createSheet("订单");
        
        // 设置打印格式
        HSSFPrintSetup printSetup = sheet.getPrintSetup();
        printSetup.setPaperSize(HSSFPrintSetup.A4_PAPERSIZE); // 纸张
        printSetup.setLandscape(true);
        sheet.setDisplayGridlines(false);
        sheet.setPrintGridlines(false);
        sheet.setMargin(HSSFSheet.TopMargin,( double ) 0.2 ); // 上边距
        sheet.setMargin(HSSFSheet.BottomMargin,( double ) 0.2 ); // 下边距
        sheet.setMargin(HSSFSheet.LeftMargin,( double ) 0.2 ); // 左边距
        sheet.setMargin(HSSFSheet.RightMargin,( double ) 0.2 ); // 右边距
        sheet.setColumnWidth(0, 1500);
        sheet.setColumnWidth(1, 4500);
        sheet.setColumnWidth(2, 4800);
        sheet.setColumnWidth(3, 4000);
        sheet.setColumnWidth(4, 2000);
        sheet.setColumnWidth(5, 3000);
        sheet.setColumnWidth(6, 4500);
        sheet.setColumnWidth(7, 2500);
        sheet.setColumnWidth(8, 2500);
        sheet.setColumnWidth(9, 2500);
        sheet.setColumnWidth(10, 2500);
        sheet.setColumnWidth(11, 3000);
        
        HSSFRow header = sheet.createRow(0); // 第0行  
        // 产生标题列  
        //header.setRowStyle(style);
        header.createCell((short) 0).setCellValue("编号");
        header.createCell((short) 1).setCellValue("订单号");
        header.createCell((short) 2).setCellValue("订单日期");
        header.createCell((short) 3).setCellValue("发货地址");
        header.createCell((short) 4).setCellValue("姓名");
        header.createCell((short) 5).setCellValue("电话");
        header.createCell((short) 6).setCellValue("商品名称");
        header.createCell((short) 7).setCellValue("型号");
        header.createCell((short) 8).setCellValue("颜色");
        header.createCell((short) 9).setCellValue("数量");
        header.createCell((short) 10).setCellValue("状态");
        header.createCell((short) 11).setCellValue("回填运单号");
        header.setHeight((short)500);
        
        HSSFCellStyle cellStyle = workbook.createCellStyle();
        cellStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        cellStyle.setFillForegroundColor(HSSFColor.GREY_50_PERCENT.index);
        cellStyle.setBorderBottom((short)2);
        cellStyle.setBorderTop((short)2);
        cellStyle.setBorderLeft((short)2);
        cellStyle.setBorderRight((short)2);
        cellStyle.setWrapText(true);
        for(int i=0;i<12;i++){
            HSSFCell cell=header.getCell(i);
            cell.setCellStyle(cellStyle);
        }
        
        // 填充数据  
        int rowNum = 1;
        String wOrderId = "";
        int intStyle=1;
        
        HSSFCellStyle cellStyle1 = workbook.createCellStyle();
        cellStyle1.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        cellStyle1.setFillForegroundColor(HSSFColor.LIGHT_GREEN.index);
        cellStyle1.setBorderBottom((short)1);
        cellStyle1.setBorderLeft((short)1);
        cellStyle1.setBorderRight((short)1);
        cellStyle1.setBorderTop((short)1);
        cellStyle1.setWrapText(true);
        
        HSSFCellStyle cellStyle2 = workbook.createCellStyle();
        cellStyle2.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        cellStyle2.setFillForegroundColor(HSSFColor.SKY_BLUE.index);
        cellStyle2.setBorderBottom((short)1);
        cellStyle2.setBorderLeft((short)1);
        cellStyle2.setBorderRight((short)1);
        cellStyle2.setBorderTop((short)1);
        cellStyle2.setWrapText(true);
        
        HSSFCellStyle cellStylew = cellStyle1;
        
        for(Map<String, Object> order:orderList){
            HSSFRow row = sheet.createRow(rowNum++); 
            row.createCell((short) 0)
            .setCellValue(String.valueOf(rowNum-1)); 
            row.createCell((short) 1)  
            .setCellValue((String)order.get("order_id"));  
            row.createCell((short) 2)  
            .setCellValue((String)order.get("order_date"));  
            row.createCell((short) 3)  
            .setCellValue((String)order.get("owner")); 
            row.createCell((short) 4)  
            .setCellValue((String)order.get("name")); 
            row.createCell((short) 5)  
            .setCellValue((String)order.get("tel")); 
            row.createCell((short) 6)  
            .setCellValue((String)order.get("item_name")); 
            row.createCell((short) 7)
            .setCellValue((String)order.get("guige_text")); 
            row.createCell((short) 8)
            .setCellValue((String)order.get("yanse_text")); 
            row.createCell((short) 9)
            .setCellValue(order.get("shuliang").toString()); 
            
            String s = "";
            if("1".equals((String)order.get("sub_status"))){
                s="未支付";
            }else if("2".equals((String)order.get("sub_status"))){
                s="已支付";
            }else if("3".equals((String)order.get("sub_status"))){
                s="已发货";
            }else if("4".equals((String)order.get("sub_status"))){
                s="已收货";
            }
            
            row.createCell((short) 10)
            .setCellValue(s); 
            row.createCell((short) 11)
            .setCellValue(""); 
            
            row.setHeight((short) 500);

            if(wOrderId.equals((String)order.get("order_id"))){
            }else{
                if(intStyle==1){
                    cellStylew=cellStyle2;
                    intStyle=2;
                }else{
                    cellStylew=cellStyle1;
                    intStyle=1;
                }
                wOrderId=(String)order.get("order_id");
            }
            //row.setRowStyle(cellStylew);
            for(int i=0;i<12;i++){
                HSSFCell cell=row.getCell(i);
                cell.setCellStyle(cellStylew);
            }
        }
  
        // 列总和计算  
//        HSSFRow row = sheet.createRow(rowNum);  
//        row.createCell((short) 0).setCellValue("TOTAL:");  
//        String formual = "SUM(D2:D" + rowNum + ")"; // D2到D[rowNum]单元格起(count数据)  
//        row.createCell((short) 3).setCellFormula(formual);  
    }     
}