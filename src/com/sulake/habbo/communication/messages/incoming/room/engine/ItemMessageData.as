package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ItemMessageData
   {
       
      
      private var var_84:Number = 0;
      
      private var _data:String = "";
      
      private var var_1500:int = 0;
      
      private var var_33:int = 0;
      
      private var _type:int = 0;
      
      private var _y:Number = 0;
      
      private var var_2021:Boolean = false;
      
      private var var_2369:String = "";
      
      private var _id:int = 0;
      
      private var var_199:Boolean = false;
      
      private var var_223:String = "";
      
      private var var_2023:int = 0;
      
      private var var_2022:int = 0;
      
      private var var_1899:int = 0;
      
      private var var_1900:int = 0;
      
      public function ItemMessageData(param1:int, param2:int, param3:Boolean)
      {
         super();
         _id = param1;
         _type = param2;
         var_2021 = param3;
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_199)
         {
            _y = param1;
         }
      }
      
      public function get isOldFormat() : Boolean
      {
         return var_2021;
      }
      
      public function set type(param1:int) : void
      {
         if(!var_199)
         {
            _type = param1;
         }
      }
      
      public function get dir() : String
      {
         return var_223;
      }
      
      public function get state() : int
      {
         return var_33;
      }
      
      public function set localX(param1:Number) : void
      {
         if(!var_199)
         {
            var_1899 = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set wallX(param1:Number) : void
      {
         if(!var_199)
         {
            var_2023 = param1;
         }
      }
      
      public function set wallY(param1:Number) : void
      {
         if(!var_199)
         {
            var_2022 = param1;
         }
      }
      
      public function set dir(param1:String) : void
      {
         if(!var_199)
         {
            var_223 = param1;
         }
      }
      
      public function get data() : String
      {
         return _data;
      }
      
      public function set localY(param1:Number) : void
      {
         if(!var_199)
         {
            var_1900 = param1;
         }
      }
      
      public function set state(param1:int) : void
      {
         if(!var_199)
         {
            var_33 = param1;
         }
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get localX() : Number
      {
         return var_1899;
      }
      
      public function set data(param1:String) : void
      {
         if(!var_199)
         {
            _data = param1;
         }
      }
      
      public function get wallX() : Number
      {
         return var_2023;
      }
      
      public function get wallY() : Number
      {
         return var_2022;
      }
      
      public function get localY() : Number
      {
         return var_1900;
      }
      
      public function setReadOnly() : void
      {
         var_199 = true;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get z() : Number
      {
         return var_84;
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_199)
         {
            var_84 = param1;
         }
      }
   }
}
