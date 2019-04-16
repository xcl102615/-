package service.type.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.dao.BaseDao;
import project.service.BaseService;
import service.type.TypeSerevice;
@Service("bype")
public class TypeServiceImpl extends BaseService implements TypeSerevice {
    @Autowired
    private dao.type.TypeDao dao;
    @Override
    protected BaseDao getDao() {
        return dao;
    }
}
