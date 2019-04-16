package service.address.impl;

import model.address.Address;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.dao.BaseDao;
import project.service.BaseService;
import service.address.AddressService;


@Service
public class AddressServiceImpl extends BaseService implements AddressService {
    @Autowired
    private dao.address.Address dao;

    @Override
    protected BaseDao getDao() {
        return dao;
    }
    public Address findDefaultAddess(String userId) {
        return dao.findDefaultAddess(userId);
    }
}
