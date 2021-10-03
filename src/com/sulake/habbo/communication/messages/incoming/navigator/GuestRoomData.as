package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1696:int;
      
      private var var_1702:String;
      
      private var var_1701:int;
      
      private var var_1704:int;
      
      private var var_708:Boolean;
      
      private var var_1700:Boolean;
      
      private var var_372:int;
      
      private var var_1236:String;
      
      private var var_1703:int;
      
      private var var_1258:int;
      
      private var _ownerName:String;
      
      private var var_625:String;
      
      private var var_1698:int;
      
      private var var_1699:RoomThumbnailData;
      
      private var var_1697:Boolean;
      
      private var var_616:Array;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         var_616 = new Array();
         super();
         var_372 = param1.readInteger();
         var_708 = param1.readBoolean();
         var_625 = param1.readString();
         _ownerName = param1.readString();
         var_1703 = param1.readInteger();
         var_1696 = param1.readInteger();
         var_1698 = param1.readInteger();
         var_1236 = param1.readString();
         var_1701 = param1.readInteger();
         var_1697 = param1.readBoolean();
         var_1704 = param1.readInteger();
         var_1258 = param1.readInteger();
         var_1702 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            var_616.push(_loc4_);
            _loc3_++;
         }
         var_1699 = new RoomThumbnailData(param1);
         var_1700 = param1.readBoolean();
      }
      
      public function get maxUserCount() : int
      {
         return var_1698;
      }
      
      public function get roomName() : String
      {
         return var_625;
      }
      
      public function get userCount() : int
      {
         return var_1696;
      }
      
      public function get score() : int
      {
         return var_1704;
      }
      
      public function get eventCreationTime() : String
      {
         return var_1702;
      }
      
      public function get allowTrading() : Boolean
      {
         return var_1697;
      }
      
      public function get tags() : Array
      {
         return var_616;
      }
      
      public function get allowPets() : Boolean
      {
         return var_1700;
      }
      
      public function get event() : Boolean
      {
         return var_708;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         this.var_616 = null;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get categoryId() : int
      {
         return var_1258;
      }
      
      public function get srchSpecPrm() : int
      {
         return var_1701;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return var_1699;
      }
      
      public function get doorMode() : int
      {
         return var_1703;
      }
      
      public function get flatId() : int
      {
         return var_372;
      }
      
      public function get description() : String
      {
         return var_1236;
      }
   }
}
