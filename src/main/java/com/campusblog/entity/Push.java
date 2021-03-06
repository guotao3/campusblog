package com.campusblog.entity;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by Administrator on 2017/4/25.
 */
@Entity
@Table(name = "push_t", schema = "campusblog", catalog = "")
public class Push {
    private String titile;
    private int mid;
    private int uId;
    private String content;
    private Timestamp createTime;
    private Timestamp updateTime;

    @Basic
    @Column(name = "titile")
    public String getTitile() {
        return titile;
    }

    public void setTitile(String titile) {
        this.titile = titile;
    }

    @Basic
    @Column(name = "mid")
    public int getMid() {
        return mid;
    }

    public void setMid(int mid) {
        this.mid = mid;
    }

    @Id
    @Column(name = "uId")
    public int getuId() {
        return uId;
    }

    public void setuId(int uId) {
        this.uId = uId;
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Push push = (Push) o;

        if (mid != push.mid) return false;
        if (uId != push.uId) return false;
        if (titile != null ? !titile.equals(push.titile) : push.titile != null) return false;
        if (content != null ? !content.equals(push.content) : push.content != null) return false;
        if (createTime != null ? !createTime.equals(push.createTime) : push.createTime != null) return false;
        if (updateTime != null ? !updateTime.equals(push.updateTime) : push.updateTime != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = titile != null ? titile.hashCode() : 0;
        result = 31 * result + mid;
        result = 31 * result + uId;
        result = 31 * result + (content != null ? content.hashCode() : 0);
        result = 31 * result + (createTime != null ? createTime.hashCode() : 0);
        result = 31 * result + (updateTime != null ? updateTime.hashCode() : 0);
        return result;
    }
}
