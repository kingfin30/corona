package egovframework.corona.main.util;

import org.apache.commons.lang3.StringUtils;

public class Functions {
	public static String maskingBirthRight4(String birth){
		if(StringUtils.isBlank(birth) ){
			return birth;
		}
		
		int maskingStart = birth.length() - 4;
		String birthFirst = birth.substring(0, maskingStart);
		String maskStr = "";
		for(int i = 1; i <= 4; i++){
			maskStr += "*";
		}
		
		return birthFirst + maskStr;
	}

}
