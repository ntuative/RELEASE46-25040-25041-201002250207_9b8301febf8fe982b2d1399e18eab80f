package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RoomDimmerSavePresetMessageComposer implements IMessageComposer
   {
       
      
      private var var_1655:int;
      
      private var var_1654:int;
      
      private var var_1656:Boolean;
      
      private var var_1657:String;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_1653:int;
      
      public function RoomDimmerSavePresetMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:Boolean, param6:int = 0, param7:int = 0)
      {
         super();
         _roomId = param6;
         _roomCategory = param7;
         var_1654 = param1;
         var_1655 = param2;
         var_1657 = param3;
         var_1653 = param4;
         var_1656 = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1654,var_1655,var_1657,var_1653,int(var_1656)];
      }
      
      public function dispose() : void
      {
      }
   }
}
