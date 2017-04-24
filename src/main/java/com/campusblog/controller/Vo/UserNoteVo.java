package com.campusblog.controller.Vo;


import com.campusblog.entity.User;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by hasee on 2017/4/16.
 */
public class UserNoteVo {
    List<UserNoteVo> userNoteVochirldlist =new ArrayList<>();
    private Integer hostuid;
    private int uId;
    private String content;
    private Date createTime;
    private Date updateTime;
    private Integer toUId;
    private int id;
    private String flag;
    User user;

    public List<UserNoteVo> getUserNoteVochirldlist() {
        return userNoteVochirldlist;
    }

    public void setUserNoteVochirldlist(UserNoteVo userNoteVo) {
        this.userNoteVochirldlist.add(userNoteVo);
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Integer getHostuid() {
        return hostuid;
    }

    public void setHostuid(Integer hostuid) {
        this.hostuid = hostuid;
    }

    public int getuId() {
        return uId;
    }

    public void setuId(int uId) {
        this.uId = uId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Integer getToUId() {
        return toUId;
    }

    public void setToUId(Integer toUId) {
        this.toUId = toUId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }
}
