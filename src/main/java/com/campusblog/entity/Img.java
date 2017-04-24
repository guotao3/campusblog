package com.campusblog.entity;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by hasee on 2017/4/17.
 */
@Entity
@Table(name = "img_t", schema = "campusblog", catalog = "")
public class Img {
    private int iId;
    private String url;
    private Integer albumId;
    private Integer view;
    private Integer approve;
    private Timestamp createTime;
    private Timestamp updateTime;
    private Integer uId;
    private Byte isdef;

    @Id
    @Column(name = "iId")
    public int getiId() {
        return iId;
    }

    public void setiId(int iId) {
        this.iId = iId;
    }

    @Basic
    @Column(name = "url")
    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Basic
    @Column(name = "album_id")
    public Integer getAlbumId() {
        return albumId;
    }

    public void setAlbumId(Integer albumId) {
        this.albumId = albumId;
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
    @Column(name = "isdef")
    public Byte getIsdef() {
        return isdef;
    }

    public void setIsdef(Byte isdef) {
        this.isdef = isdef;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Img that = (Img) o;

        if (iId != that.iId) return false;
        if (url != null ? !url.equals(that.url) : that.url != null) return false;
        if (albumId != null ? !albumId.equals(that.albumId) : that.albumId != null) return false;
        if (view != null ? !view.equals(that.view) : that.view != null) return false;
        if (approve != null ? !approve.equals(that.approve) : that.approve != null) return false;
        if (createTime != null ? !createTime.equals(that.createTime) : that.createTime != null) return false;
        if (updateTime != null ? !updateTime.equals(that.updateTime) : that.updateTime != null) return false;
        if (uId != null ? !uId.equals(that.uId) : that.uId != null) return false;
        if (isdef != null ? !isdef.equals(that.isdef) : that.isdef != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = iId;
        result = 31 * result + (url != null ? url.hashCode() : 0);
        result = 31 * result + (albumId != null ? albumId.hashCode() : 0);
        result = 31 * result + (view != null ? view.hashCode() : 0);
        result = 31 * result + (approve != null ? approve.hashCode() : 0);
        result = 31 * result + (createTime != null ? createTime.hashCode() : 0);
        result = 31 * result + (updateTime != null ? updateTime.hashCode() : 0);
        result = 31 * result + (uId != null ? uId.hashCode() : 0);
        result = 31 * result + (isdef != null ? isdef.hashCode() : 0);
        return result;
    }
}
