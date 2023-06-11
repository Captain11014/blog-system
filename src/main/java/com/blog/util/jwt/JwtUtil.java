package com.blog.util.jwt;

import com.alibaba.druid.util.StringUtils;
import com.blog.util.exception.BlogEcxeption;
import io.jsonwebtoken.*;

import java.util.Date;
import java.util.UUID;

/**
 * @author 姓陈的
 * 2023/6/5 15:32
 */
public class JwtUtil {


    private static long tokenExpiration = 365 * 24 * 60 * 60 * 10000;
    private static String tokenSignKey = "@sdfhsbhj57b$#hbhs_sajsb";

    public static String createToken(Long userId, String username) {
        String token = Jwts.builder()
                .setSubject("AUTH-USER")
                .setExpiration(new Date(System.currentTimeMillis() + tokenExpiration))
                .claim("userId", userId)
                .claim("username", username)
                .signWith(SignatureAlgorithm.HS512, tokenSignKey)
                .compressWith(CompressionCodecs.GZIP)
                .compact();
        return token;
    }

    public static Long getUserId(String token) {
        try {
            if (StringUtils.isEmpty(token)) return null;

            Jws<Claims> claimsJws = Jwts.parser().setSigningKey(tokenSignKey).parseClaimsJws(token);
            Claims claims = claimsJws.getBody();
            Integer userId = (Integer) claims.get("userId");
            return userId.longValue();
        } catch (Exception e) {
            e.printStackTrace();
            throw new BlogEcxeption(403,"认证过期");
        }
    }

    public static String getUsername(String token) {
        try {
            if (StringUtils.isEmpty(token)) return "";

            Jws<Claims> claimsJws = Jwts.parser().setSigningKey(tokenSignKey).parseClaimsJws(token);
            Claims claims = claimsJws.getBody();
            return (String) claims.get("username");
        } catch (Exception e) {
            e.printStackTrace();
            throw new BlogEcxeption(403,"认证过期");
        }
    }

    public static void main(String[] args) {
//        String token = JwtUtil.createToken(1L, "admin");
        UUID uuid = UUID.randomUUID();
        System.out.println(uuid);
//        System.out.println(token);
//        System.out.println(JwtUtil.getUsername(token));
    }


}
