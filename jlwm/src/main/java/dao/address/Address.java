package dao.address;

import project.dao.BaseDao;

public interface Address extends BaseDao {
    model.address.Address findDefaultAddess(String userId);
}
