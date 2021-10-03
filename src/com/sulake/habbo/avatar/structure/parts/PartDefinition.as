package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var _removeSetType:String;
      
      private var var_1474:int = -1;
      
      private var var_1222:Boolean;
      
      private var var_1223:String;
      
      private var var_1886:String;
      
      public function PartDefinition(param1:XML)
      {
         super();
         var_1886 = String(param1["set-type"]);
         var_1223 = String(param1["flipped-set-type"]);
         _removeSetType = String(param1["remove-set-type"]);
         var_1222 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return var_1474 >= 0;
      }
      
      public function get flippedSetType() : String
      {
         return var_1223;
      }
      
      public function get staticId() : int
      {
         return var_1474;
      }
      
      public function set staticId(param1:int) : void
      {
         var_1474 = param1;
      }
      
      public function get appendToFigure() : Boolean
      {
         return var_1222;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         var_1222 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         var_1223 = param1;
      }
      
      public function get setType() : String
      {
         return var_1886;
      }
      
      public function get removeSetType() : String
      {
         return _removeSetType;
      }
   }
}
