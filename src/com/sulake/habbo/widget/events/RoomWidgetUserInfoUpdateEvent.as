package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_215:String = "RWUIUE_PEER";
      
      public static const const_211:String = "RWUIUE_OWN_USER";
      
      public static const TRADE_REASON_NO_OWN_RIGHT:int = 1;
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const const_1227:String = "BOT";
      
      public static const const_888:int = 2;
      
      public static const const_1283:int = 0;
      
      public static const const_1005:int = 3;
       
      
      private var var_1348:String = "";
      
      private var var_1826:Boolean = false;
      
      private var var_1832:int = 0;
      
      private var var_1835:int = 0;
      
      private var var_1823:Boolean = false;
      
      private var var_1345:String = "";
      
      private var var_1830:Boolean = false;
      
      private var var_857:int = 0;
      
      private var var_1824:Boolean = true;
      
      private var var_1042:int = 0;
      
      private var var_1833:Boolean = false;
      
      private var var_1338:Boolean = false;
      
      private var var_1828:Boolean = false;
      
      private var var_1834:int = 0;
      
      private var var_1829:Boolean = false;
      
      private var _image:BitmapData = null;
      
      private var var_272:Array;
      
      private var var_1337:Boolean = false;
      
      private var _name:String = "";
      
      private var var_1836:int = 0;
      
      private var var_1831:Boolean = false;
      
      private var var_1827:int = 0;
      
      private var var_1825:String = "";
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         var_272 = [];
         super(param1,param2,param3);
      }
      
      public function get userRoomId() : int
      {
         return var_1835;
      }
      
      public function set userRoomId(param1:int) : void
      {
         var_1835 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return var_1826;
      }
      
      public function get canBeKicked() : Boolean
      {
         return var_1824;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         var_1824 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         var_1830 = param1;
      }
      
      public function get motto() : String
      {
         return var_1348;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         var_1833 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return var_1338;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set motto(param1:String) : void
      {
         var_1348 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return var_1831;
      }
      
      public function get groupBadgeId() : String
      {
         return var_1825;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         var_1338 = param1;
      }
      
      public function get hasFlatControl() : Boolean
      {
         return var_1829;
      }
      
      public function set carryItem(param1:int) : void
      {
         var_1834 = param1;
      }
      
      public function get badges() : Array
      {
         return var_272;
      }
      
      public function get amIController() : Boolean
      {
         return var_1823;
      }
      
      public function set amIController(param1:Boolean) : void
      {
         var_1823 = param1;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         var_1831 = param1;
      }
      
      public function set image(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         var_1827 = param1;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         var_1825 = param1;
      }
      
      public function set realName(param1:String) : void
      {
         var_1345 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return var_1830;
      }
      
      public function get isIgnored() : Boolean
      {
         return var_1833;
      }
      
      public function get carryItem() : int
      {
         return var_1834;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return var_1337;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         var_1337 = param1;
      }
      
      public function set respectLeft(param1:int) : void
      {
         var_857 = param1;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
      
      public function get canTradeReason() : int
      {
         return var_1827;
      }
      
      public function get realName() : String
      {
         return var_1345;
      }
      
      public function set webID(param1:int) : void
      {
         var_1836 = param1;
      }
      
      public function set badges(param1:Array) : void
      {
         var_272 = param1;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         var_1828 = param1;
      }
      
      public function set hasFlatControl(param1:Boolean) : void
      {
         var_1829 = param1;
      }
      
      public function get respectLeft() : int
      {
         return var_857;
      }
      
      public function get webID() : int
      {
         return var_1836;
      }
      
      public function set groupId(param1:int) : void
      {
         var_1042 = param1;
      }
      
      public function get xp() : int
      {
         return var_1832;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         var_1826 = param1;
      }
      
      public function get groupId() : int
      {
         return var_1042;
      }
      
      public function get canTrade() : Boolean
      {
         return var_1828;
      }
      
      public function set xp(param1:int) : void
      {
         var_1832 = param1;
      }
   }
}
