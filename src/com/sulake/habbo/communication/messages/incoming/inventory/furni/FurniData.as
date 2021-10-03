package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_1359:String;
      
      private var var_1040:String;
      
      private var var_2070:Boolean;
      
      private var var_1500:int;
      
      private var var_1787:int;
      
      private var var_2069:Boolean;
      
      private var var_1649:String = "";
      
      private var var_1874:Boolean;
      
      private var _category:int;
      
      private var _objId:int;
      
      private var var_1185:int;
      
      private var var_1876:Boolean;
      
      private var var_1773:int = -1;
      
      private var var_1872:int;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         var_1787 = param1;
         var_1040 = param2;
         _objId = param3;
         var_1185 = param4;
         _category = param5;
         var_1359 = param6;
         var_2070 = param7;
         var_1874 = param8;
         var_1876 = param9;
         var_2069 = param10;
         var_1872 = param11;
      }
      
      public function get slotId() : String
      {
         return var_1649;
      }
      
      public function get extra() : int
      {
         return var_1500;
      }
      
      public function get classId() : int
      {
         return var_1185;
      }
      
      public function get category() : int
      {
         return _category;
      }
      
      public function get isSellable() : Boolean
      {
         return var_2069;
      }
      
      public function get isGroupable() : Boolean
      {
         return var_2070;
      }
      
      public function get stripId() : int
      {
         return var_1787;
      }
      
      public function get stuffData() : String
      {
         return var_1359;
      }
      
      public function get songId() : int
      {
         return var_1773;
      }
      
      public function setExtraData(param1:String, param2:int) : void
      {
         var_1649 = param1;
         var_1500 = param2;
      }
      
      public function get itemType() : String
      {
         return var_1040;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get expiryTime() : int
      {
         return var_1872;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_1876;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_1874;
      }
   }
}
