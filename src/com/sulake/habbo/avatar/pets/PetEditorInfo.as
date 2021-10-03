package com.sulake.habbo.avatar.pets
{
   public class PetEditorInfo
   {
       
      
      private var var_1808:Boolean;
      
      private var var_1809:Boolean;
      
      public function PetEditorInfo(param1:XML)
      {
         super();
         var_1808 = Boolean(parseInt(param1.@club));
         var_1809 = Boolean(parseInt(param1.@selectable));
      }
      
      public function get isClub() : Boolean
      {
         return var_1808;
      }
      
      public function get isSelectable() : Boolean
      {
         return var_1809;
      }
   }
}
