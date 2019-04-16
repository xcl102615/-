package model.recruit;

import project.model.BaseObject;

public class Recruit extends BaseObject {
    //职位
    private String position;
    //职责
    private String duty;
    //要求
    private String requirement;

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getDuty() {
        return duty;
    }

    public void setDuty(String duty) {
        this.duty = duty;
    }

    public String getRequirement() {
        return requirement;
    }

    public void setRequirement(String requirement) {
        this.requirement = requirement;
    }
}
