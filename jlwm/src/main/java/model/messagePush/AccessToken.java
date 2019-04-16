package model.messagePush;

/**
 * @author ls
 * @version 创建时间：2019年1月23日 下午8:36:34
 * @ClassName 类名称
 * @Description 类描述
 */
public class AccessToken {

	// 获取到的凭证
	private String access_token;

	// 凭证有效时间，单位：秒
	private Integer expires_in;

	public String getAccess_token() {
		return access_token;
	}

	public void setAccess_token(String access_token) {
		this.access_token = access_token;
	}

	public Integer getExpires_in() {
		return expires_in;
	}

	public void setExpires_in(Integer expires_in) {
		this.expires_in = expires_in;
	}

}