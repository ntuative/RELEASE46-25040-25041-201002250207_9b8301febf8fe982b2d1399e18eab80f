package com.sulake.habbo.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_187:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_1913:Boolean = false;
      
      private var var_1915:int = 0;
      
      private var var_1916:int = 0;
      
      private var var_1914:int = 0;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:Boolean = false, param6:Boolean = false)
      {
         super(const_187,param5,param6);
         var_1914 = param1;
         var_1916 = param2;
         var_1915 = param3;
         var_1913 = param4;
      }
      
      public function get pastPeriods() : int
      {
         return var_1915;
      }
      
      public function get periodsLeft() : int
      {
         return var_1916;
      }
      
      public function get daysLeft() : int
      {
         return var_1914;
      }
      
      public function get allowClubDances() : Boolean
      {
         return var_1913;
      }
   }
}
