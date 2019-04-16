package service.food.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.dao.BaseDao;
import project.service.BaseService;
import service.food.FoodTypeService;
@Service
public class FoodTypeServiceImpl extends BaseService implements FoodTypeService {
    @Autowired
    private dao.food.FoodType dao;
    @Override
    protected BaseDao getDao() {
        return dao;
    }
}
