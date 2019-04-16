package controller.carousel.impl;

import controller.carousel.CarouselController;

import model.carousel.Carousel;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import project.model.AjaxResult;
import project.util.StringUtils;

import java.util.Date;
import java.util.Map;

@RestController
@RequestMapping("carousel")
public class CarouselControllerImpl implements CarouselController {
    private Logger log= LoggerFactory.getLogger(CarouselControllerImpl.class);
    @Autowired
    private service.carousel.impl.CarouselServiceImpl bll;

    /**
     * 添加轮播图（后台管理）
     *
     * @param carousel
     * @return
     */
    @PostMapping(value = "/addCarousel")
    public AjaxResult addCarousel(@RequestBody Carousel carousel) {
        if (StringUtils.objIsNull(carousel)) {
            return AjaxResult.build("0", "对象不能为空");
        }
        log.info("进入轮播图（后台管理）新增方法 addCarousel()");
        carousel.setId(StringUtils.getUUID());
        carousel.setCreateDate(new Date());
        return bll.save(carousel);
    }

    /**
     * 删除轮播图（后台管理）
     *
     * @param carousel（id 、shop.id）
     * @return
     */
    @PostMapping("/deleteCarousel")
    public AjaxResult deleteCarousel(@RequestBody Carousel carousel) {
        if (StringUtils.objIsNull(carousel)) {
            return AjaxResult.build("0", "对象不能为空");
        }
        log.info("进入轮播图（后台管理）删除方法 deleteCarousel()");
        return bll.delete(carousel);
    }

    /**
     * 修改轮播图（后台管理）
     *
     * @param carousel
     * @return
     */
    @PostMapping("/updateCarousel")
    public AjaxResult updateCarousel(@RequestBody Carousel carousel) {
        if (StringUtils.objIsNull(carousel)) {
            return AjaxResult.build("0", "对象不能为空");
        }
        log.info("进入轮播图（后台管理）修改方法 updateCarousel()");
        return bll.update(carousel);

    }

    /**
     * 查找轮播图（后台管理）
     * @param map
     * @return
     */
    @PostMapping("/findCarousel")
    public AjaxResult findCarousel(@RequestBody Map<String, Object> map) {
        if (StringUtils.objIsNull(map)) {
            return AjaxResult.build("0", "对象不能为空");
        }
        log.info("进入轮播图（后台管理）查找方法 findCarousel()");
        return bll.select(map);
    }
}
