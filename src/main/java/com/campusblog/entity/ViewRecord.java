package com.campusblog.entity;

import javax.persistence.*;

/**
 * Created by Administrator on 2017/4/12.
 */
@Entity
@Table(name = "view_record", schema = "campusblog", catalog = "")
public class ViewRecord {
    private Integer articleId;
    private Integer uId;
    private int id;

    @Basic
    @Column(name = "articleId", nullable = true)
    public Integer getArticleId() {
        return articleId;
    }

    public void setArticleId(Integer articleId) {
        this.articleId = articleId;
    }

    @Basic
    @Column(name = "uId", nullable = true)
    public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
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

        ViewRecord that = (ViewRecord) o;

        if (id != that.id) return false;
        if (articleId != null ? !articleId.equals(that.articleId) : that.articleId != null) return false;
        if (uId != null ? !uId.equals(that.uId) : that.uId != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = articleId != null ? articleId.hashCode() : 0;
        result = 31 * result + (uId != null ? uId.hashCode() : 0);
        result = 31 * result + id;
        return result;
    }
}
