package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var var_1726:Boolean = false;
      
      private var var_1724:Boolean = false;
      
      private var var_1662:String = "";
      
      private var _type:String = "";
      
      private var var_1725:Boolean = false;
      
      private var var_1899:Number = 0;
      
      private var var_1901:Number = 0;
      
      private var var_1898:Number = 0;
      
      private var var_1897:String = "";
      
      private var var_1900:Number = 0;
      
      private var var_1723:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:Number, param5:Number, param6:Number = 0, param7:Number = 0, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false)
      {
         super();
         _type = param1;
         var_1897 = param2;
         var_1662 = param3;
         var_1901 = param4;
         var_1898 = param5;
         var_1899 = param6;
         var_1900 = param7;
         var_1723 = param8;
         var_1724 = param9;
         var_1725 = param10;
         var_1726 = param11;
      }
      
      public function get ctrlKey() : Boolean
      {
         return var_1723;
      }
      
      public function get buttonDown() : Boolean
      {
         return var_1726;
      }
      
      public function get localX() : Number
      {
         return var_1899;
      }
      
      public function get localY() : Number
      {
         return var_1900;
      }
      
      public function get canvasId() : String
      {
         return var_1897;
      }
      
      public function get altKey() : Boolean
      {
         return var_1724;
      }
      
      public function get spriteTag() : String
      {
         return var_1662;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function get screenX() : Number
      {
         return var_1901;
      }
      
      public function get screenY() : Number
      {
         return var_1898;
      }
      
      public function get shiftKey() : Boolean
      {
         return var_1725;
      }
   }
}
