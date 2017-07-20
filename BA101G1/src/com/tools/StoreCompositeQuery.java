package com.tools;

import java.util.Map;
import java.util.Set;

public class StoreCompositeQuery {

	public static String getStoreCompositeQueryString(String columnName , String value){
		
		String QueryString = null;
		
		if("store_state".equals(columnName) || "store_out".equals(columnName) || 
				"store_id".equals(columnName) || "store_name".equals(columnName) || "store_phone".equals(columnName))
             QueryString = columnName + " like '%" + value + "%'";
		else if("store_date".equals(columnName))
			QueryString = "to_char(" + columnName + ",'yyyy-mm-dd')='" + value + "'";
		else if("store_phone".equals(columnName))
			QueryString = columnName + "=" +value;
		return QueryString + " ";
	}
	
	public static String getWhereCondition(Map<String , String[]> map){
		
		//所有key包裝成keyset
		Set<String> keys = map.keySet();
		StringBuffer whereCondition = new StringBuffer();
		
		int count = 0;
		// foreach在keys中撈出一個個key
		for (String key : keys) { 
			
			//從每個key中得到對應的value ，[0]代表只抓陣列的第一個值(輸入的值) ，input標籤的值放在陣列的第0項
			String value = map.get(key)[0];  
			//     是否空白                              是否是空字串                                 濾掉input標籤name屬性值為action
			if (value != null && value.trim().length() != 0	&& !"action".equals(key)) {
				//計數有幾個key
				count++;
				String aCondition = getStoreCompositeQueryString(key, value.trim());

				if (count == 1)
					whereCondition.append(" where " + aCondition);
				else
					whereCondition.append(" and " + aCondition);

				System.out.println("有送出查詢資料的欄位數count = " + count);
			}
		}
		
		return whereCondition.toString();
	}
	
	//========================For StoreCommitCompositeQuery
	public static String ScgetWhereCondition(Map<String , String[]> map){
		
		Set<String> keys = map.keySet();
		StringBuffer whereCondition = new StringBuffer();
		int count = 0;
		for (String key : keys) { 
			
			String value = map.get(key)[0];  
			if (value != null && value.trim().length() != 0	&& !"action".equals(key)) {
				count++;
				String aCondition = ScgetStoreCompositeQueryString(key, value.trim());

				if (count == 1)
					whereCondition.append(" where " + aCondition);
				else
					whereCondition.append(" and " + aCondition);

				System.out.println("有送出查詢資料的欄位數count = " + count);
			}
		}
		return whereCondition.toString();
	}
	
	
	public static String ScgetStoreCompositeQueryString(String columnName , String value){
		
		String QueryString = null;
		
		if("sc_id".equals(columnName) || "store_id".equals(columnName) || 
				"mem_id".equals(columnName) || "sc_content".equals(columnName))
             QueryString = columnName + " like '%" + value + "%'";
		else if("sc_time".equals(columnName))
			QueryString = "to_char(" + columnName + ",'yyyy-mm-dd')='" + value + "'";
		return QueryString + " ";
	}
	
}
