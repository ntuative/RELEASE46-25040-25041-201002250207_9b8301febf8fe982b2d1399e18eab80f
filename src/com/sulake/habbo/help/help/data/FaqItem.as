package com.sulake.habbo.help.help.data
{
   public class FaqItem
   {
       
      
      private var var_1286:int;
      
      private var var_1285:String;
      
      private var var_1869:String;
      
      private var _index:int;
      
      private var var_1870:Boolean = false;
      
      private var _category:FaqCategory;
      
      public function FaqItem(param1:int, param2:String, param3:int, param4:FaqCategory)
      {
         super();
         var_1286 = param1;
         var_1869 = param2;
         _index = param3;
         _category = param4;
      }
      
      public function get answerText() : String
      {
         return var_1285;
      }
      
      public function get questionId() : int
      {
         return var_1286;
      }
      
      public function get questionText() : String
      {
         return var_1869;
      }
      
      public function set answerText(param1:String) : void
      {
         var_1285 = param1;
         var_1870 = true;
      }
      
      public function get hasAnswer() : Boolean
      {
         return var_1870;
      }
      
      public function get category() : FaqCategory
      {
         return _category;
      }
      
      public function get index() : int
      {
         return _index;
      }
   }
}
