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
import java.util.Map;

/**
 * Created by Administrator on 2017/4/28.
 */
@Controller
@RequestMapping("/back")
public class SqlController {
    @RequestMapping("/sqlbackmanage")
    String backlist(Map map){
    //读取文件下的所有文件名即可
        List<String> fileNamelist = GetFoldFileNames.getFileName();
        List<SqlBackVo> sqllist = new ArrayList<>();
        for (String voname:fileNamelist
             ) {
            SqlBackVo backVo = new SqlBackVo();
            String[] arry = voname.split("&&");
                String[] v = arry[0].split("=");
            backVo.setuId(Integer.parseInt(v[1]));
            String[] v2 = arry[1].split("=");
            backVo.setCommit(v2[1]);
            String[] v3 = arry[2].split("=");
            backVo.setOperateDate(v3[1]);
            String[] v4 = arry[3].split("=");
            backVo.setFileName(v4[1]);
            backVo.setVoname(voname);
            sqllist.add(backVo);
        }
        map.put("sqllist",sqllist);

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

    @ResponseBody
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

    @ResponseBody
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
