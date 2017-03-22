package com.campusblog.entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * Created by Administrator on 2017/3/22.
 */
@Entity
public class Link {
    private int companyregId;
    private String campanyname;
    private String logo;
    private String email;

    @Id
    @Column(name = "companyregId", nullable = false)
    public int getCompanyregId() {
        return companyregId;
    }

    public void setCompanyregId(int companyregId) {
        this.companyregId = companyregId;
    }

    @Basic
    @Column(name = "campanyname", nullable = false, length = 50)
    public String getCampanyname() {
        return campanyname;
    }

    public void setCampanyname(String campanyname) {
        this.campanyname = campanyname;
    }

    @Basic
    @Column(name = "logo", nullable = true, length = 50)
    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    @Basic
    @Column(name = "email", nullable = true, length = 30)
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Link link = (Link) o;

        if (companyregId != link.companyregId) return false;
        if (campanyname != null ? !campanyname.equals(link.campanyname) : link.campanyname != null) return false;
        if (logo != null ? !logo.equals(link.logo) : link.logo != null) return false;
        if (email != null ? !email.equals(link.email) : link.email != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = companyregId;
        result = 31 * result + (campanyname != null ? campanyname.hashCode() : 0);
        result = 31 * result + (logo != null ? logo.hashCode() : 0);
        result = 31 * result + (email != null ? email.hashCode() : 0);
        return result;
    }
}
