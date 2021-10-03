package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_1593:int = 9;
      
      public static const const_1546:int = 4;
      
      public static const const_1530:int = 1;
      
      public static const const_1255:int = 10;
      
      public static const const_1533:int = 2;
      
      public static const const_1310:int = 7;
      
      public static const const_1170:int = 11;
      
      public static const const_1497:int = 3;
      
      public static const const_1345:int = 8;
      
      public static const const_1280:int = 5;
      
      public static const const_1548:int = 6;
      
      public static const const_1323:int = 12;
       
      
      private var var_2072:String;
      
      private var _roomId:int;
      
      private var var_1112:int;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get info() : String
      {
         return var_2072;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _roomId = param1.readInteger();
         var_1112 = param1.readInteger();
         var_2072 = param1.readString();
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_1112;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
   }
}
