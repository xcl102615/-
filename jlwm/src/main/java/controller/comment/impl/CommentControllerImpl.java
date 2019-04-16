package controller.comment.impl;

import model.comment.Comment;
import model.user.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import project.model.AjaxResult;
import project.util.ShiroUtil;
import project.util.StringUtils;
import service.comment.impl.CommentServiceImpl;

import java.util.Date;
import java.util.Map;

@RestController
@RequestMapping("comment")
public class CommentControllerImpl {
    private Logger log= (Logger) LoggerFactory.getLogger(CommentControllerImpl.class);
    @Autowired
    private CommentServiceImpl bll;

    /**
     * 添加评论
     * @param comment
     * @return
     */
    @PostMapping(value="/addComment")
    public AjaxResult addType(@RequestBody Comment comment){
        if (StringUtils.objIsNull(comment)) {
            return AjaxResult.build("0","对象不能为空");
        }
        User user=ShiroUtil.getCurrentUser(new User());
        if(user==null){
            return AjaxResult.build("0","用户未登录或已创建新的会话");
        }
        log.info("进入添加添加评论方法：addComment()");
        comment.setUser(user);
        comment.setId(StringUtils.getUUID());
        comment.setCreateDate(new Date());
        return bll.save(comment);
    }

    /**
     * 删除评论
     * @param comment  id值和user id
     * @return
     */
    public AjaxResult deleteComment(@RequestBody Comment comment){
        if(StringUtils.objIsNull(comment)){
            return AjaxResult.build("0","对象不能为空");
        }
        User user=(User) ShiroUtil.getSession().getAttribute("user");
        if(user==null){
            AjaxResult.build("0","用户未登录或已创建新的会话！");
        }
        log.info("进入删除评论方法：deleteComment()");
        return bll.update(comment);
    }


    /**
     * 根据条件查找评论
     * @param map
     * @return
     */
    public AjaxResult findComment(@RequestBody Map map){
        if (StringUtils.objIsNull(map)){
            return AjaxResult.build("0","对象不能为空！");
        }
        User user=(User) ShiroUtil.getSession().getAttribute("user");
        if(user==null){
            AjaxResult.build("0","用户未登录或已创建新的会话！");
        }
        log.info("进入根据条件查找评论方法：findComment()");
        return  bll.select(map);
    }
}
