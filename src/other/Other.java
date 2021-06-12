package other;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;

import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.springframework.ui.ModelMap;

import com.mchange.util.Base64Encoder;

import MainBean.AccountSV;
import MainBean.GiangVien;
import MainBean.SinhVien;

public class Other {
	public void checkLogin(HttpSession ss, ModelMap model, Session session) {
		if(ss.getAttribute("user") != null) {
			model.addAttribute("account", ss.getAttribute("account"));
			model.addAttribute("user", ss.getAttribute("user"));
			model.addAttribute("code", ss.getAttribute("code"));
			model.addAttribute("role", ss.getAttribute("role"));
			
			if((int)ss.getAttribute("role") == 3) {
				SinhVien sinhVien = (SinhVien)(session.get(SinhVien.class, (String)(ss.getAttribute("code"))));
				model.addAttribute("sinhVienPro", sinhVien);
			}
			else {
				GiangVien giangVien = (GiangVien)(session.get(GiangVien.class, (String)(ss.getAttribute("code"))));
				model.addAttribute("giangVienPro", giangVien);
			}
		}
	}
	
	    public String getMd5(String input)
	    {
	        try {
	  
	            // Static getInstance method is called with hashing MD5
	            MessageDigest md = MessageDigest.getInstance("MD5");
	  
	            // digest() method is called to calculate message digest
	            //  of an input digest() return array of byte
	            byte[] messageDigest = md.digest(input.getBytes());
	  
	            // Convert byte array into signum representation
	            BigInteger no = new BigInteger(1, messageDigest);
	  
	            // Convert message digest into hex value
	            String hashtext = no.toString(16);
	            while (hashtext.length() < 32) {
	                hashtext = "0" + hashtext;
	            }
	            return hashtext;
	        } 
	  
	        // For specifying wrong message digest algorithms
	        catch (NoSuchAlgorithmException e) {
	            throw new RuntimeException(e);
	        }
	    }
	    
	    public static String generateToken() {
	    	SecureRandom secureRandom = new SecureRandom();
	    	Base64.Encoder base64Encoder = Base64.getUrlEncoder();
	        byte[] randomBytes = new byte[24];
	        secureRandom.nextBytes(randomBytes);
	        return base64Encoder.encodeToString(randomBytes);
	    }
	
	public Other() {}
}
