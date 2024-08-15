package com.dkd.app.common.util;

import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsRequest;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.profile.IClientProfile;
import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

//短信发送工具类
@Data
@Component
@ConfigurationProperties(prefix = "dkd.sms")
public class SmsTemplate {

    private String key;
    private String secret;
    private String signName;
    private String templateCode;

    // 调用阿里云平台发送短信
    public void sendSms(String phoneNumbers, String code) {
        //设置超时时间
        System.setProperty("sun.net.client.defaultConnectTimeout", "10000");
        System.setProperty("sun.net.client.defaultReadTimeout", "10000");

        try {
            //初始化acsClient,暂不支持region化
            IClientProfile profile = DefaultProfile.getProfile("cn-hangzhou", key, secret);
            DefaultProfile.addEndpoint("cn-hangzhou", "cn-hangzhou", "Dysmsapi", "dysmsapi.aliyuncs.com");
            IAcsClient acsClient = new DefaultAcsClient(profile);

            //组装请求对象-具体描述见控制台-文档部分内容
            SendSmsRequest request = new SendSmsRequest();
            request.setPhoneNumbers(phoneNumbers);//手机号
            request.setSignName(signName);//短信前面
            request.setTemplateCode(templateCode);//短信模板
            request.setTemplateParam("{\"code\":\"" + code + "\"}");//验证码

            SendSmsResponse sendSmsResponse = acsClient.getAcsResponse(request);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
