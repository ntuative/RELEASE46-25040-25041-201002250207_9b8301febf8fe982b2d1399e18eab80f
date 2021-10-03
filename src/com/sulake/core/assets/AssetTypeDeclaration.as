package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_2093:Class;
      
      private var var_2095:Class;
      
      private var var_2094:String;
      
      private var var_1301:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         var_2094 = param1;
         var_2095 = param2;
         var_2093 = param3;
         if(rest == null)
         {
            var_1301 = new Array();
         }
         else
         {
            var_1301 = rest;
         }
      }
      
      public function get loaderClass() : Class
      {
         return var_2093;
      }
      
      public function get assetClass() : Class
      {
         return var_2095;
      }
      
      public function get mimeType() : String
      {
         return var_2094;
      }
      
      public function get fileTypes() : Array
      {
         return var_1301;
      }
   }
}
