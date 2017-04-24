package com.campusblog.entity;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by hasee on 2017/4/17.
 */
@Entity
@Table(name = "album_t", schema = "campusblog", catalog = "")
public class Album {
    private int id;
    private String albname;
    private Integer num;
    private Timestamp createTime;
    private Timestamp updateTime;
    private Integer uid;
    private Byte alblock;
    private String def;

    @Id
    @Column(name = "Id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "albname")
    public String getAlbname() {
        return albname;
    }

    public void setAlbname(String albname) {
        this.albname = albname;
    }

    @Basic
    @Column(name = "num")
    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
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
    @Column(name = "uid")
    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    @Basic
    @Column(name = "alblock")
    public Byte getAlblock() {
        return alblock;
    }

    public void setAlblock(Byte alblock) {
        this.alblock = alblock;
    }

    @Basic
    @Column(name = "def")
    public String getDef() {
        return def;
    }

    public void setDef(String def) {
        this.def = def;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Album album = (Album) o;

        if (id != album.id) return false;
        if (albname != null ? !albname.equals(album.albname) : album.albname != null) return false;
        if (num != null ? !num.equals(album.num) : album.num != null) return false;
        if (createTime != null ? !createTime.equals(album.createTime) : album.createTime != null) return false;
        if (updateTime != null ? !updateTime.equals(album.updateTime) : album.updateTime != null) return false;
        if (uid != null ? !uid.equals(album.uid) : album.uid != null) return false;
        if (alblock != null ? !alblock.equals(album.alblock) : album.alblock != null) return false;
        if (def != null ? !def.equals(album.def) : album.def != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (albname != null ? albname.hashCode() : 0);
        result = 31 * result + (num != null ? num.hashCode() : 0);
        result = 31 * result + (createTime != null ? createTime.hashCode() : 0);
        result = 31 * result + (updateTime != null ? updateTime.hashCode() : 0);
        result = 31 * result + (uid != null ? uid.hashCode() : 0);
        result = 31 * result + (alblock != null ? alblock.hashCode() : 0);
        result = 31 * result + (def != null ? def.hashCode() : 0);
        return result;
    }
}
