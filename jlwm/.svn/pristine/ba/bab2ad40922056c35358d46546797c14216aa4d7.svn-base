package project.util;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

/**********************************************************
 *                      SpringUtil
 *  1.实现ApplicationContextAware接口的类
 *      会在spring初始化完成后会自动注入ApplicationContext 实例
 *********************************************************/
public class SpringUtil implements ApplicationContextAware {
    private static ApplicationContext context = null;

    public static Object getBean(Class clazz) {
        return context.getBean(clazz);
    }

    public static Object getBean(String beanName) {
        return context.getBean(beanName);
    }

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        context = applicationContext;
    }
}
