package com.dkd.app.common.util;

import com.dkd.app.common.token.TokenObject;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.JwtBuilder;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.Date;

public class JWTUtil {
    /**
     * 签发JWT
     * @param tokenObject
     * @return
     * @throws IOException
     */
    public static String createJWTByObj(TokenObject tokenObject) throws IOException {

        ZoneId zoneId = ZoneId.systemDefault();
        ZonedDateTime zdt = LocalDateTime.now().plusDays(7).atZone(zoneId);
        //添加构成JWT的参数
        JwtBuilder builder = Jwts.builder().setHeaderParam("typ", "JWT")
                .setHeaderParam("alg", "HS256")  //加密算法
                .addClaims(JsonUtil.convertToMap(tokenObject))
                .setExpiration(Date.from(zdt.toInstant()))  //设置过期时间
                .signWith(SignatureAlgorithm.HS256,"dkd".getBytes(StandardCharsets.UTF_8));  //用密钥签名

        //生成JWT
        return builder.compact();
    }



    public static int decode(String token) throws IOException {
        // String bodyData = token.split("\\.")[1];
        // String bodyStr = new String(Base64.getDecoder().decode(bodyData), StandardCharsets.UTF_8);
        // 得到DefaultJwtParser
        Claims claims = Jwts.parser()
                // 设置签名的秘钥
                .setSigningKey("dkd".getBytes(StandardCharsets.UTF_8))
                // 设置需要解析的jwt
                .parseClaimsJws(token).getBody();
        return (int) claims.get("userId");

    }

}
