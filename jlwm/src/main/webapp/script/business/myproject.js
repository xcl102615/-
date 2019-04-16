/****************************************
 * 当前项目专属的公共脚本资源
 * Created by wph-pc on 2018/6/23.
 **************************************/

/*教育基础资源服务路径*/
function educationURL() {
    return "http://www.jxlwit.com/lveducation/education/";
}

/*获取课程体系服务器路径*/
function techIndexURL() {
    return "http://www.jxlwit.com/techindexsystem/techindexservice/";
}

/*获取网站的项目根地址*/
function getRootPath(){
    return "http://localhost:8080/lvteachms";
}
/*获取资源服务器路径*/
function resourceURL() {
    return "http://www.jxlwit.com/lvresourcems/remoteuploadfile";
}
function filePath() {
    return "http://www.jxlwit.com/lvresourcems/uploadfiles";
}

function examerUrl() {
    return "http://www.jxlwit.com/portal/";
}
function studentUrl() {  //学生接口
    return " http://www.jxlwit.com/lveducation/education/student";
}
function studentClassUrl() {  //学生班级接口
    return " http://www.jxlwit.com/lveducation/education/class";
}
function departmentUrl() {   //学院接口
    return "http://www.jxlwit.com/lveducation/education/department"
}
function speUrl() {   //专业信息接口
    return " http://www.jxlwit.com/lveducation/education/spe"
}
function uniteUrl() {   //统一接口
    return " http://www.jxlwit.com/lveducation/education/"
}
/********************************获取课程体系相关资源******************************/
/*获取课程资源,callback回调函数，返回结果*/
function findMyLesson(param,pageNumber,pageSize,callback) {
    if (param==undefined || param==null)
        param=new Object();
        param.parent="";
    // param.org=getUserOrg().id;
    //获取凭证号
    doData("getMyCredit",null,function (data) {
        if (data.obj==null)
        {
            alert("系统检测不到您的登录信息，可以尝试重新登录！");
            return;
        }
        var techindexUrl=techIndexURL()+"techindex";
        var con={params:param,credit:data.obj,pageNumber:pageNumber,rowsCount:pageSize};
        doDataAll(techindexUrl,con,function (result) {
            callback(result);
        });
    },true);
}

function findMyTeacher(param,pageNumber,pageSize,callback) {
    if (param==undefined || param==null)
        param=new Object();
        param.parent="";
    // param.org=getUserOrg().id;
    //获取凭证号
    doData("getMyCredit",null,function (data) {
        if (data.obj==null)
        {
            alert("系统检测不到您的登录信息，可以尝试重新登录！");
            return;
        }
        var con={params:param,credit:data.obj,pageNumber:pageNumber,rowsCount:pageSize};
        doDataAll(educationURL()+"teacher",con,function (result) {
            callback(result);
        });
    },true);
}
/*********************************获取班级信息*****************************************/
function findMyClass(param,pageNumber,pageSize,callback) {
    if (param==undefined || param==null)
        param=new Object();
        // param.spe=""
       param.special="934261c152344375a20c88469d008e34";
        // param.spe="";
    // param.org=getUserOrg().id;
    //获取凭证号
    doData("getMyCredit",null,function (data) {
        if (data.obj==null)
        {
            alert("系统检测不到您的登录信息，可以尝试重新登录！");
            return;
        }
        var classUrl="http://www.jxlwit.com/lveducation/education/class";
        var con={params:param,credit:data.obj,pageNumber:pageNumber,rowsCount:pageSize};
        doDataAll(classUrl,con,function (result) {
            callback(result);
        });
    },true);

}
/*获取课程资源,callback回调函数，返回结果*/
function findTechIndexById(id,callback) {
    var obj=new Object();
    obj.id=id;
    doDataAll(techIndexURL()+"findTechIndexById",obj,function (data) {
        callback(data);
    });
}
/*获取当前资源下所有子目录*/
function  findChildrenTechIndex(parentId,callback) {
    var obj=new Object();
    obj.id=parentId;
    doDataAll(techIndexURL()+"findTechIndexChildrenTree",obj,function (data) {
        callback(data);
    });
}

/*********************************获取考生信息*****************************************/
function findExamer(param,pageNumber,pageSize,callback) {
    if (param==undefined || param==null)
        param=new Object();
    param.name="";
    param.org=getUserOrg().id;
    //获取凭证号
    doData("getMyCredit",null,function (data) {
        if (data.obj==null)
        {
            alert("系统检测不到您的登录信息，可以尝试重新登录！");
            return;
        }
        var con={params:param,credit:data.obj,pageNumber:pageNumber,rowsCount:pageSize};
        doDataAll(examerUrl()+"finduser",con,function (result) {
            callback(result);
        });
    },true);

}
/*********************************获取分院信息*****************************************/
function findDepartment(param,pageNumber,pageSize,callback) {
    if (param==undefined || param==null)
        param=new Object();
    param.name="";
    param.org=getUserOrg().id;
    //获取凭证号
    doData("getMyCredit",null,function (data) {
        if (data.obj==null)
        {
            alert("系统检测不到您的登录信息，可以尝试重新登录！");
            return;
        }
        var con={params:param,credit:data.obj,pageNumber:pageNumber,rowsCount:pageSize};
        doDataAll(departmentUrl(),con,function (result) {
            callback(result);
        });
    },true);
}
/*********************************获取专业信息*****************************************/
function findSpe(param,pageNumber,pageSize,callback) {
    if (param==undefined || param==null)
        param=new Object();
        param.name="";
    // param.org=getUserOrg().id;
    //获取凭证号
    doData("getMyCredit",null,function (data) {
        if (data.obj==null)
        {
            alert("系统检测不到您的登录信息，可以尝试重新登录！");
            return;
        }
        var con={params:param,credit:data.obj,pageNumber:pageNumber,rowsCount:pageSize};
        doDataAll(speUrl(),con,function (result) {
            callback(result);
        });
    },true);
}

/*********************************获取学生信息*****************************************/
function findStudent(param,pageNumber,pageSize,callback) {
    if (param==undefined || param==null)
        param=new Object();
    param.name="";
    param.org=getUserOrg().id;
    //获取凭证号
    doData("getMyCredit",null,function (result) {
        if (result.obj==null)
        {
            alert("系统检测不到您的登录信息，可以尝试重新登录！");
            return;
        }
        var con={params:param,credit:result.obj,pageNumber:pageNumber,rowsCount:pageSize};
        doDataAll(studentUrl(),con,function (data) {
            callback(data);
        });
    },true)

}
/*******************************人脸识别验证*********************************************/
function checkface(param,callback) {
    if (param==undefined || param==null) return;
    param.name="";
    //获取凭证号
    doData("getMyCredit",null,function (data) {
        if (data.obj==null)
        {
            alert("系统检测不到您的登录信息，可以尝试重新登录！");
            return;
        }
        var con={params:param,credit:data.obj};
        doDataAll(examerUrl()+"checkface",con,function (result) {
            callback(result);
        });
    },true);
}
/*******************************人脸识别验证,无需账号*********************************************/
function finduserbyface(param,callback) {
    if (param==undefined || param==null) return;
    param.name="";
    //获取凭证号
    doData("getMyCredit",null,function (data) {
        if (data.obj==null)
        {
            alert("系统检测不到您的登录信息，可以尝试重新登录！");
            return;
        }
        var con={params:param,credit:data.obj};
        doDataAll(examerUrl()+"finduserbyface",con,function (result) {
            callback(result);
        });
    },true);
}
/*******************************获取高校班级信息*********************************************/
function findclasses(param,pageNumber,pageSize,callback) {
    if (param==undefined || param==null)
        param=new Object();
    param.name="";
    //获取凭证号
    doData("getMyCredit",null,function (data) {
        if (data.obj==null)
        {
            alert("系统检测不到您的登录信息，可以尝试重新登录！");
            return;
        }
        var con={params:param,credit:data.obj,pageNumber:pageNumber,rowsCount:pageSize};
        doDataAll(educationURL()+"class",con,function (result) {
            callback(result);
        });
    },true);
}


