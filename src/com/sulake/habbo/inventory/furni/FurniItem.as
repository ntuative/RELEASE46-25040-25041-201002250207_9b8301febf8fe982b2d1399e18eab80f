package com.sulake.habbo.inventory.furni
{
   import flash.display.BitmapData;
   
   public class FurniItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var var_1787:int;
      
      private var var_1874:Boolean;
      
      private var var_1773:int;
      
      private var var_1359:String;
      
      private var var_1873:Boolean = false;
      
      private var var_1872:int;
      
      private var var_431:int;
      
      private var var_1040:String;
      
      private var var_1649:String;
      
      private var _image:BitmapData;
      
      private var _objId:int;
      
      private var var_1185:int;
      
      private var var_1876:Boolean;
      
      private var var_1875:int;
      
      public function FurniItem(param1:int, param2:String, param3:int, param4:int, param5:String, param6:Boolean, param7:Boolean, param8:int, param9:String, param10:int)
      {
         super();
         var_1787 = param1;
         var_1040 = param2;
         _objId = param3;
         var_1185 = param4;
         var_1359 = param5;
         var_1874 = param6;
         var_1876 = param7;
         var_1872 = param8;
         var_1649 = param9;
         var_1773 = param10;
         var_431 = -1;
      }
      
      public function get songId() : int
      {
         return var_1773;
      }
      
      public function get iconCallbackId() : int
      {
         return var_431;
      }
      
      public function get expiryTime() : int
      {
         return var_1872;
      }
      
      public function set prevCallbackId(param1:int) : void
      {
         var_1875 = param1;
      }
      
      public function set isLocked(param1:Boolean) : void
      {
         var_1873 = param1;
      }
      
      public function set iconCallbackId(param1:int) : void
      {
         var_431 = param1;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_1876;
      }
      
      public function get slotId() : String
      {
         return var_1649;
      }
      
      public function get classId() : int
      {
         return var_1185;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_1874;
      }
      
      public function get stuffData() : String
      {
         return var_1359;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
      }
      
      public function get stripId() : int
      {
         return var_1787;
      }
      
      public function get isLocked() : Boolean
      {
         return var_1873;
      }
      
      public function get prevCallbackId() : int
      {
         return var_1875;
      }
      
      public function get iconImage() : BitmapData
      {
         return _image;
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get itemType() : String
      {
         return var_1040;
      }
   }
}
