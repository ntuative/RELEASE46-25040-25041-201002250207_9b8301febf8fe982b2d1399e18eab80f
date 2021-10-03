package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionPollEvent extends RoomSessionEvent
   {
      
      public static const const_108:String = "RSPE_POLL_CONTENT";
      
      public static const const_102:String = "RSPE_POLL_OFFER";
      
      public static const const_60:String = "RSPE_POLL_ERROR";
       
      
      private var var_949:Array = null;
      
      private var var_1136:String = "";
      
      private var var_1257:String;
      
      private var var_1137:String = "";
      
      private var var_950:int = 0;
      
      private var _id:int = -1;
      
      public function RoomSessionPollEvent(param1:String, param2:IRoomSession, param3:int)
      {
         _id = param3;
         super(param1,param2);
      }
      
      public function get questionArray() : Array
      {
         return var_949;
      }
      
      public function get startMessage() : String
      {
         return var_1136;
      }
      
      public function get summary() : String
      {
         return var_1257;
      }
      
      public function set startMessage(param1:String) : void
      {
         var_1136 = param1;
      }
      
      public function set numQuestions(param1:int) : void
      {
         var_950 = param1;
      }
      
      public function set summary(param1:String) : void
      {
         var_1257 = param1;
      }
      
      public function get numQuestions() : int
      {
         return var_950;
      }
      
      public function set endMessage(param1:String) : void
      {
         var_1137 = param1;
      }
      
      public function get endMessage() : String
      {
         return var_1137;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set questionArray(param1:Array) : void
      {
         var_949 = param1;
      }
   }
}
