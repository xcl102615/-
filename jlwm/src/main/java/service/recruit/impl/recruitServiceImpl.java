package service.recruit.impl;


import dao.recruit.Recruit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.dao.BaseDao;
import project.service.BaseService;
import service.recruit.recruitService;

@Service
public class recruitServiceImpl extends BaseService implements recruitService {
    @Autowired
    private Recruit dao;
    @Override
    protected BaseDao getDao() {
        return dao;
    }
}
