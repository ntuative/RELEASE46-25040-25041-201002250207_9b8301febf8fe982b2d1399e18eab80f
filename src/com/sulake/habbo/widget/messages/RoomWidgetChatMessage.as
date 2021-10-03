package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatMessage extends RoomWidgetMessage
   {
      
      public static const const_104:int = 0;
      
      public static const const_120:int = 1;
      
      public static const const_96:int = 2;
      
      public static const const_599:String = "RWCM_MESSAGE_CHAT";
       
      
      private var var_1175:int = 0;
      
      private var var_1864:String = "";
      
      private var var_182:String = "";
      
      public function RoomWidgetChatMessage(param1:String, param2:String, param3:int = 0, param4:String = "")
      {
         super(param1);
         var_182 = param2;
         var_1175 = param3;
         var_1864 = param4;
      }
      
      public function get recipientName() : String
      {
         return var_1864;
      }
      
      public function get chatType() : int
      {
         return var_1175;
      }
      
      public function get text() : String
      {
         return var_182;
      }
   }
}
