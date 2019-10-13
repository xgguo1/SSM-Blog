package com.xgguo.bean;

import org.springframework.stereotype.Component;

@Component
public class Article {
    private Integer articleId;
    private String articleTitle;
    private String articleContent;
    private String articleSummary;
    private int articleComment;
    private int articleView;
    private String articleAdd;
    private String articleUpdate;
    private int articleLove;
    private int articleLike;
    private int tagId;
    private int articleType;
    private int categoryId;
    private Integer userId;//外键必须Integer不能为int
    private String codeTheme;
    private int articleStatus;
    private int verifyStatus;
    private User user;

    public Integer getArticleId() {
        return articleId;
    }

    public void setArticleId(Integer articleId) {
        this.articleId = articleId;
    }

    public String getArticleTitle() {
        return articleTitle;
    }

    public void setArticleTitle(String articleTitle) {
        this.articleTitle = articleTitle;
    }

    public String getArticleContent() {
        return articleContent;
    }

    public void setArticleContent(String articleContent) {
        this.articleContent = articleContent;
    }

    public String getArticleSummary() {
        return articleSummary;
    }

    public void setArticleSummary(String articleSummary) {
        this.articleSummary = articleSummary;
    }

    public int getArticleComment() {
        return articleComment;
    }

    public void setArticleComment(int articleComment) {
        this.articleComment = articleComment;
    }

    public int getArticleView() {
        return articleView;
    }

    public void setArticleView(int articleView) {
        this.articleView = articleView;
    }

    public String getArticleAdd() {
        return articleAdd;
    }

    public void setArticleAdd(String articleAdd) {
        this.articleAdd = articleAdd;
    }

    public String getArticleUpdate() {
        return articleUpdate;
    }

    public void setArticleUpdate(String articleUpdate) {
        this.articleUpdate = articleUpdate;
    }

    public int getArticleLove() {
        return articleLove;
    }

    public void setArticleLove(int articleLove) {
        this.articleLove = articleLove;
    }

    public int getArticleLike() {
        return articleLike;
    }

    public void setArticleLike(int articleLike) {
        this.articleLike = articleLike;
    }

    public int getTagId() {
        return tagId;
    }

    public void setTagId(int tagId) {
        this.tagId = tagId;
    }

    public int getArticleType() {
        return articleType;
    }

    public void setArticleType(int articleType) {
        this.articleType = articleType;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getCodeTheme() {
        return codeTheme;
    }

    public void setCodeTheme(String codeTheme) {
        this.codeTheme = codeTheme;
    }

    public int getArticleStatus() {
        return articleStatus;
    }

    public void setArticleStatus(int articleStatus) {
        this.articleStatus = articleStatus;
    }

    public int getVerifyStatus() {
        return verifyStatus;
    }

    public void setVerifyStatus(int verifyStatus) {
        this.verifyStatus = verifyStatus;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Article{" +
                "articleId=" + articleId +
                ", articleTitle='" + articleTitle + '\'' +
                ", articleContent='" + articleContent + '\'' +
                ", articleSummary='" + articleSummary + '\'' +
                ", articleComment=" + articleComment +
                ", articleView=" + articleView +
                ", articleAdd='" + articleAdd + '\'' +
                ", articleUpdate='" + articleUpdate + '\'' +
                ", articleLove=" + articleLove +
                ", articleLike=" + articleLike +
                ", tagId=" + tagId +
                ", articleType=" + articleType +
                ", categoryId=" + categoryId +
                ", userId=" + userId +
                ", codeTheme='" + codeTheme + '\'' +
                ", articleStatus=" + articleStatus +
                ", verifyStatus=" + verifyStatus +
                ", user=" + user +
                '}';
    }
}
