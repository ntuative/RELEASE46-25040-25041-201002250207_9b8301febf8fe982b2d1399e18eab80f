package com.sulake.core.communication.util
{
   import flash.utils.ByteArray;
   
   public class Short
   {
       
      
      private var var_633:ByteArray;
      
      public function Short(param1:int)
      {
         super();
         var_633 = new ByteArray();
         var_633.writeShort(param1);
         var_633.position = 0;
      }
      
      public function get value() : int
      {
         var _loc1_:int = 0;
         var_633.position = 0;
         if(false)
         {
            _loc1_ = var_633.readShort();
            var_633.position = 0;
         }
         return _loc1_;
      }
   }
}
