package com.campusblog.entity;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by hasee on 2017/4/16.
 */
@Entity
@Table(name = "collection_t", schema = "campusblog", catalog = "")
public class CollectionTEntity {
    private Integer uId;
    private Integer articleId;
    private Timestamp createTime;
    private int id;

    @Basic
    @Column(name = "uId")
    public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }

    @Basic
    @Column(name = "articleId")
    public Integer getArticleId() {
        return articleId;
    }

    public void setArticleId(Integer articleId) {
        this.articleId = articleId;
    }

    @Basic
    @Column(name = "create_time")
    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    @Id
    @Column(name = "id")
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

        CollectionTEntity that = (CollectionTEntity) o;

        if (id != that.id) return false;
        if (uId != null ? !uId.equals(that.uId) : that.uId != null) return false;
        if (articleId != null ? !articleId.equals(that.articleId) : that.articleId != null) return false;
        if (createTime != null ? !createTime.equals(that.createTime) : that.createTime != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = uId != null ? uId.hashCode() : 0;
        result = 31 * result + (articleId != null ? articleId.hashCode() : 0);
        result = 31 * result + (createTime != null ? createTime.hashCode() : 0);
        result = 31 * result + id;
        return result;
    }
}
