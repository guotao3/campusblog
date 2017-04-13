package com.campusblog.entity;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by Administrator on 2017/4/13.
 */
@Entity
@Table(name = "articlenote_t", schema = "campusblog", catalog = "")
public class Articlenote {
    private int articleId;
    private String content;
    private int uId;
    private Timestamp createTime;
    private Timestamp updateTime;
    private int id;
    private Integer toUId;

    public void setuId(Integer uId) {
        this.uId = uId;
    }

    @Basic
    @Column(name = "uId", nullable = true)
    public int getuId() {
        return uId;
    }

    public void setuId(int uId) {
        this.uId = uId;
    }

    @Basic
    @Column(name = "articleId", nullable = false)
    public int getArticleId() {
        return articleId;
    }

    public void setArticleId(int articleId) {
        this.articleId = articleId;
    }

    @Basic
    @Column(name = "content", nullable = true, length = 255)
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Basic
    @Column(name = "create_time", nullable = true)
    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    @Basic
    @Column(name = "update_time", nullable = true)
    public Timestamp getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Timestamp updateTime) {
        this.updateTime = updateTime;
    }

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Articlenote that = (Articlenote) o;

        if (articleId != that.articleId) return false;
        if (id != that.id) return false;
        if (content != null ? !content.equals(that.content) : that.content != null) return false;
        if (createTime != null ? !createTime.equals(that.createTime) : that.createTime != null) return false;
        if (updateTime != null ? !updateTime.equals(that.updateTime) : that.updateTime != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = articleId;
        result = 31 * result + (content != null ? content.hashCode() : 0);
        result = 31 * result + (createTime != null ? createTime.hashCode() : 0);
        result = 31 * result + (updateTime != null ? updateTime.hashCode() : 0);
        result = 31 * result + id;
        return result;
    }

    @Basic
    @Column(name = "to_uId", nullable = true)
    public Integer getToUId() {
        return toUId;
    }

    public void setToUId(Integer toUId) {
        this.toUId = toUId;
    }
}
