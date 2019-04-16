package project.shiro.session;

import org.apache.shiro.session.Session;
import org.apache.shiro.session.SessionListener;



/**
 * Created by wph-pc on 2017/9/27.
 */
public class ShiroSessionListener implements SessionListener {
    private final String COUNT_KEY = "sessions";

    @Override
    public void onStart(Session session) {
        System.out.println("session is starting....");
    }

    @Override
    public void onStop(Session session) {
        System.out.println("session is stopped....");
    }

    @Override
    public void onExpiration(Session session) {
        System.out.println("session is expiration....");
    }
}
