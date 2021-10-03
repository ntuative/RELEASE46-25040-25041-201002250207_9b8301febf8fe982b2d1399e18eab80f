package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   
   public class RoomEntryInfoMessageParser implements IMessageParser
   {
       
      
      private var var_2088:int;
      
      private var var_371:Boolean;
      
      private var var_2087:Boolean;
      
      private var var_876:PublicRoomShortData;
      
      public function RoomEntryInfoMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2087 = param1.readBoolean();
         if(var_2087)
         {
            var_2088 = param1.readInteger();
            var_371 = param1.readBoolean();
         }
         else
         {
            var_876 = new PublicRoomShortData(param1);
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         if(var_876 != null)
         {
            var_876.dispose();
            var_876 = null;
         }
         return true;
      }
      
      public function get guestRoomId() : int
      {
         return var_2088;
      }
      
      public function get owner() : Boolean
      {
         return var_371;
      }
      
      public function get guestRoom() : Boolean
      {
         return var_2087;
      }
      
      public function get publicSpace() : PublicRoomShortData
      {
         return var_876;
      }
   }
}
