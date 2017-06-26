package com.doggadata.teach.utils;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5 {
    private static final String HEX_NUMS_STR="0123456789ABCDEF";
    public static byte[] hexStringToByte(String hex) {
     int len = (hex.length() / 2);
     byte[] result = new byte[len];
     char[] hexChars = hex.toCharArray();
     for (int i = 0; i < len; i++) {
      int pos = i * 2;
      result[i] = (byte) (HEX_NUMS_STR.indexOf(hexChars[pos]) << 4
          | HEX_NUMS_STR.indexOf(hexChars[pos + 1]));
     }
     return result;
    }
    public static String byteToHexString(byte[] b) {
        StringBuffer hexString = new StringBuffer();
        for (int i = 0; i < b.length; i++) {
            String hex = Integer.toHexString(b[i] & 0xFF);

            if (hex.length() == 1) {
                hexString.append('0' + hex);
            } else {
                hexString.append(hex.toLowerCase());
            }
        }
        return hexString.toString();
    }
    
    public static String GetEncrypted(String str)
      throws NoSuchAlgorithmException, UnsupportedEncodingException {
     MessageDigest md = MessageDigest.getInstance("MD5");
     md.update(str.getBytes("utf-8"));
     byte[] digest = md.digest();
     return byteToHexString(digest);
     
    }
    
}
