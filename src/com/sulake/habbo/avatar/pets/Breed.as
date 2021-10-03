package com.sulake.habbo.avatar.pets
{
   public class Breed extends PetEditorInfo implements IBreed
   {
       
      
      private var var_1048:String;
      
      private var _id:int;
      
      private var var_1684:String = "";
      
      private var var_1683:int;
      
      private var var_1685:String;
      
      private var var_1686:Boolean;
      
      public function Breed(param1:XML)
      {
         super(param1);
         _id = parseInt(param1.@id);
         var_1683 = parseInt(param1.@pattern);
         var_1048 = String(param1.@gender);
         var_1686 = Boolean(parseInt(param1.@colorable));
         var_1684 = String(param1.@localizationKey);
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get localizationKey() : String
      {
         return var_1684;
      }
      
      public function get isColorable() : Boolean
      {
         return var_1686;
      }
      
      public function get gender() : String
      {
         return var_1048;
      }
      
      public function get patternId() : int
      {
         return var_1683;
      }
      
      public function get avatarFigureString() : String
      {
         return var_1685;
      }
      
      public function set avatarFigureString(param1:String) : void
      {
         var_1685 = param1;
      }
   }
}
