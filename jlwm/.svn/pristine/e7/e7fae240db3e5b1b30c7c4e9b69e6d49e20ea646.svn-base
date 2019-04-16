package project.controller;//package project.controller;
//
//import java.io.File;
//import java.io.IOException;
//import java.util.ArrayList;
//import java.util.Date;
//import java.util.List;
//
//import javax.enterprise.inject.New;
//import javax.servlet.http.HttpServletRequest;
//
//import org.springframework.web.multipart.MultipartException;
//import org.springframework.web.multipart.MultipartFile;
//import org.springframework.web.multipart.MultipartHttpServletRequest;
//import org.springframework.web.multipart.commons.CommonsMultipartResolver;
//
//import com.lxr.commons.exception.ApplicationException;
//
//public class SpringFileupload {
//
//	public static List<String> saveFiles(HttpServletRequest request,
//            MultipartFile file, List<String> list,String rpath) {
//        // 判断文件是否为空
//        if (!file.isEmpty()) {
//            try {
//            	String fileName = file.getOriginalFilename();// 文件原名称
//        		// 判断文件类型
//        		fileName = java.net.URLEncoder.encode(fileName, "utf-8").replace("%", "");
//        		File file2 = new File(rpath);
//
//        		String webroot = "upload/news";
//
//        		String realPath = new File(file2.getParent(),webroot).getPath();
//
//        		System.out.println("SpringFileUpold里的realpath:"+realPath);
//
//        		String trueFileName = String.valueOf(System.currentTimeMillis()) + fileName;
//
////                list.add("/"+webroot + "/" + trueFileName);
//        		list.add("/" + webroot + "/" + trueFileName);
//
//                if (!new File(realPath).getParentFile().exists())
//                	new File(realPath).getParentFile().mkdirs();
//
//                String path = realPath + "/" + trueFileName;
//                // 转存文件
//                file.transferTo(new File(path));
//                return list;
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//        }
//        return list;
//    }
//
//
//
//
//
//
//	public static String upload(MultipartFile file, String rpath) throws IllegalStateException, IOException {
//		if (file.isEmpty())
//			return null;
//
//		String fileName = file.getOriginalFilename();// 文件原名称
//
//		// 判断文件类型
//		fileName = java.net.URLEncoder.encode(fileName, "utf-8").replace("%", "");
//
//		File file2 = new File(rpath);
//
//		String webroot = "upload/news";
//
//		String realPath = new File(file2, webroot).getPath();
//
//		String trueFileName = String.valueOf(System.currentTimeMillis()) + fileName;
//
//		if (!new File(realPath).exists())
//			new File(realPath).mkdirs();
//
//		String path = realPath + "/" + trueFileName;
//
//		// 转存文件到指定的路径
//		file.transferTo(new File(path));
//
//		System.out.println("上传的文件 :" + fileName);
//
//		return "/" + webroot + "/" + trueFileName;
//
//	}
//
//	public static String upload(MultipartHttpServletRequest request, String name)
//			throws IllegalStateException, IOException {
//		MultipartHttpServletRequest multipartRequest = request;
//		// 获得文件：
//		MultipartFile knowledge_icon_url = (MultipartFile) multipartRequest.getFile(name);
//
//		String rpath = request.getSession().getServletContext().getRealPath("/");
//		return upload(knowledge_icon_url, rpath);
//
//	}
//
//	@SuppressWarnings("unused")
//	public static String upload(HttpServletRequest request, String name) {
//		CommonsMultipartResolver commonsMultipartResolver = new CommonsMultipartResolver(
//				request.getSession().getServletContext());
//
//		String path = null;
//		// 判断是否有文件上传
//		if (!commonsMultipartResolver.isMultipart(request))
//			throw new MultipartException("Could not parse multipart servlet request");
//
//		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
//
//		try {
//			return upload(multipartRequest, name);
//		} catch (Exception e1) {
//
//		}
//
//	}
//
//
//
//	public static List<String> saveFile(MultipartFile file, String rpath) throws IllegalStateException, IOException {
//        // 判断文件是否为空
//	    List<String> list = new ArrayList<String>();
//        if (!file.isEmpty()) {
//            try {
//            	String fileName = file.getOriginalFilename();// 文件原名称
//        		// 判断文件类型
//        		fileName = java.net.URLEncoder.encode(fileName, "utf-8").replace("%", "");
//        		File file2 = new File(rpath);
//
//        		String webroot = "upload/news";
//
//        		String realPath = new File(file2.getParent(),webroot).getPath();
//
//        		System.out.println("SpringFileUpold里的realpath:"+realPath);
//
//        		String trueFileName = String.valueOf(System.currentTimeMillis()) + fileName;
//
//        		list.add("/" + webroot + "/" + trueFileName);
//
//                if (!new File(realPath).getParentFile().exists())
//                	new File(realPath).getParentFile().mkdirs();
//
//                String path = realPath + "/" + trueFileName;
//                // 转存文件
//                file.transferTo(new File(path));
//                System.out.println("上传的文件 :" + fileName);
//                return list;
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//        }
//        return list;
//    }
//
//
//	/*
//	 * 上传word文档
//	 */
//	public static String uploadFile(String filePath,MultipartFile files) throws Exception {
//
//		if(files.isEmpty()) {
//			return null;
//		}
//
//		String fileName = files.getOriginalFilename();
//
//		// 判断文件类型
//		fileName = java.net.URLEncoder.encode(fileName, "utf-8").replace("%", "");
//
//		String contentType = files.getContentType();
//
//		System.out.println("fileName-->" + fileName);
//		System.out.println("file路径:------>" + filePath);
//		System.out.println("getContentType-->" + contentType);
//
//		File targetFile = new File(filePath);
//
//		String webroot = "upload/files";
//
//		String realPath = new File(targetFile.getParent(), webroot).getPath();
//
//		String trueFileName = String.valueOf(System.currentTimeMillis()) + fileName;
//
//		if (!new File(realPath).exists()) {
//			new File(realPath).mkdirs();
//		}
//
//		String path = realPath + "/" + trueFileName;
//
//		// 转存文件到指定的路径
//		files.transferTo(new File(path));
//
////      转存文件到指定的路径
////		files.transferTo(new File(path));
//		System.out.println("成功上传word文件" + fileName);
//
//
//		return "/" + webroot + "/" + trueFileName;
//	}
//
//
//
//
//}
