package test;

public abstract class chouxiang {
    private String name;
    private int age;
    //public chouxiang(){}
    public chouxiang(String name,int age){
        System.out.println("hhhhhhh");
        System.out.println("名称："+name+"------"+"年龄"+age);
    }
    public double computePay()
    {
        System.out.println("Inside Employee computePay");
        return 0.0;
    }
    public void mailCheck()
    {
        System.out.println("Mailing a check to " + this.name
                + " " + this.age);
    }

    @Override
    public String toString() {
        return "chouxiang{" +
                "name='" + name + '\'' +
                ", age=" + age +
                '}';
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }
}
