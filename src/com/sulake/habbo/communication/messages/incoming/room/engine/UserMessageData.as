package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1204:String = "F";
      
      public static const const_962:String = "M";
       
      
      private var var_85:Number = 0;
      
      private var var_566:String = "";
      
      private var var_1986:int = 0;
      
      private var var_1984:String = "";
      
      private var var_1985:int = 0;
      
      private var var_1832:int = 0;
      
      private var var_1982:String = "";
      
      private var var_1164:String = "";
      
      private var _id:int = 0;
      
      private var var_199:Boolean = false;
      
      private var var_223:int = 0;
      
      private var var_1983:String = "";
      
      private var _name:String = "";
      
      private var var_1836:int = 0;
      
      private var _y:Number = 0;
      
      private var var_84:Number = 0;
      
      public function UserMessageData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get z() : Number
      {
         return var_84;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get dir() : int
      {
         return var_223;
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_199)
         {
            var_223 = param1;
         }
      }
      
      public function set name(param1:String) : void
      {
         if(!var_199)
         {
            _name = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get userType() : int
      {
         return var_1986;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!var_199)
         {
            var_1985 = param1;
         }
      }
      
      public function get subType() : String
      {
         return var_1983;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!var_199)
         {
            var_1982 = param1;
         }
      }
      
      public function set subType(param1:String) : void
      {
         if(!var_199)
         {
            var_1983 = param1;
         }
      }
      
      public function set xp(param1:int) : void
      {
         if(!var_199)
         {
            var_1832 = param1;
         }
      }
      
      public function set figure(param1:String) : void
      {
         if(!var_199)
         {
            var_566 = param1;
         }
      }
      
      public function set userType(param1:int) : void
      {
         if(!var_199)
         {
            var_1986 = param1;
         }
      }
      
      public function set sex(param1:String) : void
      {
         if(!var_199)
         {
            var_1164 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return var_1985;
      }
      
      public function get groupID() : String
      {
         return var_1982;
      }
      
      public function set webID(param1:int) : void
      {
         if(!var_199)
         {
            var_1836 = param1;
         }
      }
      
      public function set custom(param1:String) : void
      {
         if(!var_199)
         {
            var_1984 = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_199 = true;
      }
      
      public function get sex() : String
      {
         return var_1164;
      }
      
      public function get figure() : String
      {
         return var_566;
      }
      
      public function get webID() : int
      {
         return var_1836;
      }
      
      public function get custom() : String
      {
         return var_1984;
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_199)
         {
            _y = param1;
         }
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_199)
         {
            var_84 = param1;
         }
      }
      
      public function set x(param1:Number) : void
      {
         if(!var_199)
         {
            var_85 = param1;
         }
      }
      
      public function get x() : Number
      {
         return var_85;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get xp() : int
      {
         return var_1832;
      }
   }
}
