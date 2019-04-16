package controller.recruit.impl;


import model.recruit.Recruit;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import project.model.AjaxResult;
import project.util.StringUtils;

import java.util.*;

/***
 * 用户控制层接口
 */
@RequestMapping(value = "recruit")
@RestController
public class RecruitController implements controller.recruit.RecruitController {
    private Logger log = LoggerFactory.getLogger(RecruitController.class);

    @Autowired
    private service.recruit.impl.recruitServiceImpl bll;

    @PostMapping(value = "addRecruit")
    public AjaxResult addApplicationInfo(@RequestBody Map map) {
        if (StringUtils.objIsNull(map)) {
            return AjaxResult.build("0", "参数错误");
        }
        String requirement="";
        String duty = "";
        String[] requirements=map.get("requirement").toString().replace("\"","").replace("[","").replace("]","").split(",");
        String[] duties=map.get("duty").toString().replace("\"","").replace("[","").replace("]","").split(",");

        for (int i=0;i<duties.length;i++){
            duty+=duties[i]+"➤";
        }
        for (int i=0;i<requirements.length;i++){
            requirement+=requirements[i]+"➤";
        }
        map.put("requirement",requirement);
        map.put("duty",duty);
        map.put("id",StringUtils.getUUID());
        log.info(map.toString());
        return bll.save(map);
    }


    @GetMapping(value = "lookAllRecruitInfo")
    public AjaxResult lookAllRecruitInfo() {
        List<Recruit> allInfo= (List<Recruit>) bll.selectAll().getObj();
        if(allInfo==null&&allInfo.size()<=0){
            AjaxResult.build("0","查询数据不存在");
        }
        List list=new ArrayList();
        for (Recruit recruit:allInfo){
            Map map=new HashMap();
            List duty= Arrays.asList(recruit.getDuty().split("➤"));
            List requirement= Arrays.asList(recruit.getRequirement().split("➤"));
            map.put("id",recruit.getId());
            map.put("position",recruit.getPosition());
            map.put("duty",duty);
            map.put("requirement",requirement);
            list.add(map);
        }
        return AjaxResult.build("1","成功获取数据",list);
    }

    @PostMapping(value = "lookRecruitInfo")
    public AjaxResult lookApplicationInfo(@RequestBody Map map1) {
        if(StringUtils.objIsNull(map1)){
            return AjaxResult.build("0", "参数错误");
        }
        List<Recruit> Info= (List<Recruit>) bll.select(map1).getObj();
        if(Info==null&&Info.size()<=0){
            AjaxResult.build("0","查询数据不存在");
        }
        List list=new ArrayList();
        for (Recruit recruit:Info){
            Map map=new HashMap();
            List duty= Arrays.asList(recruit.getDuty().split("➤"));
            List requirement= Arrays.asList(recruit.getRequirement().split("➤"));
            map.put("id",recruit.getId());
            map.put("position",recruit.getPosition());
            map.put("duty",duty);
            map.put("requirement",requirement);
            list.add(map);
        }
        log.info(list.toString());
        return AjaxResult.build("1","成功获取符合条件数据",list);
    }


    @PostMapping(value = "delRecruit")
    public AjaxResult delApplicationInfo(@RequestBody String id) {
        if(StringUtils.objIsNull(id)){
            return AjaxResult.build("0", "参数错误");
        }
        return bll.delete(id);
    }



}
