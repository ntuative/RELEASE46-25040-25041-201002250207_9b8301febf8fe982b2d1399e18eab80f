package com.sulake.habbo.avatar.animation
{
   public class AddDataContainer
   {
       
      
      private var var_1401:String;
      
      private var var_1556:String;
      
      private var var_955:String;
      
      private var var_393:Number = 1;
      
      private var _id:String;
      
      public function AddDataContainer(param1:XML)
      {
         super();
         _id = String(param1.@id);
         var_1401 = String(param1.@align);
         var_955 = String(param1.@base);
         var_1556 = String(param1.@ink);
         var _loc2_:String = String(param1.@blend);
         if(_loc2_.length > 0)
         {
            var_393 = Number(_loc2_);
            if(var_393 > 1)
            {
               var_393 /= 100;
            }
         }
      }
      
      public function get align() : String
      {
         return var_1401;
      }
      
      public function get ink() : String
      {
         return var_1556;
      }
      
      public function get base() : String
      {
         return var_955;
      }
      
      public function get isBlended() : Boolean
      {
         return var_393 != 1;
      }
      
      public function get blend() : Number
      {
         return var_393;
      }
      
      public function get id() : String
      {
         return _id;
      }
   }
}
