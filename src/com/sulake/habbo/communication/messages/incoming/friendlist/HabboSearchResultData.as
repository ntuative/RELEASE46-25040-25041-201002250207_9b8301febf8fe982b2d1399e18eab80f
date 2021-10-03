package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2325:Boolean;
      
      private var var_2327:int;
      
      private var var_2326:Boolean;
      
      private var var_1506:String;
      
      private var var_1345:String;
      
      private var var_1743:int;
      
      private var var_2013:String;
      
      private var var_2324:String;
      
      private var var_2012:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1743 = param1.readInteger();
         this.var_1506 = param1.readString();
         this.var_2013 = param1.readString();
         this.var_2325 = param1.readBoolean();
         this.var_2326 = param1.readBoolean();
         param1.readString();
         this.var_2327 = param1.readInteger();
         this.var_2012 = param1.readString();
         this.var_2324 = param1.readString();
         this.var_1345 = param1.readString();
      }
      
      public function get realName() : String
      {
         return this.var_1345;
      }
      
      public function get avatarName() : String
      {
         return this.var_1506;
      }
      
      public function get avatarId() : int
      {
         return this.var_1743;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2325;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2324;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_2012;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2326;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_2013;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2327;
      }
   }
}
