package com.campusblog.utils;

import com.campusblog.entity.Img;
import com.campusblog.entity.User;

import java.sql.Timestamp;
import java.util.Date;

/**
 * Created by Administrator on 2016/12/26.
 */
public class Datatool {
     public static java.sql.Timestamp CreateTime(){
             Date dt = new Date();
             java.sql.Timestamp dateTime = new java.sql.Timestamp(dt.getTime());
         return dateTime;
     }

    public static java.sql.Timestamp UpdateDatime(){
        Timestamp dateTime = Datatool.CreateTime();
        return dateTime;
    }

}
