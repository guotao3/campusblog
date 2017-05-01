package com.campusblog.entity;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by hasee on 2017/5/1.
 */
@Entity
@Table(name = "article_t", schema = "campusblog", catalog = "")
public class Article {
    private int articleId;
    private String titile;
    private String content;
    private Integer view;
    private Integer approve;
    private String limit;
    private Byte permission;
    private String type;
    private Timestamp createTime;
    private Timestamp updateTime;
    private Integer uId;
    private String access;
    private String impose;
    private String pic;

    @Id
    @Column(name = "articleId")
    public int getArticleId() {
        return articleId;
    }

    public void setArticleId(int articleId) {
        this.articleId = articleId;
    }

    @Basic
    @Column(name = "titile")
    public String getTitile() {
        return titile;
    }

    public void setTitile(String titile) {
        this.titile = titile;
    }

    @Basic
    @Column(name = "content")
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Basic
    @Column(name = "view")
    public Integer getView() {
        return view;
    }

    public void setView(Integer view) {
        this.view = view;
    }

    @Basic
    @Column(name = "approve")
    public Integer getApprove() {
        return approve;
    }

    public void setApprove(Integer approve) {
        this.approve = approve;
    }

    @Basic
    @Column(name = "limit")
    public String getLimit() {
        return limit;
    }

    public void setLimit(String limit) {
        this.limit = limit;
    }

    @Basic
    @Column(name = "permission")
    public Byte getPermission() {
        return permission;
    }

    public void setPermission(Byte permission) {
        this.permission = permission;
    }

    @Basic
    @Column(name = "type")
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Basic
    @Column(name = "create_time")
    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    @Basic
    @Column(name = "update_time")
    public Timestamp getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Timestamp updateTime) {
        this.updateTime = updateTime;
    }

    @Basic
    @Column(name = "uId")
    public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }

    @Basic
    @Column(name = "access")
    public String getAccess() {
        return access;
    }

    public void setAccess(String access) {
        this.access = access;
    }

    @Basic
    @Column(name = "impose")
    public String getImpose() {
        return impose;
    }

    public void setImpose(String impose) {
        this.impose = impose;
    }

    @Basic
    @Column(name = "pic")
    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Article article = (Article) o;

        if (articleId != article.articleId) return false;
        if (titile != null ? !titile.equals(article.titile) : article.titile != null) return false;
        if (content != null ? !content.equals(article.content) : article.content != null) return false;
        if (view != null ? !view.equals(article.view) : article.view != null) return false;
        if (approve != null ? !approve.equals(article.approve) : article.approve != null) return false;
        if (limit != null ? !limit.equals(article.limit) : article.limit != null) return false;
        if (permission != null ? !permission.equals(article.permission) : article.permission != null) return false;
        if (type != null ? !type.equals(article.type) : article.type != null) return false;
        if (createTime != null ? !createTime.equals(article.createTime) : article.createTime != null) return false;
        if (updateTime != null ? !updateTime.equals(article.updateTime) : article.updateTime != null) return false;
        if (uId != null ? !uId.equals(article.uId) : article.uId != null) return false;
        if (access != null ? !access.equals(article.access) : article.access != null) return false;
        if (impose != null ? !impose.equals(article.impose) : article.impose != null) return false;
        if (pic != null ? !pic.equals(article.pic) : article.pic != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = articleId;
        result = 31 * result + (titile != null ? titile.hashCode() : 0);
        result = 31 * result + (content != null ? content.hashCode() : 0);
        result = 31 * result + (view != null ? view.hashCode() : 0);
        result = 31 * result + (approve != null ? approve.hashCode() : 0);
        result = 31 * result + (limit != null ? limit.hashCode() : 0);
        result = 31 * result + (permission != null ? permission.hashCode() : 0);
        result = 31 * result + (type != null ? type.hashCode() : 0);
        result = 31 * result + (createTime != null ? createTime.hashCode() : 0);
        result = 31 * result + (updateTime != null ? updateTime.hashCode() : 0);
        result = 31 * result + (uId != null ? uId.hashCode() : 0);
        result = 31 * result + (access != null ? access.hashCode() : 0);
        result = 31 * result + (impose != null ? impose.hashCode() : 0);
        result = 31 * result + (pic != null ? pic.hashCode() : 0);
        return result;
    }
}
