package com.campusblog.entity;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by hasee on 2017/4/16.
 */
@Entity
@Table(name = "memorynote_t", schema = "campusblog", catalog = "")
public class MemorynoteTEntity {
    private Integer uId;
    private String content;
    private Timestamp createTime;
    private Timestamp updateTime;
    private String addcontent;
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
    @Column(name = "addcontent")
    public String getAddcontent() {
        return addcontent;
    }

    public void setAddcontent(String addcontent) {
        this.addcontent = addcontent;
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

        MemorynoteTEntity that = (MemorynoteTEntity) o;

        if (id != that.id) return false;
        if (uId != null ? !uId.equals(that.uId) : that.uId != null) return false;
        if (content != null ? !content.equals(that.content) : that.content != null) return false;
        if (createTime != null ? !createTime.equals(that.createTime) : that.createTime != null) return false;
        if (updateTime != null ? !updateTime.equals(that.updateTime) : that.updateTime != null) return false;
        if (addcontent != null ? !addcontent.equals(that.addcontent) : that.addcontent != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = uId != null ? uId.hashCode() : 0;
        result = 31 * result + (content != null ? content.hashCode() : 0);
        result = 31 * result + (createTime != null ? createTime.hashCode() : 0);
        result = 31 * result + (updateTime != null ? updateTime.hashCode() : 0);
        result = 31 * result + (addcontent != null ? addcontent.hashCode() : 0);
        result = 31 * result + id;
        return result;
    }
}
