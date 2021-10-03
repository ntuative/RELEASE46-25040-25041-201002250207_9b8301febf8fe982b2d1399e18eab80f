package com.sulake.habbo.avatar.alias
{
   public class AssetAlias
   {
       
      
      private var var_960:Boolean;
      
      private var _name:String;
      
      private var var_2047:String;
      
      private var var_961:Boolean;
      
      public function AssetAlias(param1:XML)
      {
         super();
         _name = String(param1.@name);
         var_2047 = String(param1.@link);
         var_961 = Boolean(parseInt(param1.@fliph));
         var_960 = Boolean(parseInt(param1.@flipv));
      }
      
      public function get flipH() : Boolean
      {
         return var_961;
      }
      
      public function get flipV() : Boolean
      {
         return var_960;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get link() : String
      {
         return var_2047;
      }
   }
}
