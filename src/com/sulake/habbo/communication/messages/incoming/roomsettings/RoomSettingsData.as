package com.sulake.habbo.communication.messages.incoming.roomsettings
{
   public class RoomSettingsData
   {
      
      public static const const_414:int = 0;
      
      public static const const_118:int = 2;
      
      public static const const_156:int = 1;
      
      public static const const_567:Array = ["open","closed","password"];
       
      
      private var _name:String;
      
      private var var_1867:Boolean;
      
      private var var_1868:Boolean;
      
      private var var_1955:int;
      
      private var var_1865:Array;
      
      private var var_1954:int;
      
      private var var_1700:Boolean;
      
      private var var_1236:String;
      
      private var var_1866:int;
      
      private var var_1703:int;
      
      private var var_1258:int;
      
      private var _roomId:int;
      
      private var var_616:Array;
      
      public function RoomSettingsData()
      {
         super();
      }
      
      public function get maximumVisitors() : int
      {
         return var_1866;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         var_1866 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function get tags() : Array
      {
         return var_616;
      }
      
      public function get allowPets() : Boolean
      {
         return var_1700;
      }
      
      public function set controllerCount(param1:int) : void
      {
         var_1954 = param1;
      }
      
      public function set roomId(param1:int) : void
      {
         _roomId = param1;
      }
      
      public function set controllers(param1:Array) : void
      {
         var_1865 = param1;
      }
      
      public function set tags(param1:Array) : void
      {
         var_616 = param1;
      }
      
      public function get allowWalkThrough() : Boolean
      {
         return var_1867;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return var_1868;
      }
      
      public function get maximumVisitorsLimit() : int
      {
         return var_1955;
      }
      
      public function get categoryId() : int
      {
         return var_1258;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         var_1700 = param1;
      }
      
      public function get controllerCount() : int
      {
         return var_1954;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get controllers() : Array
      {
         return var_1865;
      }
      
      public function set doorMode(param1:int) : void
      {
         var_1703 = param1;
      }
      
      public function set allowWalkThrough(param1:Boolean) : void
      {
         var_1867 = param1;
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         var_1868 = param1;
      }
      
      public function set maximumVisitorsLimit(param1:int) : void
      {
         var_1955 = param1;
      }
      
      public function get doorMode() : int
      {
         return var_1703;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1258 = param1;
      }
      
      public function set description(param1:String) : void
      {
         var_1236 = param1;
      }
      
      public function get description() : String
      {
         return var_1236;
      }
   }
}
