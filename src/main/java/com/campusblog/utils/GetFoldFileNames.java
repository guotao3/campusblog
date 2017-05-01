package com.campusblog.utils;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/4/28.
 */
public class GetFoldFileNames {
    public static void main(String[] args) {
        getFileName();
    }

    public static List<String> getFileName() {
        String path = "D:/github/campusblog/src/main/java/com/campusblog/controller/back/backup"; // 路径
        List<String> filenamelist= new  ArrayList();
        File f = new File(path);
        if (!f.exists()) {
            System.out.println(path + " not exists");
            return filenamelist;
        }

        File fa[] = f.listFiles();
        for (int i = 0; i < fa.length; i++) {
            File fs = fa[i];
            System.out.println(fs.getName());
            filenamelist.add(fs.getName());
            }
      return filenamelist;
    }

    public static boolean deleteFile(String fileName) {
        String filepath ="D:/github/campusblog/src/main/java/com/campusblog/controller/back/backup/";
        String fileNameq = filepath+fileName;
        File file = new File(fileNameq);
        // 如果文件路径所对应的文件存在，并且是一个文件，则直接删除
        if (file.exists() && file.isFile()) {
            if (file.delete()) {
                System.out.println("删除单个文件" + fileNameq + "成功！");
                return true;
            } else {
                System.out.println("删除单个文件" + fileNameq + "失败！");
                return false;
            }
        } else {
            System.out.println("删除单个文件失败：" + fileNameq + "不存在！");
            return false;
        }
    }

}
