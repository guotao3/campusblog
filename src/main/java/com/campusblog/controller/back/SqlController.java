package com.campusblog.controller.back;

import com.campusblog.controller.Vo.SqlBackVo;
import com.campusblog.entity.User;
import com.campusblog.utils.DbUtil;
import com.campusblog.utils.GetFoldFileNames;
import com.campusblog.utils.MyJsonObj;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/4/28.
 */
@Controller
@RequestMapping("/back")
public class SqlController {
    @RequestMapping("/sqlbackmanage")
    String backlist(){
    //读取文件下的所有文件名即可
        List<String> fileNamelist = GetFoldFileNames.getFileName();
        List<SqlBackVo> sqllist = new ArrayList<>();
        List<String> list = new ArrayList();
        for (String voname:fileNamelist
             ) {
            SqlBackVo backVo = new SqlBackVo();
            System.out.println(voname);
            String[] arry = voname.split("&&");
            for (int i=0;i<arry.length;i++){
                String[] v = arry[i].split("=");
                list.add(v[1]);
            }
        }

        return "back/beifen/beifen";
    }


    @ResponseBody
    @RequestMapping("/sqlback")
    MyJsonObj back(String commit,HttpSession session){
        User admin = (User) session.getAttribute("admin");
        Integer uId = admin.getuId();
        MyJsonObj  myJsonObj = new MyJsonObj();
        if(commit!=null&&!commit.equals("")) {
            try {
                String SqlBackVoString = DbUtil.backup(uId, commit);
                myJsonObj.setFlag(true);
                myJsonObj.setMessage("备份成功");
            } catch (Exception e) {
                myJsonObj.setFlag(false);
                myJsonObj.setMessage("备份失败");
            }
        }else {
            myJsonObj.setFlag(false);
            myJsonObj.setMessage("备份信息为空，备份失败");
            return myJsonObj;
        }

        return myJsonObj;
    }

    @RequestMapping("/resetsql")
    MyJsonObj resetsql(String backupname){
        MyJsonObj  myJsonObj = new MyJsonObj();
        try {
            DbUtil.load(backupname);
            myJsonObj.setFlag(true);
            myJsonObj.setMessage("恢复备份成功");
        }catch (Exception e){
            myJsonObj.setFlag(false);
            myJsonObj.setMessage("恢复备份失败");
        }

        return myJsonObj;
    }

    @RequestMapping("/delsql")
    MyJsonObj delsql(String backupname){
        MyJsonObj  myJsonObj = new MyJsonObj();
        try {
            GetFoldFileNames.deleteFile(backupname);
            myJsonObj.setFlag(true);
            myJsonObj.setMessage("删除备份成功");
        }catch (Exception e){
            myJsonObj.setFlag(false);
            myJsonObj.setMessage("删除备份失败");
        }

        return myJsonObj;
    }
}
