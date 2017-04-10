package com.campusblog.entity;

import javax.persistence.*;

/**
 * Created by Administrator on 2017/4/10.
 */
@Entity
@Table(name = "code_type", schema = "campusblog", catalog = "")
public class CodeType {
    private int code;
    private String type;
    private Integer uId;

    @Id
    @Column(name = "code", nullable = false)
    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    @Basic
    @Column(name = "type", nullable = false, length = 12)
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Basic
    @Column(name = "uId", nullable = false, length = 10)
    public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        CodeType codeType = (CodeType) o;


        if (type != null ? !type.equals(codeType.type) : codeType.type != null) return false;
        if (uId != null ? !uId.equals(codeType.uId) : codeType.uId != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = code;
        result = 31 * result + (type != null ? type.hashCode() : 0);
        result = 31 * result + (uId != null ? uId.hashCode() : 0);
        return result;
    }
}
