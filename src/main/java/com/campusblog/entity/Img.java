package com.campusblog.entity;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by Administrator on 2016/12/21.
 */
@Entity
@Table(name = "img_t", schema = "campusblog")
public class Img {
    @Override
    public String toString() {
        return "Img{" +
                "id=" + id +
                ", url='" + url + '\'' +
                ", ablum=" + ablum +
                ", view=" + view +
                ", approve=" + approve +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                ", uId=" + uId +
                ", isdef=" + isdef +
                '}';
    }
    @ManyToOne
    @JoinColumn(name = "id")
    public Album getAblum() {
        return ablum;
    }

    public void setAblum(Album ablum) {
        this.ablum = ablum;
    }
    private int id;
    private String url;
    private Album ablum;
    private Integer view;
    private Integer approve;
    private Timestamp createTime;
    private Timestamp updateTime;
    private Integer uId;
    private Byte isdef;

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "Id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "url", nullable = true, length = 80)
    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }


    @Basic
    @Column(name = "view", nullable = true)
    public Integer getView() {
        return view;
    }

    public void setView(Integer view) {
        this.view = view;
    }

    @Basic
    @Column(name = "approve", nullable = true)
    public Integer getApprove() {
        return approve;
    }

    public void setApprove(Integer approve) {
        this.approve = approve;
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

    @Basic
    @Column(name = "uId", nullable = true)
    public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }

    @Basic
    @Column(name = "isdef", nullable = true)
    public Byte getIsdef() {
        return isdef;
    }

    public void setIsdef(Byte isdef) {
        this.isdef = isdef;
    }


}
