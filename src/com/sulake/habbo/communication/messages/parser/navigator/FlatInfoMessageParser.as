package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomSettingsFlatInfo;
   
   public class FlatInfoMessageParser implements IMessageParser
   {
       
      
      private var var_211:RoomSettingsFlatInfo;
      
      public function FlatInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_211 = null;
         return true;
      }
      
      public function get flatInfo() : RoomSettingsFlatInfo
      {
         return var_211;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_211 = new RoomSettingsFlatInfo();
         var_211.allowFurniMoving = param1.readInteger() == 1;
         var_211.doorMode = param1.readInteger();
         var_211.id = param1.readInteger();
         var_211.ownerName = param1.readString();
         var_211.type = param1.readString();
         var_211.name = param1.readString();
         var_211.description = param1.readString();
         var_211.showOwnerName = param1.readInteger() == 1;
         var_211.allowTrading = param1.readInteger() == 1;
         var_211.categoryAlertKey = param1.readInteger() == 1;
         return true;
      }
   }
}
