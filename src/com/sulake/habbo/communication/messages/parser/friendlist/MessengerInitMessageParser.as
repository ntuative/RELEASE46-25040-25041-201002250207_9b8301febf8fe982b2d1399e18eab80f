package com.sulake.habbo.communication.messages.parser.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendCategoryData;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendData;
   
   public class MessengerInitMessageParser implements IMessageParser
   {
       
      
      private var var_2292:int;
      
      private var var_2293:int;
      
      private var var_2290:int;
      
      private var var_214:Array;
      
      private var var_2291:int;
      
      private var var_2294:int;
      
      private var var_13:Array;
      
      public function MessengerInitMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_13 = new Array();
         this.var_214 = new Array();
         return true;
      }
      
      public function get extendedFriendLimit() : int
      {
         return this.var_2292;
      }
      
      public function get friends() : Array
      {
         return this.var_214;
      }
      
      public function get normalFriendLimit() : int
      {
         return this.var_2290;
      }
      
      public function get categories() : Array
      {
         return this.var_13;
      }
      
      public function get friendRequestLimit() : int
      {
         return this.var_2293;
      }
      
      public function get userFriendLimit() : int
      {
         return this.var_2294;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:int = 0;
         this.var_2294 = param1.readInteger();
         this.var_2290 = param1.readInteger();
         this.var_2292 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            this.var_13.push(new FriendCategoryData(param1));
            _loc4_++;
         }
         var _loc3_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            this.var_214.push(new FriendData(param1));
            _loc4_++;
         }
         this.var_2293 = param1.readInteger();
         this.var_2291 = param1.readInteger();
         return true;
      }
      
      public function get friendRequestCount() : int
      {
         return this.var_2291;
      }
   }
}
