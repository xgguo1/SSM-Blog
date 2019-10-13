package com.xgguo.bean;

import org.springframework.stereotype.Component;

@Component
public class User {
    private Integer userId;
    private String userEmail;
    private String userNick;
    private String userPwd;
    private String userPhone;
    private String userScope;
    private String userLoginDate;
    private String userIp;
    private int imageId;
    private int userStatus;

    @Override
    public String toString() {
        return "User{" +
                "userId=" + userId +
                ", userEmail='" + userEmail + '\'' +
                ", userNick='" + userNick + '\'' +
                ", userPwd='" + userPwd + '\'' +
                ", userPhone=" + userPhone +
                ", userScope='" + userScope + '\'' +
                ", userLoginDate='" + userLoginDate + '\'' +
                ", userIp='" + userIp + '\'' +
                ", imageId=" + imageId +
                ", userStatus=" + userStatus +
                '}';
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserNick() {
        return userNick;
    }

    public void setUserNick(String userNick) {
        this.userNick = userNick;
    }

    public String getUserPwd() {
        return userPwd;
    }

    public void setUserPwd(String userPwd) {
        this.userPwd = userPwd;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public String getUserScope() {
        return userScope;
    }

    public void setUserScope(String userScope) {
        this.userScope = userScope;
    }

    public String getUserLoginDate() {
        return userLoginDate;
    }

    public void setUserLoginDate(String userLoginDate) {
        this.userLoginDate = userLoginDate;
    }

    public String getUserIp() {
        return userIp;
    }

    public void setUserIp(String userIp) {
        this.userIp = userIp;
    }

    public int getImageId() {
        return imageId;
    }

    public void setImageId(int imageId) {
        this.imageId = imageId;
    }

    public int getUserStatus() {
        return userStatus;
    }

    public void setUserStatus(int userStatus) {
        this.userStatus = userStatus;
    }

}
