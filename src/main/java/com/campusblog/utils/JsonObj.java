package com.campusblog.utils;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * Created by Administrator on 2016/12/15.
 */
public class JsonObj {
    @JsonProperty
    private boolean Flag;    //删除是否成功

    @JsonProperty
    public boolean isFlag() {
        return Flag;
    }
    @JsonProperty
    public void setFlag(boolean flag) {
        Flag = flag;
    }

    private String url;

    public String getUrlUrl() {
        return urlUrl;
    }

    public void setUrlUrl(String urlUrl) {
        this.urlUrl = urlUrl;
    }

    private String urlUrl;
    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
