package project.service;

import project.dao.BaseDao;
import project.model.AjaxResult;

import java.util.List;
import java.util.Map;

/***
 * 服务层基类
 */
public abstract class BaseService {

//    private Logger log= LoggerFactory.getLogger(BaseService.class);
    /***
     *
     * @return 需要 数据访问层提供数据 访问层对象
     */
    protected abstract BaseDao getDao();

    /***
     * 新增方法
     * @param object
     * @return 大于0 操作成功 否则操作失败
     */
    public AjaxResult save(Object object) {
        if (object == null) {
            return AjaxResult.build("-1","参数错误！");
        }
        return AjaxResult.build(String.valueOf(getDao().save(object)),"系统响应了你的请求");
    }

    /***
     * 删除单个对象
     * @param object 对象
     * @return 大于0 操作成功 否则操作失败
     */
    public AjaxResult delete(Object object) {
        if (object == null) {
            return AjaxResult.build("-1","参数错误！");
        }
        return AjaxResult.build(String.valueOf(getDao().delete(object)),"系统响应了你的请求");
    }

    /***
     *单个对象更新操作
     * @param object
     * @return 大于0 操作成功 否则操作失败
     */
    public AjaxResult update(Object object) {
        if (object == null) {
            return AjaxResult.build("-1","参数错误！");
        }
        return AjaxResult.build(String.valueOf(getDao().update(object)),"系统响应了你的请求");
    }

    /***
     *  获取当前这个对象的详细信息并返回
     * @param t
     * @param <T>
     * @return  不存在返回 NULL
     */
    public <T> AjaxResult selectOne(T t) {
        if (t == null) {
            return AjaxResult.build("-1","参数错误");
        }
        return AjaxResult.build("1","系统响应了你的请求",getDao().selectOne(t));
    }

    /***
     * 查找方法
     * @param map 条件
     * @return 符合条件的数据对象
     */
    public AjaxResult select(Map map) {
        if (map == null) {
            return AjaxResult.build("-1","参数错误");
        }
        return AjaxResult.build("1","系统响应了你的请求",getDao().select(map));
    }

    /***
     * 查找所有的数据
     * @return 所有数据
     */
    public AjaxResult selectAll() {
        return AjaxResult.build("1","系统响应了你的请求",getDao().selectAll());
    }

    /***
     *
     * @param map page 第几页
     *            pageSize 每页几条数据
     *           其他条件用于搜索数据，需要在mapper文件中配置
     * @return   分页数据
     */
    public AjaxResult findByPage(Map map) {
        if (map == null) {
            return AjaxResult.build("-1","参数错误");
        }
        if (!map.containsKey("pageSize")){
            map.put("pageSize",10);
        }
        if (!map.containsKey("page")){
            map.put("page",1);
        }
        Integer page= (Integer) map.get("page");
        Integer pageSize= (Integer) map.get("pageSize");
        map.put("start",page>1?(page-1)*pageSize:0);
        map.put("end",page>1?page*pageSize:pageSize);
        return AjaxResult.build("1","系统响应了你的请求",getDao().findByPage(map));
    }

    /***
     * 按条件统计数据
     * @param map
     * @return
     */
    public AjaxResult countTotal(Map map){
        if (map == null) {
            return AjaxResult.build("-1","参数错误");
        }
        return AjaxResult.build("1","系统响应了你的请求",getDao().countTotal(map));
    }

    /***
     * 批量新增
     * @param list
     * @return 操作结果
     */
    public AjaxResult batchSave(List<Object> list) {
        if (list==null){
            return AjaxResult.build("-1","参数错误");
        }
        return AjaxResult.build(String.valueOf(getDao().batchSave(list)),"系统响应了你的请求",getDao().batchSave(list));
    }

    /***
     * 批量删除
     * @param list
     * @return 大于0 操作成功 否则操作失败
     */
    public AjaxResult batchDelete(List list){
        if (list==null||list.size()==0){
            return AjaxResult.build("-1","参数错误");
        }
        return AjaxResult.build(String.valueOf(getDao().batchDelete(list)),"系统响应了你的请求",getDao().batchDelete(list));
    }

    /***
     * 按条件查询前 topX 条数据
     * @param map topX int 表示前几条数据 orderBy 按哪个字段进行排序
     * @return
     */
    public AjaxResult selectTopX(Map map){
        if (map==null){
            return AjaxResult.build("-1","参数错误");
        }
        return AjaxResult.build("1","系统响应了你的请求",getDao().selectTopX(map));
    }

    /***
     * 根据id 查询一个对象
     * @param id
     * @return
     */
    public AjaxResult selectOneById(String id){
        if (id==""||id.trim()==""){
            return AjaxResult.build("-1","参数错误");
        }
        return AjaxResult.build("1","系统响应了你的请求",getDao().selectOneById(id.trim()));
    }

    /***
     * 快速查找
     * @param map 查询条件
     * @return id,name
     */
    public AjaxResult fastFind(Map map){
        if (map==null){
            return AjaxResult.build("-1","参数错误");
        }
        return AjaxResult.build("1","系统响应了你的请求",getDao().fastFind(map));
    }

    /****
     * 按照条件随机查询几条数据
     * @param map topX 随机取几条数据  其他key 作为 查询条件 需要在 condition 中进行配置
     * @return
     */
    public AjaxResult randomSelectTopX(Map map){
        if (map==null){
            return AjaxResult.build("-1","参数错误");
        }
        if (!map.containsKey("topX")){
            map.put("topX",4);
        }
        return AjaxResult.build("1","系统响应了你的请求",getDao().randomSelectTopX(map));
    }
}
