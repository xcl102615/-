package dao.applicationInfo;

import dao.recruit.Recruit;
import project.dao.BaseDao;

public interface ApplicationInfo extends BaseDao {
    Recruit selectRecruit(String id);
}
