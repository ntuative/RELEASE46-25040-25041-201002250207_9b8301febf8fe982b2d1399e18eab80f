package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _y:Number = 0;
      
      private var var_84:Number = 0;
      
      private var var_223:int = 0;
      
      private var var_1881:int = 0;
      
      private var var_1879:Number = 0;
      
      private var var_1882:Number = 0;
      
      private var var_1880:Number = 0;
      
      private var var_1878:Number = 0;
      
      private var var_1883:Boolean = false;
      
      private var var_85:Number = 0;
      
      private var _id:int = 0;
      
      private var var_197:Array;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         var_197 = [];
         super();
         _id = param1;
         var_85 = param2;
         _y = param3;
         var_84 = param4;
         var_1878 = param5;
         var_223 = param6;
         var_1881 = param7;
         var_1879 = param8;
         var_1882 = param9;
         var_1880 = param10;
         var_1883 = param11;
         var_197 = param12;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get z() : Number
      {
         return var_84;
      }
      
      public function get dir() : int
      {
         return var_223;
      }
      
      public function get localZ() : Number
      {
         return var_1878;
      }
      
      public function get isMoving() : Boolean
      {
         return var_1883;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get dirHead() : int
      {
         return var_1881;
      }
      
      public function get targetX() : Number
      {
         return var_1879;
      }
      
      public function get targetY() : Number
      {
         return var_1882;
      }
      
      public function get targetZ() : Number
      {
         return var_1880;
      }
      
      public function get x() : Number
      {
         return var_85;
      }
      
      public function get actions() : Array
      {
         return var_197.slice();
      }
   }
}
