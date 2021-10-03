package com.sulake.room.events
{
   public class RoomObjectMouseEvent extends RoomObjectEvent
   {
      
      public static const const_1492:String = "ROE_MOUSE_LEAVE";
      
      public static const const_1574:String = "ROE_MOUSE_ENTER";
      
      public static const const_358:String = "ROE_MOUSE_MOVE";
      
      public static const const_1554:String = "ROE_MOUSE_DOUBLE_CLICK";
      
      public static const const_210:String = "ROE_MOUSE_CLICK";
      
      public static const const_461:String = "ROE_MOUSE_DOWN";
       
      
      private var var_1725:Boolean;
      
      private var var_1726:Boolean;
      
      private var var_1724:Boolean;
      
      private var var_1723:Boolean;
      
      public function RoomObjectMouseEvent(param1:String, param2:int, param3:String, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false)
      {
         super(param1,param2,param3,param8,param9);
         var_1724 = param4;
         var_1723 = param5;
         var_1725 = param6;
         var_1726 = param7;
      }
      
      public function get buttonDown() : Boolean
      {
         return var_1726;
      }
      
      public function get altKey() : Boolean
      {
         return var_1724;
      }
      
      public function get ctrlKey() : Boolean
      {
         return var_1723;
      }
      
      public function get shiftKey() : Boolean
      {
         return var_1725;
      }
   }
}
