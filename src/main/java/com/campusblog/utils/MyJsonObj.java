package com.campusblog.utils;

/**
 * Created by Administrator on 2017/3/6.
 */
public class MyJsonObj {
    public MyJsonObj() {
    }

    private boolean Flag;
    private Integer Type;
    private String Message;

    public boolean isFlag() {
        return Flag;
    }

    public void setFlag(boolean flag) {
        Flag = flag;
    }

    public Integer getType() {
        return Type;
    }

    public void setType(Integer type) {
        Type = type;
    }

    public String getMessage() {
        return Message;
    }

    public void setMessage(String message) {
        Message = message;
    }
}
