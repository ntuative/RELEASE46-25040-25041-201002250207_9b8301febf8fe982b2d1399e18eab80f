package com.sulake.habbo.widget.messages
{
   public class RoomWidgetStickieSendUpdateMessage extends RoomWidgetMessage
   {
      
      public static const const_373:String = "RWSUM_STICKIE_SEND_UPDATE";
      
      public static const const_503:String = "RWSUM_STICKIE_SEND_DELETE";
       
      
      private var var_669:String;
      
      private var var_145:int;
      
      private var var_182:String;
      
      public function RoomWidgetStickieSendUpdateMessage(param1:String, param2:int, param3:String = "", param4:String = "")
      {
         super(param1);
         var_145 = param2;
         var_182 = param3;
         var_669 = param4;
      }
      
      public function get objectId() : int
      {
         return var_145;
      }
      
      public function get text() : String
      {
         return var_182;
      }
      
      public function get colorHex() : String
      {
         return var_669;
      }
   }
}
