package com.campusblog.controller.Vo;

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

    public List<ArticleNoteVo> getArticleNoteVochirldlist() {
        return articleNoteVochirldlist;
    }

    public void setArticleNoteVochirldlist(ArticleNoteVo articleNoteVo) {
        List<ArticleNoteVo> articleNoteVochirldlist =new ArrayList<>();
        articleNoteVochirldlist.add(articleNoteVo);
        this.articleNoteVochirldlist = articleNoteVochirldlist;
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
