package com.campusblog.entity;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by Administrator on 2017/3/20.
 */
@Entity
@Table(name = "message_t", schema = "campusblog", catalog = "")
public class Message {
    private int mid;
    private int uId;
    private String mymessage;
    private String blacklist;
    private Timestamp creatTime;
    private Timestamp updateTime;

    @Basic
    @Column(name = "mid", nullable = false)
    public int getMid() {
        return mid;
    }

    public void setMid(int mid) {
        this.mid = mid;
    }

    @Id
    @Column(name = "uId", nullable = false)
    public int getuId() {
        return uId;
    }

    public void setuId(int uId) {
        this.uId = uId;
    }

    @Basic
    @Column(name = "mymessage", nullable = true, length = 30)
    public String getMymessage() {
        return mymessage;
    }

    public void setMymessage(String mymessage) {
        this.mymessage = mymessage;
    }

    @Basic
    @Column(name = "blacklist", nullable = true, length = -1)
    public String getBlacklist() {
        return blacklist;
    }

    public void setBlacklist(String blacklist) {
        this.blacklist = blacklist;
    }

    @Basic
    @Column(name = "creat_time", nullable = true)
    public Timestamp getCreatTime() {
        return creatTime;
    }

    public void setCreatTime(Timestamp creatTime) {
        this.creatTime = creatTime;
    }

    @Basic
    @Column(name = "update_time", nullable = true)
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

        Message message = (Message) o;

        if (mid != message.mid) return false;
        if (uId != message.uId) return false;
        if (mymessage != null ? !mymessage.equals(message.mymessage) : message.mymessage != null) return false;
        if (blacklist != null ? !blacklist.equals(message.blacklist) : message.blacklist != null) return false;
        if (creatTime != null ? !creatTime.equals(message.creatTime) : message.creatTime != null) return false;
        if (updateTime != null ? !updateTime.equals(message.updateTime) : message.updateTime != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = mid;
        result = 31 * result + uId;
        result = 31 * result + (mymessage != null ? mymessage.hashCode() : 0);
        result = 31 * result + (blacklist != null ? blacklist.hashCode() : 0);
        result = 31 * result + (creatTime != null ? creatTime.hashCode() : 0);
        result = 31 * result + (updateTime != null ? updateTime.hashCode() : 0);
        return result;
    }
}
