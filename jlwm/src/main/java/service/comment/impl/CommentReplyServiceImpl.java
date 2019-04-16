package service.comment.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.dao.BaseDao;
import project.service.BaseService;
import service.comment.CommentReplyService;
@Service
public class CommentReplyServiceImpl extends BaseService implements CommentReplyService {
    @Autowired
    private dao.comment.CommentReplyDao dao;
    @Override
    protected BaseDao getDao() {
        return dao;
    }
}
