/**
  * @FileName: TestMysql.java
  * @Author 
  * @Description:
  * @Date 2017年4月13日 下午4:16:27
  * @CopyRight yazhuokj Corporation
  */
package com.campusblog.utils;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class DbUtil {
    
    public static String backup() {
    	String sqlName="";
        try {
         Runtime rt = Runtime.getRuntime();
         // 调用 调用mysql的安装目录的命令
        // D:\安装包\mysql-5.7.17-win32\mysql-5.7.17-win32\bin
         //C:\Program Files\MySQL\MySQL Server 5.7\bin
         Process child = rt
           .exec("D:/mysql-5.7.16-winx64/bin/mysqldump -h localhost -uroot -proot campusblog");
         // 设置导出编码为utf-8。这里必须是utf-8
         // 把进程执行中的控制台输出信息写入.sql文件，即生成了备份文件。注：如果不对控制台信息进行读出，则会导致进程堵塞无法运行
         InputStream in = child.getInputStream();// 控制台的输出信息作为输入流
         InputStreamReader xx = new InputStreamReader(in, "utf-8");
         // 设置输出流编码为utf-8。这里必须是utf-8，否则从流中读入的是乱码
         String inStr;
         StringBuffer sb = new StringBuffer("");
         String outStr;
         // 组合控制台输出信息字符串
         BufferedReader br = new BufferedReader(xx);
         //String sqlName="";
         while ((inStr = br.readLine()) != null) {
          sb.append(inStr + "\r\n");
         }
         outStr = sb.toString();
         
         SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmssSSS");
         //2、新的备份名称
           sqlName = simpleDateFormat.format(new Date());
           Random random = new Random();

           for (int i = 0; i < 3; i++) {
               sqlName = sqlName + random.nextInt(10);
           } 
         sqlName+=".sql";
         
         // 要用来做导入用的sql目标文件：
         FileOutputStream fout = new FileOutputStream(
        		// C:\Users\123\Desktop\ssmdemo\src\main\webapp\backup
        		//C:\Users\Administrator\Desktop\ssmdemo\src\main\webapp\backup
           "F:/github/campusblog/src/main/java/com/campusblog/controller/back/backup/"+sqlName);
         OutputStreamWriter writer = new OutputStreamWriter(fout, "utf-8");
         writer.write(outStr);
         writer.flush();
         in.close();
         xx.close();
         br.close();
         writer.close();
         fout.close();
        } catch (Exception e) {
         e.printStackTrace();
        }
        
        return sqlName;
        
       }

    public static String backup(Integer uId,String commit) {
        String sqlName="";
        String backvoName="";
        try {
            Runtime rt = Runtime.getRuntime();
            // 调用 调用mysql的安装目录的命令
            // D:\安装包\mysql-5.7.17-win32\mysql-5.7.17-win32\bin
            //C:\Program Files\MySQL\MySQL Server 5.7\bin
            Process child = rt
                    .exec("D:/mysql-5.7.16-winx64/bin/mysqldump -h localhost -uroot -proot campusblog");
            // 设置导出编码为utf-8。这里必须是utf-8
            // 把进程执行中的控制台输出信息写入.sql文件，即生成了备份文件。注：如果不对控制台信息进行读出，则会导致进程堵塞无法运行
            InputStream in = child.getInputStream();// 控制台的输出信息作为输入流
            InputStreamReader xx = new InputStreamReader(in, "utf-8");
            // 设置输出流编码为utf-8。这里必须是utf-8，否则从流中读入的是乱码
            String inStr;
            StringBuffer sb = new StringBuffer("");
            String outStr;
            // 组合控制台输出信息字符串
            BufferedReader br = new BufferedReader(xx);
            //String sqlName="";
            while ((inStr = br.readLine()) != null) {
                sb.append(inStr + "\r\n");
            }
            outStr = sb.toString();

            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
            //2、新的备份名称
            sqlName = simpleDateFormat.format(new Date());
            String opratetime = simpleDateFormat.format(new Date());
            Random random = new Random();

            for (int i = 0; i < 3; i++) {
                sqlName = sqlName + random.nextInt(10);
            }
            sqlName+=".sql";
            backvoName ="uId="+uId+"&&commit="+commit+"&&operateDate="+opratetime+"&&fileName="+sqlName;
                    // 要用来做导入用的sql目标文件：
            FileOutputStream fout = new FileOutputStream(
                    // C:\Users\123\Desktop\ssmdemo\src\main\webapp\backup
                    //C:\Users\Administrator\Desktop\ssmdemo\src\main\webapp\backup
                    "F:/github/campusblog/src/main/java/com/campusblog/controller/back/backup/"+backvoName);
            OutputStreamWriter writer = new OutputStreamWriter(fout, "utf-8");
            writer.write(outStr);
            writer.flush();
            in.close();
            xx.close();
            br.close();
            writer.close();
            fout.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return backvoName;

    }
       
    
       public static void load(String sqlName) {      
              try {      
                  String fPath = "F:/github/campusblog/src/main/java/com/campusblog/controller/back/backup/"+sqlName;
                  Runtime rt = Runtime.getRuntime();      
           
                  // 调用 mysql 的 cmd: 
                  //C://Program Files//MySQL//MySQL Server 5.7//bin//mysql.exe -uroot -proot test
                  Process child = rt.exec("D:/mysql-5.7.16-winx64/bin/mysql.exe -uroot -proot campusblog");
                  OutputStream out = child.getOutputStream();//控制台的输入信息作为输出流      
                  String inStr;      
                  StringBuffer sb = new StringBuffer("");      
                  String outStr;      
                  BufferedReader br = new BufferedReader(new InputStreamReader(      
                          new FileInputStream(fPath), "utf8"));      
                  while ((inStr = br.readLine()) != null) {      
                      sb.append(inStr + "\r\n");      
                  }      
                  outStr = sb.toString();      
           
                  OutputStreamWriter writer = new OutputStreamWriter(out, "utf8");      
                  writer.write(outStr);      
                  // 注：这里如果用缓冲方式写入文件的话，会导致中文乱码，用flush()方法则可以避免      
                  writer.flush();      
                  // 别忘记关闭输入输出流      
                  out.close();      
                  br.close();      
                  writer.close();      
                      
              } catch (Exception e) {      
                  e.printStackTrace();      
              }      
           
          } 
       
}