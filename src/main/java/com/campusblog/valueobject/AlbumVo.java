package com.campusblog.valueobject;

import java.sql.Timestamp;

/**
 * Created by Administrator on 2016/12/28.
 */
public class AlbumVo {
    private int id;
    private String name;
    private Integer num;
    private Timestamp createTime;
    private Timestamp updateTime;
    private Integer uid;
    private Byte lock;
    private String defimg;

    public String getDefimg() {
        return defimg;
    }

    public void setDefimg(String defimg) {
        this.defimg = defimg;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public Timestamp getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Timestamp updateTime) {
        this.updateTime = updateTime;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Byte getLock() {
        return lock;
    }

    public void setLock(Byte lock) {
        this.lock = lock;
    }
}
