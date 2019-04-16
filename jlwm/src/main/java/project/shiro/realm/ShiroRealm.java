package project.shiro.realm;

import model.user.Role;
import model.user.User;
import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import java.util.HashSet;
import java.util.Set;

public class ShiroRealm extends AuthorizingRealm {
    private static Logger log=Logger.getLogger(ShiroRealm.class);
    //    授权
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        log.info("执行授权操作..");
        User user= (User) SecurityUtils.getSubject().getSession().getAttribute("user");
        SimpleAuthorizationInfo info=new SimpleAuthorizationInfo();
        Set<String> roles=new HashSet<>();
        for (Role role:user.getRoles()
        ) {
            roles.add(role.getName());
        }
        //        赋予角色
        info.addRoles(roles);
        Set<String> permissions=new HashSet<>();
//        赋予权限
//        添加权限字符串  ex: test 会匹配 test 权限
//        permissions.add("test");
        info.addStringPermissions(permissions);
        log.info("------->授权完成<----------");
        return info;
    }

    //    认证  登陆的时候会调用一次.认证成功后就不再调用了
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token)
            throws AuthenticationException {
        log.info("用户登录..");
        UsernamePasswordToken usernamePasswordToken= (UsernamePasswordToken) token;
        AuthenticationInfo info=null;
//        这里采用查询session的方式验证登陆
        if (SecurityUtils.getSubject().getSession().getAttribute("user")==null)
        {
            log.info("session中不存在用户，认证失败");
//            返回 null 或者抛出异常都意味着认证失败
            throw new UnknownAccountException();
        }
        info=new SimpleAuthenticationInfo(
                usernamePasswordToken.getUsername(),
                usernamePasswordToken.getPassword(),
                getName());
        log.info("登录成功..");
        return info;
    }
}