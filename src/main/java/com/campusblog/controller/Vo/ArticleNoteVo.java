package com.campusblog.controller.Vo;

import com.campusblog.entity.User;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/4/13.
 */
public class ArticleNoteVo {
    List<ArticleNoteVo> articleNoteVochirldlist =new ArrayList<>();
    Integer uId;
    Integer articleId;
    String content;
    Date createtime;
    User user;
    String flag;

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<ArticleNoteVo> getArticleNoteVochirldlist() {
        return articleNoteVochirldlist;
    }

    public void setArticleNoteVochirldlist(ArticleNoteVo articleNoteVo) {
        this.articleNoteVochirldlist.add(articleNoteVo);
    }

    public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }

    public Integer getArticleId() {
        return articleId;
    }

    public void setArticleId(Integer articleId) {
        this.articleId = articleId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }
}
