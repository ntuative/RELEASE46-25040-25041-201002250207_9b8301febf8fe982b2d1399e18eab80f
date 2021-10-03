package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_2127:Number;
      
      private var var_587:Number = 0;
      
      private var var_2128:Number;
      
      private var var_586:Number;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         var_2127 = param1;
         var_2128 = param2;
      }
      
      public function update() : void
      {
         var_586 += var_2128;
         var_587 += var_586;
         if(var_587 > 0)
         {
            var_587 = 0;
            var_586 = var_2127 * -1 * var_586;
         }
      }
      
      public function reset(param1:int) : void
      {
         var_586 = param1;
         var_587 = 0;
      }
      
      public function get location() : Number
      {
         return var_587;
      }
   }
}
