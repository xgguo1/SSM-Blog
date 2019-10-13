package com.xgguo.service;

import com.xgguo.bean.Article;
import com.xgguo.bean.User;

import java.util.List;

public interface UserService {
    User checkNickAndPwd(String userNick, String userPwd);

    Boolean addUserBaseInfo(String userEmail,String userNick,String userPwd,String ipAddress);

    int saveArticle(Article article);

    int updateArticle(Article article);

    List<Article> selectArticleByUId(int uId);

    Article selectArticleById(Integer articleId);

    int delArticleById (int articleId);

    List<Article> selectAllArticleAndAuthod();

    List<Article> selectArticleLike(String keyWords);
}
