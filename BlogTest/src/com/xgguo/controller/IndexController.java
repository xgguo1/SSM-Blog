package com.xgguo.controller;

import com.xgguo.bean.Article;
import com.xgguo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

@Controller
@Service
public class IndexController {

    @Autowired
    @Resource(name = "userServiceImpl")
    private UserService userService;
    /**
     * 跳转博客首页
     * 查询所有发布的文章
     * @return
     */
    @RequestMapping(value = "index", method = RequestMethod.GET)
    public ModelAndView index(ModelAndView mav) {
        List<Article> articleList = userService.selectAllArticleAndAuthod();
        mav.addObject("articleList",articleList);
//        System.out.println(articleList);
        mav.setViewName("index");
        return mav;
    }

    @RequestMapping(value = "/search",method = RequestMethod.POST)
    public ModelAndView search(ModelAndView mav,String keyWords){
        List<Article> articleList = userService.selectArticleLike(keyWords);
        if (articleList.size()>0){
            mav.addObject("articleList",articleList);
            mav.setViewName("index");
        }else {
            String tips = "没有查询到结果！";
            mav.addObject("tips",tips);
            articleList = userService.selectAllArticleAndAuthod();
            mav.addObject("articleList",articleList);
            mav.setViewName("index");
        }
        return mav;
    }
}
