package com.sulake.room.renderer.utils
{
   public class ObjectMouseData
   {
       
      
      private var var_1662:String = "";
      
      private var var_145:String = "";
      
      public function ObjectMouseData()
      {
         super();
      }
      
      public function set spriteTag(param1:String) : void
      {
         var_1662 = param1;
      }
      
      public function set objectId(param1:String) : void
      {
         var_145 = param1;
      }
      
      public function get spriteTag() : String
      {
         return var_1662;
      }
      
      public function get objectId() : String
      {
         return var_145;
      }
   }
}
