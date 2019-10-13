package com.xgguo.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xgguo.bean.Article;
import com.xgguo.bean.User;
import com.xgguo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@Service
@RequestMapping("/user")
public class UserController {
    @Autowired
    @Resource(name = "userServiceImpl")
    private UserService userService;

    /**
     * 跳转登录注册页面
     *
     * @return
     */
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        return "login";
    }

    /**
     * 跳转登录注册页面
     *
     * @return
     */
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String register() {
        return "login";
    }

    /**
     * 退出登录
     *
     * @param mav
     * @param session
     * @return
     */
    @RequestMapping(value = "/loginOut", method = RequestMethod.GET)
    public ModelAndView loginOut(ModelAndView mav, HttpSession session) {
        String tips = null;
        if (session.getAttribute("USER_SESSION") != null) {
            session.invalidate();
            List<Article> articleList = userService.selectAllArticleAndAuthod();
            mav.addObject("articleList", articleList);
            mav.setViewName("index");
        } else {
//            tips = "你还没登录！";
            mav.setViewName("login");
        }
//        mav.addObject("tips", tips);
        return mav;
    }

    /**
     * 根据用户名，密码登录
     *
     * @param userName
     * @param passWord
     * @return
     */
    @RequestMapping(value = "/login.do", method = RequestMethod.POST)
    public ModelAndView doLogin(String userName, String passWord, ModelAndView mav, HttpSession session) {
        User user = userService.checkNickAndPwd(userName, passWord);
        if (user != null) {
            session.setAttribute("USER_SESSION", user);
            mav.setViewName("redirect:manage");
        } else {
            String tips = "用户名或密码错误，登录失败,请重新登录！";
            mav.addObject("tips", tips);
            mav.setViewName("login");
        }
        return mav;
    }

    /**
     * 新用户注册实现
     *
     * @param userEmail
     * @param userName
     * @param passWord
     * @param mav
     * @param request
     * @return
     */
    @RequestMapping(value = "/register.do", method = RequestMethod.POST)
    public ModelAndView doRegister(String userEmail, String userName, String passWord, ModelAndView mav, HttpServletRequest request) {
//        System.out.println(request.getRemoteAddr());
        String ipAddress = request.getRemoteAddr();
        Boolean res = userService.addUserBaseInfo(userEmail, userName, passWord, ipAddress);
        if (res) {
            String tips = "恭喜" + userName + "，注册成功,请在左侧登录！";
            mav.addObject("tips", tips);
        } else {
            String tips = "注册失败！请联系系统管理员！";
            mav.addObject("tips", tips);
        }
        mav.setViewName("login");
        return mav;
    }

    /**
     * 跳转后台管理页面
     *
     * @param session
     * @param mav
     * @return
     */
    @RequestMapping(value = "/manage", method = RequestMethod.GET)
    public ModelAndView manage(HttpSession session, ModelAndView mav, @RequestParam(required = false, defaultValue = "1", value = "pn") Integer pn) {
        User user = (User) session.getAttribute("USER_SESSION");
        if (user != null) {
            PageHelper.startPage(pn, 3);
            List<Article> articleList = userService.selectArticleByUId(user.getUserId());
            PageInfo pageInfo = new PageInfo<>(articleList, 5);
//            System.out.println(pageInfo);
            mav.addObject("pageInfo", pageInfo);
            String tips = "欢迎" + user.getUserNick() + "登录到后台管理页面！";
            mav.addObject("tips", tips);
            mav.setViewName("manage");
        } else {
//            String tips = "你还没登录，不能进入后台管理页面！";
//            mav.addObject("tips", tips);
            mav.setViewName("redirect:login");
        }
        return mav;
    }

    /**
     * 文章发布页面
     *
     * @param session
     * @param mav
     * @return
     */
    @RequestMapping(value = "/writeArticle", method = RequestMethod.GET)
    public ModelAndView writeArticle(HttpSession session, ModelAndView mav) {
        if (session.getAttribute("USER_SESSION") != null) {
            mav.setViewName("editor_article");
        } else {
            mav.setViewName("redirect:login");
        }
        return mav;
    }

    /**
     * 保存为草稿或保存并申请发布
     *
     * @param articleTitle
     * @param codeTheme
     * @param contentText
     * @param summaryText
     * @param article
     * @return
     */
    // 声明ajax请求响应
    @ResponseBody
    @RequestMapping(value = "/saveOrPublishArticle", method = RequestMethod.POST)
    public String saveOrPublishArticle(String articleTitle, String codeTheme, String contentText, String summaryText, Article article, String articleStatus, HttpSession session, User user) {
        user = (User) session.getAttribute("USER_SESSION");
        article.setUserId(user.getUserId());
        article.setArticleTitle(articleTitle);
        article.setCodeTheme(codeTheme);
        article.setArticleContent(contentText);
        article.setArticleSummary(summaryText);
        article.setArticleStatus(Integer.parseInt(articleStatus));
        int res = userService.saveArticle(article);
        if (res > 0) {
            //获取插入成功后返回的id主键
            return article.getArticleId() + "";
        }
        return "0";
    }

    /**
     * 更新文章内容或更新并申请发布
     *
     * @param articleTitle
     * @param codeTheme
     * @param contentText
     * @param summaryText
     * @param article
     * @param articleId
     * @param articleStatus
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/updateOrPublishArticle", method = RequestMethod.POST)
    public String updateOrPublishArticle(String articleTitle, String codeTheme, String contentText, String summaryText, Article article, String articleId, String articleStatus) {
        article.setArticleId(Integer.parseInt(articleId));
        article.setArticleTitle(articleTitle);
        article.setCodeTheme(codeTheme);
        article.setArticleContent(contentText);
        article.setArticleSummary(summaryText);
        article.setArticleStatus(Integer.parseInt(articleStatus));
        int res = userService.updateArticle(article);
        if (res > 0) {
            return "更新成功！";
        }
        return "0";
    }

    @ResponseBody
    @RequestMapping(value = "/page", method = RequestMethod.GET)
    public String testPage(@RequestParam(required = false, defaultValue = "1", value = "pn") Integer pn, Map<String, Object> map) {
        PageHelper.startPage(pn, 2);
        List<Article> articleList = userService.selectArticleByUId(20);
        PageInfo pageInfo = new PageInfo<>(articleList, 5);
        map.put("pageInfo", pageInfo);
        System.out.println(map);
        return map.toString();
    }

    @RequestMapping(value = "/showArticleById")
    public ModelAndView showArticleById(Integer articleId, HttpSession session, ModelAndView mav) {
        User user = (User) session.getAttribute("USER_SESSION");
        Article article = userService.selectArticleById(articleId);
        if (article != null) {
            if (article.getArticleStatus() == 0) {//草稿普通用户无法访问
                if (user != null) {
                    if (user.getUserId() == article.getUserId()) {//作者才能访问
                        mav.addObject("article", article);
                        mav.setViewName("show_article");
                    } else {
                        mav.setViewName("login");
                    }
                } else {
                    mav.setViewName("login");
                }
            } else {
                mav.addObject("article", article);
                mav.setViewName("show_article");
            }
        } else {
            mav.setViewName("404");
        }
        return mav;
    }

    /**
     * 根据文章id删除文章
     *
     * @param mav
     * @param articleId
     * @return
     */
    @RequestMapping(value = "/delArticleById")
    public ModelAndView delArticleById(ModelAndView mav, int articleId) {
        int res = userService.delArticleById(articleId);
        if (res > 0) {
            mav.setViewName("redirect:manage");
        } else {
            mav.setViewName("500");
        }
        return mav;
    }

    /**
     * 根据id修改文章内容
     *
     * @param mav
     * @param articleId
     * @return
     */
    @RequestMapping(value = "/editorArticleById")
    public ModelAndView editorArticleById(ModelAndView mav, int articleId) {
        Article article = userService.selectArticleById(articleId);
        if (article != null) {
            mav.addObject("article", article);
            mav.setViewName("modify_article");
        } else {
            mav.setViewName("500");
        }
        return mav;
    }
}
