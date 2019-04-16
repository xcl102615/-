package project.controller;

import com.qcloud.cos.COSClient;
import com.qcloud.cos.ClientConfig;
import com.qcloud.cos.auth.BasicCOSCredentials;
import com.qcloud.cos.auth.COSCredentials;
import com.qcloud.cos.model.PutObjectRequest;
import com.qcloud.cos.model.PutObjectResult;
import com.qcloud.cos.region.Region;
import model.user.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import project.constant.ProjectConfig;
import project.model.AjaxResult;
import project.util.PublicAddress;
import project.util.ShiroUtil;
import project.util.StringUtils;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/***
 * 文件上传
 */
@RestController
public class UploadFilesController {

    private Logger log = LoggerFactory.getLogger(UploadFilesController.class);

    @RequestMapping(value = "/upload")
    public Object fileUpload(@RequestParam("image") MultipartFile[] files, HttpServletRequest request) {
        log.info("文件上传..");
        List<String> list = new ArrayList<>();
        for (MultipartFile file : files
        ) {
            list.add(this.upload(file, request));
        }
        if (list.size() == 0) {
            return AjaxResult.build("-1", "文件上传失败");
        }
        return AjaxResult.build("1", "文件上传成功！", list);
    }

    private String upload(MultipartFile files, HttpServletRequest request) {
        String fileName = StringUtils.getUUID();
//      随机生成文件UUID名字
        String oldName = files.getOriginalFilename();
//      获取文件源名字
        if (oldName.indexOf(".") < 0) {
            return null;
        }
        String suffix = oldName.substring(oldName.lastIndexOf("."));
//      获取文件的后缀,可能文件名字中有多个 "." 这里取最后的一个点进行校验。
        boolean isAllowed = false;
//        是否允许上传标志位
        for (String pattern : ProjectConfig.UPLOAD_FILE_TYPE
        ) {
            log.info(pattern.equalsIgnoreCase(suffix) + "");
            if (pattern.equalsIgnoreCase(suffix)) {
                isAllowed = true;
            }
        }
        if (!isAllowed) {
            User user = ShiroUtil.getCurrentUser(new User());
            log.warn(user == null ? "[未知用户]上传非法文件类型" : "用户[" + user.getId() + "]上传非法的文件类型[" + suffix + "]");
            return null;
        }
        String root = request.getServletContext().getRealPath("/");
        log.info("项目根路径：" + root);
//        app 根路径
        String realPath = getCurrentDate();
//        日期路径
        String fileUrl = ProjectConfig.UPLOAD_FILE_DIRECTORY + "/" + realPath + "/" + fileName + suffix;
        File parent = new File(root);
//      方便管理 这里将图片放在 Tomcat 容器的根目录getParent()
        File directory = new File(parent.getParent() + "/" + ProjectConfig.UPLOAD_FILE_DIRECTORY + "/" + realPath);
        log.info("图片上传路径:" + fileUrl);
        if (!directory.exists()) {
            directory.mkdirs();
        }
        File destination = new File(directory.getPath() + "/" + fileName + suffix);
//        文件保存位置
        try {
            files.transferTo(destination);
        } catch (IOException e) {
            log.error("上传文件失败！原因是:" + e.getMessage());
            return null;
        }

        /*******************************将图片上传到腾讯云***************************************/
        // 1 初始化用户身份信息（secretId, secretKey）。
        COSCredentials cred = new BasicCOSCredentials(PublicAddress.secretId, PublicAddress.secretKey);
        // 2 设置bucket的区域, COS地域的简称请参照 https://cloud.tencent.com/document/product/436/6224
        // clientConfig中包含了设置 region, https(默认 http), 超时, 代理等 set 方法, 使用可参见源码或者常见问题 Java SDK 部分。
        ClientConfig clientConfig = new ClientConfig(new Region(PublicAddress.region_name));
        // 3 生成 cos 客户端。
        COSClient cosClient = new COSClient(cred, clientConfig);

        File localFile = new File(directory.getPath() + "/" + fileName + suffix);
        // 指定要上传到的存储桶
        String bucketName = PublicAddress.bucketName;
        // 指定要上传到 COS 上对象键
        String key = fileUrl;

        PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, key, localFile);
        PutObjectResult putObjectResult = cosClient.putObject(putObjectRequest);
        cosClient.shutdown();
        return fileUrl;
    }

    /****
     *
     * @return 当前系统时间的 2019/02/15 格式
     */
    private String getCurrentDate() {
        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
        return dateFormat.format(date);
    }
}
