package com.sulake.habbo.communication.messages.parser.moderation
{
   import flash.utils.getTimer;
   
   public class IssueMessageData
   {
      
      public static const const_143:int = 1;
      
      public static const const_1161:int = 3;
      
      public static const const_350:int = 2;
       
      
      private var var_1948:int;
      
      private var var_1933:int;
      
      private var var_1945:int;
      
      private var var_1608:int;
      
      private var var_33:int;
      
      private var var_372:int;
      
      private var var_1282:int;
      
      private var var_1903:int;
      
      private var var_1018:int;
      
      private var _roomResources:String;
      
      private var var_1944:int;
      
      private var var_1943:int;
      
      private var var_1949:String;
      
      private var var_1904:String;
      
      private var var_1947:int = 0;
      
      private var var_1230:String;
      
      private var _message:String;
      
      private var var_1935:int;
      
      private var var_1950:String;
      
      private var var_1258:int;
      
      private var var_625:String;
      
      private var var_1946:String;
      
      private var var_1413:int;
      
      public function IssueMessageData()
      {
         super();
      }
      
      public function set reportedUserId(param1:int) : void
      {
         var_1018 = param1;
      }
      
      public function set temporalPriority(param1:int) : void
      {
         var_1947 = param1;
      }
      
      public function get reporterUserId() : int
      {
         return var_1943;
      }
      
      public function set roomName(param1:String) : void
      {
         var_625 = param1;
      }
      
      public function set chatRecordId(param1:int) : void
      {
         var_1944 = param1;
      }
      
      public function get state() : int
      {
         return var_33;
      }
      
      public function get roomResources() : String
      {
         return _roomResources;
      }
      
      public function set roomResources(param1:String) : void
      {
         _roomResources = param1;
      }
      
      public function get roomName() : String
      {
         return var_625;
      }
      
      public function get message() : String
      {
         return _message;
      }
      
      public function set worldId(param1:int) : void
      {
         var_1608 = param1;
      }
      
      public function set state(param1:int) : void
      {
         var_33 = param1;
      }
      
      public function get unitPort() : int
      {
         return var_1933;
      }
      
      public function get priority() : int
      {
         return var_1948 + var_1947;
      }
      
      public function set issueId(param1:int) : void
      {
         var_1903 = param1;
      }
      
      public function get pickerUserName() : String
      {
         return var_1904;
      }
      
      public function getOpenTime() : String
      {
         var _loc1_:int = (getTimer() - var_1413) / 1000;
         var _loc2_:int = _loc1_ % 60;
         var _loc3_:int = _loc1_ / 60;
         var _loc4_:int = _loc3_ % 60;
         var _loc5_:int = _loc3_ / 60;
         var _loc6_:String = _loc2_ < 10 ? "0" + _loc2_ : "" + _loc2_;
         var _loc7_:String = _loc4_ < 10 ? "0" + _loc4_ : "" + _loc4_;
         var _loc8_:String = _loc5_ < 10 ? "0" + _loc5_ : "" + _loc5_;
         return _loc8_ + ":" + _loc7_ + ":" + _loc6_;
      }
      
      public function get categoryId() : int
      {
         return var_1258;
      }
      
      public function set reporterUserId(param1:int) : void
      {
         var_1943 = param1;
      }
      
      public function get roomType() : int
      {
         return var_1282;
      }
      
      public function set flatType(param1:String) : void
      {
         var_1949 = param1;
      }
      
      public function get chatRecordId() : int
      {
         return var_1944;
      }
      
      public function set message(param1:String) : void
      {
         _message = param1;
      }
      
      public function get worldId() : int
      {
         return var_1608;
      }
      
      public function set flatOwnerName(param1:String) : void
      {
         var_1946 = param1;
      }
      
      public function set reportedUserName(param1:String) : void
      {
         var_1230 = param1;
      }
      
      public function get issueId() : int
      {
         return var_1903;
      }
      
      public function set priority(param1:int) : void
      {
         var_1948 = param1;
      }
      
      public function set unitPort(param1:int) : void
      {
         var_1933 = param1;
      }
      
      public function get flatType() : String
      {
         return var_1949;
      }
      
      public function set reportedCategoryId(param1:int) : void
      {
         var_1945 = param1;
      }
      
      public function set pickerUserName(param1:String) : void
      {
         var_1904 = param1;
      }
      
      public function set pickerUserId(param1:int) : void
      {
         var_1935 = param1;
      }
      
      public function get reportedUserName() : String
      {
         return var_1230;
      }
      
      public function set roomType(param1:int) : void
      {
         var_1282 = param1;
      }
      
      public function get reportedCategoryId() : int
      {
         return var_1945;
      }
      
      public function set flatId(param1:int) : void
      {
         var_372 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1258 = param1;
      }
      
      public function set timeStamp(param1:int) : void
      {
         var_1413 = param1;
      }
      
      public function get pickerUserId() : int
      {
         return var_1935;
      }
      
      public function set reporterUserName(param1:String) : void
      {
         var_1950 = param1;
      }
      
      public function get timeStamp() : int
      {
         return var_1413;
      }
      
      public function get reportedUserId() : int
      {
         return var_1018;
      }
      
      public function get flatId() : int
      {
         return var_372;
      }
      
      public function get flatOwnerName() : String
      {
         return var_1946;
      }
      
      public function get reporterUserName() : String
      {
         return var_1950;
      }
   }
}
