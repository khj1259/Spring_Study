package com.ssafy.util;


public class ContextPath{

    private static ContextPath instance;
    private final String path;
    public static void createInstance(String path){
          instance=new ContextPath(path);
   }

   private ContextPath(String path){
          this.path=path;
   }

   public static ContextPath getInstance(){
         if(instance==null)
                 throw new NullPointerException();
         else
                 return instance;
   }
   
   public static boolean instancechk() {
	   if(instance == null) 
		   return true;
	   else 
		   return false;
   }

   public String getPath(){
         return path;
    }

}