package com.sulake.habbo.communication.messages.parser.poll
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoteResultMessageParser implements IMessageParser
   {
       
      
      private var var_1118:int;
      
      private var var_1011:String;
      
      private var var_684:Array;
      
      private var var_938:Array;
      
      public function VoteResultMessageParser()
      {
         super();
      }
      
      public function get votes() : Array
      {
         return var_684.slice();
      }
      
      public function flush() : Boolean
      {
         var_1011 = "";
         var_938 = [];
         var_684 = [];
         var_1118 = 0;
         return true;
      }
      
      public function get totalVotes() : int
      {
         return var_1118;
      }
      
      public function get question() : String
      {
         return var_1011;
      }
      
      public function get choices() : Array
      {
         return var_938.slice();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1011 = param1.readString();
         var_938 = [];
         var_684 = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            param1.readInteger();
            var_938.push(param1.readString());
            var_684.push(param1.readInteger());
            _loc3_++;
         }
         var_1118 = param1.readInteger();
         return true;
      }
   }
}
