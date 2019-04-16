package service.carousel.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.dao.BaseDao;
import project.service.BaseService;
import service.carousel.CarouselService;
@Service("bCarousel")
public class CarouselServiceImpl extends BaseService implements CarouselService {
    @Autowired
    private  dao.carousel.CarouselDao dao;
    @Override
    protected BaseDao getDao() {
        return dao;
    }
}
