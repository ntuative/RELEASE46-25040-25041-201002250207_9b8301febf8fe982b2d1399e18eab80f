package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var var_566:String;
      
      private var var_1347:String;
      
      private var var_1348:String;
      
      private var var_1258:int;
      
      private var var_1048:int;
      
      private var var_1345:String;
      
      private var _name:String;
      
      private var var_1346:Boolean;
      
      private var var_693:Boolean;
      
      private var _id:int;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this.var_1048 = param1.readInteger();
         this.var_693 = param1.readBoolean();
         this.var_1346 = param1.readBoolean();
         this.var_566 = param1.readString();
         this.var_1258 = param1.readInteger();
         this.var_1348 = param1.readString();
         this.var_1347 = param1.readString();
         this.var_1345 = param1.readString();
      }
      
      public function get gender() : int
      {
         return var_1048;
      }
      
      public function get realName() : String
      {
         return var_1345;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get motto() : String
      {
         return var_1348;
      }
      
      public function get categoryId() : int
      {
         return var_1258;
      }
      
      public function get online() : Boolean
      {
         return var_693;
      }
      
      public function get followingAllowed() : Boolean
      {
         return var_1346;
      }
      
      public function get lastAccess() : String
      {
         return var_1347;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get figure() : String
      {
         return var_566;
      }
   }
}
