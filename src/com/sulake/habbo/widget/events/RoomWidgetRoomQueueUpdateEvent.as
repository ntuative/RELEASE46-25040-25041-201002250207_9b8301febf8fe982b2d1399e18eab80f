package com.sulake.habbo.widget.events
{
   public class RoomWidgetRoomQueueUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_434:String = "RWRQUE_SPECTATOR_QUEUE_STATUS";
      
      public static const const_322:String = "RWRQUE_VISITOR_QUEUE_STATUS";
       
      
      private var var_849:int;
      
      private var var_269:Boolean;
      
      private var var_2026:Boolean;
      
      private var var_1388:Boolean;
      
      public function RoomWidgetRoomQueueUpdateEvent(param1:String, param2:int, param3:Boolean, param4:Boolean, param5:Boolean, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_849 = param2;
         var_2026 = param3;
         var_269 = param4;
         var_1388 = param5;
      }
      
      public function get position() : int
      {
         return var_849;
      }
      
      public function get isActive() : Boolean
      {
         return var_269;
      }
      
      public function get isClubQueue() : Boolean
      {
         return var_1388;
      }
      
      public function get hasHabboClub() : Boolean
      {
         return var_2026;
      }
   }
}
