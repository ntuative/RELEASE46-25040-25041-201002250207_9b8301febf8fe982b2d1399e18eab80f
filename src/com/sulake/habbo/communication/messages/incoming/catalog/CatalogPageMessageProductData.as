package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_203:String = "e";
      
      public static const const_75:String = "i";
      
      public static const const_74:String = "s";
       
      
      private var var_937:String;
      
      private var var_1116:String;
      
      private var var_1117:int;
      
      private var var_2236:int;
      
      private var var_936:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         var_1116 = param1.readString();
         var_2236 = param1.readInteger();
         var_937 = param1.readString();
         var_936 = param1.readInteger();
         var_1117 = param1.readInteger();
      }
      
      public function get productCount() : int
      {
         return var_936;
      }
      
      public function get productType() : String
      {
         return var_1116;
      }
      
      public function get expiration() : int
      {
         return var_1117;
      }
      
      public function get furniClassId() : int
      {
         return var_2236;
      }
      
      public function get extraParam() : String
      {
         return var_937;
      }
   }
}
