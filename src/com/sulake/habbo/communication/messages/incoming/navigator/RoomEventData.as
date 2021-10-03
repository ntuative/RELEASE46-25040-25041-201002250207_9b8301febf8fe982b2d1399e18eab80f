package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomEventData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1595:String;
      
      private var var_372:int;
      
      private var var_1596:String;
      
      private var var_1598:String;
      
      private var var_1594:int;
      
      private var var_1597:String;
      
      private var var_1593:int;
      
      private var var_616:Array;
      
      private var var_1030:Boolean;
      
      public function RoomEventData(param1:IMessageDataWrapper)
      {
         var _loc5_:* = null;
         var_616 = new Array();
         super();
         var _loc2_:String = param1.readString();
         if(_loc2_ == "-1")
         {
            Logger.log("Got null room event");
            this.var_1030 = false;
            return;
         }
         this.var_1030 = true;
         var_1594 = int(_loc2_);
         var_1596 = param1.readString();
         var_372 = int(param1.readString());
         var_1593 = param1.readInteger();
         var_1595 = param1.readString();
         var_1598 = param1.readString();
         var_1597 = param1.readString();
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readString();
            var_616.push(_loc5_);
            _loc4_++;
         }
      }
      
      public function get eventType() : int
      {
         return var_1593;
      }
      
      public function get eventName() : String
      {
         return var_1595;
      }
      
      public function get eventDescription() : String
      {
         return var_1598;
      }
      
      public function get ownerAvatarName() : String
      {
         return var_1596;
      }
      
      public function get tags() : Array
      {
         return var_616;
      }
      
      public function get creationTime() : String
      {
         return var_1597;
      }
      
      public function get exists() : Boolean
      {
         return var_1030;
      }
      
      public function get ownerAvatarId() : int
      {
         return var_1594;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
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
      
      public function get flatId() : int
      {
         return var_372;
      }
   }
}
