package com.sulake.habbo.widget.events
{
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class RoomWidgetRoomViewUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_679:String = "RWRVUE_ROOM_VIEW_POSITION_CHANGED";
      
      public static const const_706:String = "RWRVUE_ROOM_VIEW_SCALE_CHANGED";
      
      public static const const_267:String = "RWRVUE_ROOM_VIEW_SIZE_CHANGED";
       
      
      private var var_1420:Point;
      
      private var var_1419:Rectangle;
      
      private var var_198:Number = 0;
      
      public function RoomWidgetRoomViewUpdateEvent(param1:String, param2:Rectangle = null, param3:Point = null, param4:Number = 0, param5:Boolean = false, param6:Boolean = false)
      {
         super(param1,param5,param6);
         var_1419 = param2;
         var_1420 = param3;
         var_198 = param4;
      }
      
      public function get rect() : Rectangle
      {
         if(var_1419 != null)
         {
            return var_1419.clone();
         }
         return null;
      }
      
      public function get scale() : Number
      {
         return var_198;
      }
      
      public function get positionDelta() : Point
      {
         if(var_1420 != null)
         {
            return var_1420.clone();
         }
         return null;
      }
   }
}
