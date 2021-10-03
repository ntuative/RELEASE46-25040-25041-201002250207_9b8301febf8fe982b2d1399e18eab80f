package com.sulake.habbo.navigator
{
   import com.sulake.core.window.components.ITextWindow;
   
   public class CutToWidth implements BinarySearchTest
   {
       
      
      private var var_423:int;
      
      private var var_174:String;
      
      private var var_182:ITextWindow;
      
      public function CutToWidth()
      {
         super();
      }
      
      public function beforeSearch(param1:String, param2:ITextWindow, param3:int) : void
      {
         var_174 = param1;
         var_182 = param2;
         var_423 = param3;
      }
      
      public function test(param1:int) : Boolean
      {
         var_182.text = var_174.substring(0,param1) + "...";
         return var_182.textWidth > var_423;
      }
   }
}
