package project.dao;

import java.util.List;
import java.util.Map;

/***
 * 数据访问层基类
 */
public interface BaseDao {
    /***
     * 新增一条记录
     * @param object
     * @return 操作结果
     */
    int save(Object object);

    /***
     * 删除一条记录
     * @param object
     * @return
     */
    int delete(Object object);

    /***
     * 更新一条记录
     * @param object
     * @return
     */
    int update(Object object);

    /***
     * 查找当前这条记录
     * @param t
     * @param <T>当前对象
     * @return
     */
    <T> T selectOne(T t);

    /***
     * 根据条件查找
     * @param map 条件
     * @return
     */
    List<Object> select(Map map);

    /***
     * 查找所有的数据
     * @return
     */
    List<Object> selectAll();

    /***
     * 分页查找
     * @param map 条件
     * @return
     */
    List<Map<String, Object>> findByPage(Map map);

    /***
     * 统计符合条件的数据总数
     * @param map 参数
     * @return
     */
    int countTotal(Map map);

    /***
     * 批量新增
     * @param list
     * @return 操作结果
     */
    int batchSave(List list);

    /**
     * 批量删除
     * @param list
     * @return
     */
    int batchDelete(List list);

    /***
     * 获取前x条数据
     * @param map
     * @return
     */
    List<Object> selectTopX(Map map);

    /***
     * 通过Id获取一个对象
     * @param id
     * @return
     */
    Object selectOneById(String id);

    /***
     * 快速查找
     * @param map 查询条件
     * @return id,name
     */
    List<Map<String,Object>> fastFind(Map map);

    /***
     * 根据条件
     * 随机查找数据 前N条数据
     * @param map
     * @return
     */
    List<Object>randomSelectTopX(Map map);
}
