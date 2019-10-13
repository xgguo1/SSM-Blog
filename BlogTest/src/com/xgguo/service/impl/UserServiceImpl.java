package com.xgguo.service.impl;

import com.xgguo.bean.Article;
import com.xgguo.bean.User;
import com.xgguo.mapper.ArticleMapper;
import com.xgguo.mapper.UserMapper;
import com.xgguo.service.UserService;
import com.xgguo.utils.MyBatisUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service("userServiceImpl")
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private User user;

    @Autowired
    private MyBatisUtils utils;

    private SqlSession sqlSession;

    /**
     * 根据用户名和密码查找用户
     * @param userNick
     * @param userPwd
     * @return
     */
    @Override
    public User checkNickAndPwd(String userNick,String userPwd) {
        sqlSession = utils.getSession();
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        user = userMapper.findUserByNickAndPwd(userNick,userPwd);
        sqlSession.close();
        if (user!=null){
            return user;
        }
        return null;
    }

    /**
     * 插入邮件，用户名，密码实现注册
     * @param userEmail
     * @param userNick
     * @param userPwd
     * @return
     */
    @Override
    public Boolean addUserBaseInfo(String userEmail, String userNick, String userPwd,String ipAddress) {
        //记录注册时间
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String now = simpleDateFormat.format(new Date());
        sqlSession = utils.getSession();
        UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        int res = userMapper.addUserBaseInfo(userEmail,userNick,userPwd,now,ipAddress);
        sqlSession.commit();
        sqlSession.close();
        if (res>0){
            return true;
        }
        return false;
    }

    @Override
    public int saveArticle(Article article) {
        //记录添加时间
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String now = simpleDateFormat.format(new Date());
        sqlSession = utils.getSession();
        ArticleMapper articleMapper = sqlSession.getMapper(ArticleMapper.class);
        article.setArticleAdd(now);
        int res = articleMapper.savaArticleAsDraft(article);
        sqlSession.commit();
        sqlSession.close();
        return res;
    }

    @Override
    public int updateArticle(Article article) {
        sqlSession = utils.getSession();
        ArticleMapper articleMapper = sqlSession.getMapper(ArticleMapper.class);
        int res = articleMapper.updateArticleToDraft(article);
        sqlSession.commit();
        sqlSession.close();
        return res;
    }

    @Override
    public List<Article> selectArticleByUId(int uId) {
        sqlSession = utils.getSession();
        ArticleMapper articleMapper = sqlSession.getMapper(ArticleMapper.class);
        List<Article> articleList = articleMapper.selectArticleByUId(uId);
        sqlSession.close();
        return articleList;
    }

    @Override
    public Article selectArticleById(Integer articleId) {
        sqlSession = utils.getSession();
        ArticleMapper articleMapper = sqlSession.getMapper(ArticleMapper.class);
        Article article = articleMapper.selectArticleById(articleId);
        sqlSession.close();
        return article;
    }

    @Override
    public int delArticleById(int articleId) {
        sqlSession = utils.getSession();
        ArticleMapper articleMapper = sqlSession.getMapper(ArticleMapper.class);
        int res = articleMapper.delArticleById(articleId);
        sqlSession.commit();
        sqlSession.close();
        return res;
    }

    @Override
    public List<Article> selectAllArticleAndAuthod() {
        sqlSession = utils.getSession();
        ArticleMapper articleMapper = sqlSession.getMapper(ArticleMapper.class);
        List<Article> articleList = articleMapper.selectAllArticle();
        return articleList;
    }

    @Override
    public List<Article> selectArticleLike(String keyWords) {
        sqlSession = utils.getSession();
        ArticleMapper articleMapper = sqlSession.getMapper(ArticleMapper.class);
        List<Article> articleList = articleMapper.selectArticleLike(keyWords);
        return articleList;
    }
}
