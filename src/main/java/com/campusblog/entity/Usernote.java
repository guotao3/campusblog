package com.campusblog.entity;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by hasee on 2017/4/16.
 */
@Entity
@Table(name = "usernote_t", schema = "campusblog", catalog = "")
public class Usernote {
    private Integer hostuid;
    private int uId;
    private String content;
    private Timestamp createTime;
    private Timestamp updateTime;
    private Integer toUId;
    private int id;
    private String flag;

    @Basic
    @Column(name = "hostuid")
    public Integer getHostuid() {
        return hostuid;
    }

    public void setHostuid(Integer hostuid) {
        this.hostuid = hostuid;
    }

    @Basic
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

    @Basic
    @Column(name = "to_uId")
    public Integer getToUId() {
        return toUId;
    }

    public void setToUId(Integer toUId) {
        this.toUId = toUId;
    }

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "flag")
    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Usernote usernote = (Usernote) o;

        if (uId != usernote.uId) return false;
        if (id != usernote.id) return false;
        if (hostuid != null ? !hostuid.equals(usernote.hostuid) : usernote.hostuid != null) return false;
        if (content != null ? !content.equals(usernote.content) : usernote.content != null) return false;
        if (createTime != null ? !createTime.equals(usernote.createTime) : usernote.createTime != null) return false;
        if (updateTime != null ? !updateTime.equals(usernote.updateTime) : usernote.updateTime != null) return false;
        if (toUId != null ? !toUId.equals(usernote.toUId) : usernote.toUId != null) return false;
        if (flag != null ? !flag.equals(usernote.flag) : usernote.flag != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = hostuid != null ? hostuid.hashCode() : 0;
        result = 31 * result + uId;
        result = 31 * result + (content != null ? content.hashCode() : 0);
        result = 31 * result + (createTime != null ? createTime.hashCode() : 0);
        result = 31 * result + (updateTime != null ? updateTime.hashCode() : 0);
        result = 31 * result + (toUId != null ? toUId.hashCode() : 0);
        result = 31 * result + id;
        result = 31 * result + (flag != null ? flag.hashCode() : 0);
        return result;
    }
}
