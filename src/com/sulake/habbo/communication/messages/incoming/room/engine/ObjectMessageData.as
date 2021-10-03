package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ObjectMessageData
   {
       
      
      private var var_970:int = 0;
      
      private var _data:String = "";
      
      private var var_1500:int = -1;
      
      private var var_33:int = 0;
      
      private var _type:int = 0;
      
      private var var_972:int = 0;
      
      private var var_2369:String = "";
      
      private var var_1872:int = 0;
      
      private var _id:int = 0;
      
      private var var_199:Boolean = false;
      
      private var var_223:int = 0;
      
      private var var_2164:String = null;
      
      private var var_85:Number = 0;
      
      private var _y:Number = 0;
      
      private var var_84:Number = 0;
      
      public function ObjectMessageData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function set type(param1:int) : void
      {
         if(!var_199)
         {
            _type = param1;
         }
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_199)
         {
            _y = param1;
         }
      }
      
      public function get dir() : int
      {
         return var_223;
      }
      
      public function get extra() : int
      {
         return var_1500;
      }
      
      public function get state() : int
      {
         return var_33;
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_199)
         {
            var_223 = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set x(param1:Number) : void
      {
         if(!var_199)
         {
            var_85 = param1;
         }
      }
      
      public function set extra(param1:int) : void
      {
         if(!var_199)
         {
            var_1500 = param1;
         }
      }
      
      public function get z() : Number
      {
         return var_84;
      }
      
      public function set state(param1:int) : void
      {
         if(!var_199)
         {
            var_33 = param1;
         }
      }
      
      public function get data() : String
      {
         return _data;
      }
      
      public function get expiryTime() : int
      {
         return var_1872;
      }
      
      public function get staticClass() : String
      {
         return var_2164;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function set expiryTime(param1:int) : void
      {
         if(!var_199)
         {
            var_1872 = param1;
         }
      }
      
      public function set data(param1:String) : void
      {
         if(!var_199)
         {
            _data = param1;
         }
      }
      
      public function set staticClass(param1:String) : void
      {
         if(!var_199)
         {
            var_2164 = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_199 = true;
      }
      
      public function set sizeX(param1:int) : void
      {
         if(!var_199)
         {
            var_970 = param1;
         }
      }
      
      public function set sizeY(param1:int) : void
      {
         if(!var_199)
         {
            var_972 = param1;
         }
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_199)
         {
            var_84 = param1;
         }
      }
      
      public function get sizeX() : int
      {
         return var_970;
      }
      
      public function get x() : Number
      {
         return var_85;
      }
      
      public function get sizeY() : int
      {
         return var_972;
      }
   }
}
