package com.campusblog.entity;

import javax.persistence.*;
import java.sql.Date;
import java.sql.Timestamp;

/**
 * Created by Administrator on 2016/12/12.
 */
@Entity
@Table(name = "user_t", schema = "campusblog",uniqueConstraints = {@UniqueConstraint(columnNames="fullname")})
public class User{

    private int uId;
    private String name;
    private String fullname;
    private String sex;
    private Byte age;
    private Date birth;
    private String address;
    private String school;
    private String description;
    private String tel;
    private String url;
    private Integer love;
    private Timestamp createTime;
    private Timestamp updateTime;
    private String friendId;
    private Integer focus;
    private Integer popmoods;
    private String pic;
    private String password;
    private char role;

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public char getRole() {
        return role;
    }

    public void setRole(char role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "User{" +
                "uId=" + uId +
                ", name='" + name + '\'' +
                ", fullname='" + fullname + '\'' +
                ", sex='" + sex + '\'' +
                ", age=" + age +
                ", birth=" + birth +
                ", address='" + address + '\'' +
                ", school='" + school + '\'' +
                ", description='" + description + '\'' +
                ", tel='" + tel + '\'' +
                ", url='" + url + '\'' +
                ", love=" + love +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                ", friendId='" + friendId + '\'' +
                ", focus=" + focus +
                ", popmoods=" + popmoods +
                ", pic='" + pic + '\'' +
                '}';
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
    @Column(name = "name", nullable = true, length = 30)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "fullname", nullable = true, length = 30)
    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    @Basic
    @Column(name = "sex", nullable = true, length = 1)
    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    @Basic
    @Column(name = "age", nullable = true)
    public Byte getAge() {
        return age;
    }

    public void setAge(Byte age) {
        this.age = age;
    }

    @Basic
    @Column(name = "birth", nullable = true)
    public Date getBirth() {
        return birth;
    }

    public void setBirth(Date birth) {
        this.birth = birth;
    }

    @Basic
    @Column(name = "address", nullable = true, length = 50)
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Basic
    @Column(name = "school", nullable = true, length = 30)
    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public String getDescription() {
        return description;
    }

    public void setdescription(String description) {
        this.description = description;
    }

    @Basic
    @Column(name = "tel", nullable = true, length = 11)
    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    @Basic
    @Column(name = "url", nullable = true, length = 50)
    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Basic
    @Column(name = "love", nullable = true)
    public Integer getLove() {
        return love;
    }

    public void setLove(Integer love) {
        this.love = love;
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
    @Column(name = "friendId", nullable = true, length = 21001)
    public String getFriendId() {
        return friendId;
    }

    public void setFriendId(String friendId) {
        this.friendId = friendId;
    }

    @Basic
    @Column(name = "focus", nullable = true)
    public Integer getFocus() {
        return focus;
    }

    public void setFocus(Integer focus) {
        this.focus = focus;
    }

    @Basic
    @Column(name = "popmoods", nullable = true)
    public Integer getPopmoods() {
        return popmoods;
    }

    public void setPopmoods(Integer popmoods) {
        this.popmoods = popmoods;
    }

    @Basic
    @Column(name = "pic", nullable = true, length = 100)
    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        User user = (User) o;

        if (uId != user.uId) return false;
        if (name != null ? !name.equals(user.name) : user.name != null) return false;
        if (fullname != null ? !fullname.equals(user.fullname) : user.fullname != null) return false;
        if (sex != null ? !sex.equals(user.sex) : user.sex != null) return false;
        if (age != null ? !age.equals(user.age) : user.age != null) return false;
        if (birth != null ? !birth.equals(user.birth) : user.birth != null) return false;
        if (address != null ? !address.equals(user.address) : user.address != null) return false;
        if (school != null ? !school.equals(user.school) : user.school != null) return false;
        if (description != null ? !description.equals(user.description) : user.description != null) return false;
        if (tel != null ? !tel.equals(user.tel) : user.tel != null) return false;
        if (url != null ? !url.equals(user.url) : user.url != null) return false;
        if (love != null ? !love.equals(user.love) : user.love != null) return false;
        if (createTime != null ? !createTime.equals(user.createTime) : user.createTime != null) return false;
        if (updateTime != null ? !updateTime.equals(user.updateTime) : user.updateTime != null) return false;
        if (friendId != null ? !friendId.equals(user.friendId) : user.friendId != null) return false;
        if (focus != null ? !focus.equals(user.focus) : user.focus != null) return false;
        if (popmoods != null ? !popmoods.equals(user.popmoods) : user.popmoods != null) return false;
        if (pic != null ? !pic.equals(user.pic) : user.pic != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = uId;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (fullname != null ? fullname.hashCode() : 0);
        result = 31 * result + (sex != null ? sex.hashCode() : 0);
        result = 31 * result + (age != null ? age.hashCode() : 0);
        result = 31 * result + (birth != null ? birth.hashCode() : 0);
        result = 31 * result + (address != null ? address.hashCode() : 0);
        result = 31 * result + (school != null ? school.hashCode() : 0);
        result = 31 * result + (description != null ? description.hashCode() : 0);
        result = 31 * result + (tel != null ? tel.hashCode() : 0);
        result = 31 * result + (url != null ? url.hashCode() : 0);
        result = 31 * result + (love != null ? love.hashCode() : 0);
        result = 31 * result + (createTime != null ? createTime.hashCode() : 0);
        result = 31 * result + (updateTime != null ? updateTime.hashCode() : 0);
        result = 31 * result + (friendId != null ? friendId.hashCode() : 0);
        result = 31 * result + (focus != null ? focus.hashCode() : 0);
        result = 31 * result + (popmoods != null ? popmoods.hashCode() : 0);
        result = 31 * result + (pic != null ? pic.hashCode() : 0);
        return result;
    }
}
