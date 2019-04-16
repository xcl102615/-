package service.comment.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.dao.BaseDao;
import project.service.BaseService;
import service.comment.CommentService;
@Service
public class CommentServiceImpl extends BaseService implements CommentService {
    @Autowired
    private dao.comment.CommentDao dao;
    @Override
    protected BaseDao getDao() {
        return dao;
    }
}
