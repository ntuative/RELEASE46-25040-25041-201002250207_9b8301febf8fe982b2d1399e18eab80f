package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var var_566:String;
      
      private var var_2313:String;
      
      private var var_2309:int;
      
      private var var_2311:int;
      
      private var var_1164:String;
      
      private var var_1345:String;
      
      private var _name:String;
      
      private var var_487:int;
      
      private var var_857:int;
      
      private var var_2312:int;
      
      private var var_1592:int;
      
      private var var_2310:String;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function get directMail() : int
      {
         return this.var_2311;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get realName() : String
      {
         return this.var_1345;
      }
      
      public function get customData() : String
      {
         return this.var_2313;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_487;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2309;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2310;
      }
      
      public function get figure() : String
      {
         return this.var_566;
      }
      
      public function get respectTotal() : int
      {
         return this.var_1592;
      }
      
      public function get sex() : String
      {
         return this.var_1164;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this.var_566 = param1.readString();
         this.var_1164 = param1.readString();
         this.var_2313 = param1.readString();
         this.var_1345 = param1.readString();
         this.var_2312 = param1.readInteger();
         this.var_2310 = param1.readString();
         this.var_2309 = param1.readInteger();
         this.var_2311 = param1.readInteger();
         this.var_1592 = param1.readInteger();
         this.var_857 = param1.readInteger();
         this.var_487 = param1.readInteger();
         return true;
      }
      
      public function get tickets() : int
      {
         return this.var_2312;
      }
      
      public function get respectLeft() : int
      {
         return this.var_857;
      }
   }
}
