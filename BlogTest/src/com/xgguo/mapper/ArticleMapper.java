package com.xgguo.mapper;

import com.xgguo.bean.Article;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;

import java.util.List;

public interface ArticleMapper {

    /**
     * 保存文章，并返回id
     * article.getArticleId();
     *
     * @param article
     * @return
     */
    @Insert("insert into tb_article(article_title,article_summary,article_content,code_theme,article_status,article_add,user_id) values(#{articleTitle},#{articleSummary},#{articleContent},#{codeTheme},#{articleStatus},#{articleAdd},#{userId})")
    @Options(useGeneratedKeys = true, keyProperty = "articleId", keyColumn = "article_id")
    int savaArticleAsDraft(Article article);

    @Update("update tb_article set article_title=#{articleTitle},article_summary=#{articleSummary},article_content=#{articleContent},code_theme=#{codeTheme},article_status = #{articleStatus} where article_id = #{articleId}")
    int updateArticleToDraft(Article article);

    /**
     * 根据用户id查找用户对应的文章
     *
     * @param uId
     * @return
     */
    @Select("select * from tb_article where user_id = #{uId}")
    List<Article> selectArticleByUId(int uId);

    /**
     * 根据文章id查文章
     *
     * @param articleId
     * @return
     */
    @Select("select * from tb_article where article_id = #{articleId}")
    Article selectArticleById(Integer articleId);

    /**
     * 根据文章id删除文章
     *
     * @param articleId
     * @return
     */
    @Delete("delete from tb_article where article_id = #{articleId}")
    int delArticleById(int articleId);

    @Select("select * from tb_article where article_status = 1 ORDER BY article_id desc")
    @Results({
            @Result(id = true, column = "article_id", property = "articleId"),
            @Result(column = "user_id", property = "user", one = @One(select = "com.xgguo.mapper.UserMapper.selectUserByUid", fetchType = FetchType.EAGER))
    })
    List<Article> selectAllArticle();

    @Select("select * from tb_article where article_summary like concat('%',#{0},'%')")
    @Results({
            @Result(id = true, column = "article_id", property = "articleId"),
            @Result(column = "user_id", property = "user", one = @One(select = "com.xgguo.mapper.UserMapper.selectUserByUid", fetchType = FetchType.EAGER))
    })
    List<Article> selectArticleLike(String keyWords);
}
