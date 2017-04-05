package com.campusblog.utils;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;
import org.apache.commons.io.FilenameUtils;
import org.springframework.web.multipart.MultipartFile;
import sun.misc.BASE64Decoder;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;



public class Upload {
    public static JsonObj upload(MultipartFile pic) throws IOException {
        JsonObj jsonObj = null;
        String url = "";
        String imgUrl = "";
        if (pic.getSize() == 0) {
            System.out.println("没有上传图片");
        } else {
            System.out.println("有图片上传");
            String filename = pic.getOriginalFilename();
            //图片生成策略 yyyyMMddHHmmssSSS+三位随机数+extension
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmssSSS");
            String format = simpleDateFormat.format(new Date());
            for (int i = 0; i < 3; i++) {
                Random random = new Random();
                format += random.nextInt(10);  //1-9的随机数
            }

            byte[] bytes = pic.getBytes();
            Client client = new Client();
            imgUrl = format + filename;    //数据库保存使用的图片名
            System.out.println(imgUrl);
            //服务器上传地址
            url = "http://localhost:8089/img-web/upload/" + imgUrl;  //上传到其他服务器要用的url
            //通过client来获取一个resource对象
            WebResource resource = client.resource(url);
            //put发送
            resource.put(String.class, bytes);

            jsonObj = new JsonObj();
            System.out.println(url);
            jsonObj.setUrl(url);
            jsonObj.setUrlUrl(imgUrl);
        }
        return jsonObj;
    }

    public static  UeditorJson upload2(MultipartFile pic){
        UeditorJson jsonObj = null;
        String url = "";
        String imgUrl = "";
        long size=pic.getSize();
        if (pic.getSize() == 0) {
            System.out.println("没有上传图片");
        } else {
            System.out.println("有图片上传");
            String filename = pic.getOriginalFilename();
            //图片生成策略 yyyyMMddHHmmssSSS+三位随机数+extension
            String extension = FilenameUtils.getExtension(filename);
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmssSSS");
            String format = simpleDateFormat.format(new Date());
            for (int i = 0; i < 3; i++) {
                Random random = new Random();
                format += random.nextInt(10);  //1-9的随机数
            }
            try {
                byte[] bytes = pic.getBytes();
                Client client = new Client();
                imgUrl = format + filename;    //数据库保存使用的图片名
                System.out.println(imgUrl);
                //服务器上传地址
                url = "http://localhost:8089/img-web/upload/" + imgUrl;  //上传到其他服务器要用的url
                //通过client来获取一个resource对象
                WebResource resource = client.resource(url);
                //put发送
                resource.put(String.class, bytes);

                jsonObj = new UeditorJson();
                System.out.println(url);
                jsonObj.setState("SUCCESS");
                jsonObj.setUrl(url);//远程访问url
                jsonObj.setOrginal(filename);//原始名字
                jsonObj.setSize(size+"");
                jsonObj.setUrl(url);
                jsonObj.setTitle(imgUrl);
                jsonObj.setType(extension);
            }catch (IOException e){

                e.printStackTrace();
            }
        }
        return jsonObj;
    }

    public static JsonObj upload(String gt){
        JsonObj jsonObj = new JsonObj();
        Map<String,String> map = new HashMap<>();
        String loadpath="/apache-tomcat-8.0.35-windows-x64(2)/apache-tomcat-8.0.35-2/webapps/img-web/upload";
        SimpleDateFormat df =new SimpleDateFormat("yyyyMMddHHmmssSSS");
        Date date = new Date();
        String newfileName ="gt"+df.format(date)+".jpg";
        File newfile = new File(loadpath,newfileName);
        jsonObj.setUrl(newfileName); //文件名
        try {
            newfile.createNewFile();
            byte[] buffer = new BASE64Decoder().decodeBuffer(gt);
            FileOutputStream out = new FileOutputStream(newfile);
            out.write(buffer);
            out.close();
            jsonObj.setFlag(true);
        } catch (IOException e) {
            e.printStackTrace();
            jsonObj.setFlag(false);
        }
      return jsonObj;
    }
}
