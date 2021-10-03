package com.sulake.habbo.toolbar
{
   public class MenuSettingsItem
   {
       
      
      private var var_1606:Array;
      
      private var var_1605:String;
      
      private var var_1607:Boolean;
      
      public function MenuSettingsItem(param1:String, param2:Array = null, param3:Boolean = false)
      {
         super();
         var_1605 = param1;
         var_1606 = param2;
         var_1607 = param3;
      }
      
      public function get menuId() : String
      {
         return var_1605;
      }
      
      public function get yieldList() : Array
      {
         return var_1606;
      }
      
      public function get lockToIcon() : Boolean
      {
         return var_1607;
      }
   }
}
