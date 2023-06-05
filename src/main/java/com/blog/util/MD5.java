package com.blog.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;


public final class MD5 {

    public static String encrypt(String strSrc) {
        try {
            char hexChars[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8',
                    '9', 'a', 'b', 'c', 'd', 'e', 'f' };
            byte[] bytes = strSrc.getBytes();
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(bytes);
            bytes = md.digest();
            int j = bytes.length;
            char[] chars = new char[j * 2];
            int k = 0;
            for (int i = 0; i < bytes.length; i++) {
                byte b = bytes[i];
                chars[k++] = hexChars[b >>> 4 & 0xf];
                chars[k++] = hexChars[b & 0xf];
            }
            return new String(chars);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            throw new RuntimeException("MD5加密出错！！+" + e);
        }
    }

    /**
     * 密码正确 true ， 密码错误false
     * @param encryptPwd
     * @param pwd
     * @return
     */
    public static boolean validate(String encryptPwd,String pwd){
        return encryptPwd.equals(encrypt(pwd));
    }

    public static void main(String[] args) {
        System.out.println(MD5.encrypt("111111"));

        System.out.println(validate("96e79218965eb72c92a549dd5a330112","1111111"));
    }
}
