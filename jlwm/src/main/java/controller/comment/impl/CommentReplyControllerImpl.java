package controller.comment.impl;
import model.comment.CommentReply;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import project.model.AjaxResult;
import project.util.StringUtils;

import service.comment.impl.CommentReplyServiceImpl;

import java.util.Date;
import java.util.Map;

@RestController
@RequestMapping("CommentReply")
public class CommentReplyControllerImpl {
    private Logger log= (Logger) LoggerFactory.getLogger(CommentReplyControllerImpl.class);
    @Autowired
    private CommentReplyServiceImpl bll;

    /**
     * 添加评论
     * @param commentReply
     * @return
     */
    @PostMapping(value="/addCommentReply")
    public AjaxResult addType(@RequestBody CommentReply commentReply){
        if (StringUtils.objIsNull(commentReply)) {
            return AjaxResult.build("0","对象不能为空");
        }
        log.info("进入添加添加评论方法：addCommentReply()");
        commentReply.setId(StringUtils.getUUID());
        commentReply.setCreateDate(new Date());
        return bll.save(commentReply);
    }

    /**
     * 删除评论
     * @param commentReply  id值和user id
     * @return
     */
    public AjaxResult deleteCommentReply(@RequestBody CommentReply commentReply){
        if(StringUtils.objIsNull(commentReply)){
            return AjaxResult.build("0","对象不能为空");
        }
        log.info("进入删除评论方法：deleteCommentReply()");
        return bll.update(commentReply);
    }


    /**
     * 根据条件查找评论
     * @param map
     * @return
     */
    public AjaxResult findCommentReply(@RequestBody Map map){
        if (StringUtils.objIsNull(map)){
            return AjaxResult.build("0","对象不能为空！");
        }
        log.info("进入根据条件查找评论方法：findCommentReply()");
        return  bll.select(map);
    }
}
