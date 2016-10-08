package com.abs.mobile.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.buzheng.demo.esm.App;
import org.buzheng.demo.esm.web.util.Result;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.abs.mobile.domain.TIndexLunbo;
import com.abs.mobile.service.LunboService;
import com.abs.util.commom.AbsTool;

import sun.misc.BASE64Decoder;

@Controller
@RequestMapping("/admin/lunbo")
@SessionAttributes(App.USER_SESSION_KEY)
public class LunboController extends BaseController {

	@Resource
	private LunboService lunboService;

	/**
	 * 
	 * @return
	 */
	@RequestMapping("/list")
	@ResponseBody
	public List<TIndexLunbo> list() {

		return this.lunboService.getLunboList();

	}
	/**
	 * 
	 * @return
	 */
	@RequestMapping("/add")
	@ResponseBody
	public Result add(TIndexLunbo tIndexLunbo) {
		lunboService.addLunbo(tIndexLunbo);
		return new Result();
	}
	
	/**
	 * 
	 * @return
	 */
	@RequestMapping("/update")
	@ResponseBody
	public Result update(TIndexLunbo tIndexLunbo) {
		lunboService.updLunbo(tIndexLunbo);
		return new Result();
	}
	/**
	 * 
	 * @return
	 */
	@RequestMapping("/del")
	@ResponseBody
	public Result del(String lunboId) {
		lunboService.delLunbo(lunboId);
		return new Result();
	}
	/**
	 * 上传图片
	 * 
	 * @return
	 */
	@RequestMapping("/upload")
	@ResponseBody
	public Result upload(@RequestParam MultipartFile uFile,HttpServletRequest request) {
        // 配置Tomcat 参考tomcat.cfg
        String projectPath = "/abs/img";
        String realPathString = "c:\\abs\\img\\";
		String nonce_str=AbsTool.create_nonce_str();
        Result result = new Result();
        
        // 判断文件是否为空  
        if (!uFile.isEmpty()) {
            try {  
                // 保存的文件路径(如果用的是Tomcat服务器，文件会上传到\\%TOMCAT_HOME%\\webapps\\YourWebProject\\upload\\文件夹中  )  
                String filePath = realPathString + nonce_str+ ".jpg";
                
                System.err.println(filePath);  
                File saveDir = new File(filePath);  
                if (!saveDir.getParentFile().exists())  
                    saveDir.getParentFile().mkdirs();  
                 System.err.println(filePath);  
                // 转存文件  
                 uFile.transferTo(saveDir);  
            } catch (Exception e) {  
                e.printStackTrace();  
                result.setSuccessful(false);
        		return result;
            }  
        }
		
		String imgPath =projectPath + "/" + nonce_str + ".jpg";

		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("imgPath", imgPath);
		result.setData(resultMap);
		result.setSuccessful(true);
		return result;

	}

	/***
	 * 保存文件
	 * 
	 * @param file
	 * @return
	 */
	private boolean saveFile(HttpServletRequest request, MultipartFile file) {
		// 判断文件是否为空
		if (!file.isEmpty()) {
			try {
				// 保存的文件路径(如果用的是Tomcat服务器，文件会上传到\\%TOMCAT_HOME%\\webapps\\YourWebProject\\upload\\文件夹中
				// )
				String filePath = request.getSession().getServletContext().getRealPath("/") + "upload/"
						+ file.getOriginalFilename();
				System.err.println(filePath);
				File saveDir = new File(filePath);
				if (!saveDir.getParentFile().exists())
					saveDir.getParentFile().mkdirs();
				System.err.println(filePath);
				// 转存文件
				file.transferTo(saveDir);
				return true;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return false;
	}

	/**
	 * 
	 * @param fileData
	 * @param realPathString
	 * @param projectPath
	 * @param fileName
	 * @return
	 */
	public String uploadFile(String fileData, String projectPath, String realPathString) {
		// 在自己的项目中构造出一个用于存放用户照片的文件夹
		// 如果此文件夹不存在则创建一个
		File f = new File(realPathString);
		if (!f.exists()) {
			f.mkdir();
		}
		// 拼接文件名称，不存在就创建
		String nonce_str = AbsTool.create_nonce_str();

		realPathString = realPathString + "/" + nonce_str + ".jpg";
		f = new File(realPathString);

		// log.info("====文件保存的位置："+imgPath);

		// 使用BASE64对图片文件数据进行解码操作
		BASE64Decoder decoder = new BASE64Decoder();
		try {
			// 通过Base64解密，将图片数据解密成字节数组
			byte[] bytes = decoder.decodeBuffer(fileData);
			// 构造字节数组输入流
			ByteArrayInputStream bais = new ByteArrayInputStream(bytes);
			// 读取输入流的数据
			BufferedImage bi = ImageIO.read(bais);
			// 将数据信息写进图片文件中
			ImageIO.write(bi, "jpg", f);// 不管输出什么格式图片，此处不需改动
			bais.close();
		} catch (Exception e) {

		}
		return projectPath + "/" + nonce_str + ".jpg";
	}
}
