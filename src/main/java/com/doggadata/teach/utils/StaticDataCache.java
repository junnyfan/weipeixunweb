package com.doggadata.teach.utils;

public class StaticDataCache {
	
	
	private static StaticDataCache instance=null;

	private StaticDataCache(){}

	public static StaticDataCache getInstance(){
	if(instance == null)
	instance= new StaticDataCache();
	return instance;
	}
	private LRUCacheHashMap cachMap=new LRUCacheHashMap(10);
	private  LRUCache<String, Object> cach=new LRUCache<String, Object>(10);

	public void putCachMap(String key,Object value){
		cach.put(key, value);
	}
	public boolean isCachMapContain(String key){
		if(cach.get(key)!=null)
			return true;
		else
			return false;
	}
	public LRUCacheHashMap getCachMap(){
		return cachMap;
	}
	public void putCache(String key,Object value){
		if(cach.get(key)==null)
			cach.put(key, value);
	}
	public Object getCache(String key){
		if(cach.get(key)==null)
			return null;
		else
			return cach.get(key);
	}
	public LRUCache<String, Object> getCache() {
		return cach;
	}
	
	public void clear(){
		cach.clear();
	}

}
