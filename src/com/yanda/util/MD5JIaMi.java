package com.yanda.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5JIaMi {
	
public static String MD5(String str) {
		
		String r = "";
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			
			md.update(str.getBytes());
			
			byte[] bs = md.digest();
			
//			System.out.println(Arrays.toString(bs));
			
//			System.out.print(Arrays.toString(bs)+" ");
			for(byte b : bs) {
				
//				System.out.print(b+128+" ");
				int t = b+128;
				if(t<16) {
					r+="0";
				}
				r+=Integer.toHexString(t);
//				System.out.println(b+128);
			}
			
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return r;
		
		
	}
	

}
