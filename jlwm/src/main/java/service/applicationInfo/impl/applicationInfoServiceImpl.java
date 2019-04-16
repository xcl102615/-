package service.applicationInfo.impl;


import dao.applicationInfo.ApplicationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.dao.BaseDao;
import project.service.BaseService;
import service.applicationInfo.applicationInfoService;

@Service
public class applicationInfoServiceImpl extends BaseService implements applicationInfoService {
    @Autowired
    private ApplicationInfo dao;
    @Override
    protected BaseDao getDao() {
        return dao;
    }
}
