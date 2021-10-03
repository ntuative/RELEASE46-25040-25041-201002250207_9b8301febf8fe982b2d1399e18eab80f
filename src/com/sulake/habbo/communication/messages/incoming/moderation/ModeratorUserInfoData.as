package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ModeratorUserInfoData
   {
       
      
      private var var_2221:int;
      
      private var var_2222:int;
      
      private var var_2219:int;
      
      private var _userName:String;
      
      private var var_2223:int;
      
      private var var_2220:int;
      
      private var var_2218:int;
      
      private var _userId:int;
      
      private var var_693:Boolean;
      
      public function ModeratorUserInfoData(param1:IMessageDataWrapper)
      {
         super();
         _userId = param1.readInteger();
         _userName = param1.readString();
         var_2220 = param1.readInteger();
         var_2223 = param1.readInteger();
         var_693 = param1.readBoolean();
         var_2219 = param1.readInteger();
         var_2222 = param1.readInteger();
         var_2221 = param1.readInteger();
         var_2218 = param1.readInteger();
      }
      
      public function get banCount() : int
      {
         return var_2218;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
      
      public function get online() : Boolean
      {
         return var_693;
      }
      
      public function get minutesSinceLastLogin() : int
      {
         return var_2223;
      }
      
      public function get abusiveCfhCount() : int
      {
         return var_2222;
      }
      
      public function get cautionCount() : int
      {
         return var_2221;
      }
      
      public function get cfhCount() : int
      {
         return var_2219;
      }
      
      public function get minutesSinceRegistration() : int
      {
         return var_2220;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
   }
}
