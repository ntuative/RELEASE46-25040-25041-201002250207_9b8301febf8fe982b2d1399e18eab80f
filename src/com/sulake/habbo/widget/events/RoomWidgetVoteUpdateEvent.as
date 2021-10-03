package com.sulake.habbo.widget.events
{
   public class RoomWidgetVoteUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_128:String = "RWPUE_VOTE_RESULT";
      
      public static const const_106:String = "RWPUE_VOTE_QUESTION";
       
      
      private var var_1118:int;
      
      private var var_1011:String;
      
      private var var_684:Array;
      
      private var var_938:Array;
      
      public function RoomWidgetVoteUpdateEvent(param1:String, param2:String, param3:Array, param4:Array = null, param5:int = 0, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_1011 = param2;
         var_938 = param3;
         var_684 = param4;
         if(var_684 == null)
         {
            var_684 = [];
         }
         var_1118 = param5;
      }
      
      public function get votes() : Array
      {
         return var_684.slice();
      }
      
      public function get totalVotes() : int
      {
         return var_1118;
      }
      
      public function get question() : String
      {
         return var_1011;
      }
      
      public function get choices() : Array
      {
         return var_938.slice();
      }
   }
}
