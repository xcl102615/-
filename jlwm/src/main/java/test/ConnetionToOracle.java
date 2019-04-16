package test;

import model.user.User;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.text.MessageFormat;
import java.util.HashMap;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;

/*public class ConnetionToOracle extends TimerTask {
    public static void main(String[] args) {
        Timer timer = new Timer();
        ConnetionToOracle t = new ConnetionToOracle();
        timer.schedule(t, 0, 2000);
    }

    @Override
    public void run() {
        System.out.println("hahaha");
    }

}*/
public class ConnetionToOracle  {
    public static void main(String[] args) throws IOException {
       /*String messig="肖大哥，黄仙人";
       String[] newmessig =messig.split("，");
       for(int i=0;i<newmessig.length;i++){
           System.out.println(newmessig[i]);
           Map map=new HashMap();
           String dd=MessageFormat.format("公司={0},法人={1}","计里网络科技有限公司","刘总");
           map.put("dd",dd);
           map.put("aa","aa");
           map.put("cc","cc");


           System.out.println(map.get("dd"));
       }*/
        SerializePerson();


    }
    public static  void  SerializePerson() throws IOException {
        User user=new User();
        user.setPhone("11111");
        user.setName("肖春林");
        user.setAge(18);
        /*FileOutputStream fileOutputStream=new FileOutputStream("C:/chun/song.text");
        ObjectOutputStream objectOutputStream=new ObjectOutputStream(fileOutputStream);
        objectOutputStream.writeObject(user);
        objectOutputStream.flush();
        System.out.println("序列化成功！");*/
       String aaa=user.toString();
        System.out.println(aaa);

    }


}

