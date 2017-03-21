package com.campusblog.entity;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by Administrator on 2016/12/26.
 */
@Entity
@Table(name = "album_t", schema = "campusblog", catalog = "")
public class Album {
    @Override
    public String toString() {
        return "Album{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", num=" + num +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                ", uid=" + uid +
                ", lock=" + lock +
                ", def='" + def + '\'' +
                '}';
    }

    private int id;
    private String name;
    private Integer num;
    private Timestamp createTime;
    private Timestamp updateTime;
    private Integer uid;
    private Byte lock;
    private String def;

    public String getDef() {
        return def;
    }

    public void setDef(String def) {
        this.def = def;
    }

    @Id
    @Column(name = "Id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "name", nullable = true, length = 20)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "num", nullable = true)
    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
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
    @Column(name = "uid", nullable = true)
    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    @Basic
    @Column(name = "lock", nullable = true)
    public Byte getLock() {
        return lock;
    }

    public void setLock(Byte lock) {
        this.lock = lock;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Album album = (Album) o;

        if (id != album.id) return false;
        if (name != null ? !name.equals(album.name) : album.name != null) return false;
        if (num != null ? !num.equals(album.num) : album.num != null) return false;
        if (createTime != null ? !createTime.equals(album.createTime) : album.createTime != null) return false;
        if (updateTime != null ? !updateTime.equals(album.updateTime) : album.updateTime != null) return false;
        if (uid != null ? !uid.equals(album.uid) : album.uid != null) return false;
        if (lock != null ? !lock.equals(album.lock) : album.lock != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (num != null ? num.hashCode() : 0);
        result = 31 * result + (createTime != null ? createTime.hashCode() : 0);
        result = 31 * result + (updateTime != null ? updateTime.hashCode() : 0);
        result = 31 * result + (uid != null ? uid.hashCode() : 0);
        result = 31 * result + (lock != null ? lock.hashCode() : 0);
        return result;
    }
}
