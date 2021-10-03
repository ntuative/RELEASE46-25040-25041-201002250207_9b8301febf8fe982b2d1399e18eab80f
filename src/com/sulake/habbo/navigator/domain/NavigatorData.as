package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.communication.messages.incoming.navigator.FlatCategory;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
   import com.sulake.habbo.communication.messages.incoming.navigator.MsgWithRequestId;
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.parser.navigator.FavouritesMessageParser;
   import com.sulake.habbo.communication.messages.parser.navigator.NavigatorSettingsMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
   import com.sulake.habbo.navigator.HabboNavigator;
   import flash.utils.Dictionary;
   
   public class NavigatorData
   {
      
      private static const const_1396:int = 10;
       
      
      private var var_1424:NavigatorSettingsMessageParser;
      
      private var var_1171:int;
      
      private var var_1745:int;
      
      private var var_1740:Boolean;
      
      private var var_981:Array;
      
      private var var_791:Dictionary;
      
      private var var_982:Array;
      
      private var var_2284:int;
      
      private var var_1742:int;
      
      private var var_1743:int;
      
      private var var_1744:int;
      
      private var var_542:PublicRoomShortData;
      
      private var var_381:RoomEventData;
      
      private var var_123:MsgWithRequestId;
      
      private var var_1727:Boolean;
      
      private var _navigator:HabboNavigator;
      
      private var var_1741:Boolean;
      
      private var var_188:GuestRoomData;
      
      private var var_648:Boolean;
      
      private var _currentRoomOwner:Boolean;
      
      public function NavigatorData(param1:HabboNavigator)
      {
         var_981 = new Array();
         var_982 = new Array();
         var_791 = new Dictionary();
         super();
         _navigator = param1;
      }
      
      public function get createdFlatId() : int
      {
         return var_1745;
      }
      
      public function get eventMod() : Boolean
      {
         return var_1741;
      }
      
      public function startLoading() : void
      {
         this.var_648 = true;
      }
      
      public function isRoomFavourite(param1:int) : Boolean
      {
         return false;
      }
      
      public function set eventMod(param1:Boolean) : void
      {
         var_1741 = param1;
      }
      
      public function set roomEventData(param1:RoomEventData) : void
      {
         if(var_381 != null)
         {
            var_381.dispose();
         }
         var_381 = param1;
      }
      
      public function get popularTagsArrived() : Boolean
      {
         return var_123 != null && var_123 as PopularRoomTagsData != null;
      }
      
      public function get guestRoomSearchArrived() : Boolean
      {
         return var_123 != null && var_123 as GuestRoomSearchResultData != null;
      }
      
      public function get guestRoomSearchResults() : GuestRoomSearchResultData
      {
         return var_123 as GuestRoomSearchResultData;
      }
      
      public function get enteredGuestRoom() : GuestRoomData
      {
         return var_188;
      }
      
      public function get allCategories() : Array
      {
         return var_981;
      }
      
      public function onRoomExit() : void
      {
         if(var_381 != null)
         {
            var_381.dispose();
            var_381 = null;
         }
         if(var_542 != null)
         {
            var_542.dispose();
            var_542 = null;
         }
         if(var_188 != null)
         {
            var_188.dispose();
            var_188 = null;
         }
         _currentRoomOwner = false;
      }
      
      public function set officialRooms(param1:OfficialRoomsData) : void
      {
         disposeCurrentMsg();
         var_123 = param1;
         var_648 = false;
      }
      
      public function get settings() : NavigatorSettingsMessageParser
      {
         return var_1424;
      }
      
      public function set popularTags(param1:PopularRoomTagsData) : void
      {
         disposeCurrentMsg();
         var_123 = param1;
         var_648 = false;
      }
      
      public function onRoomEnter(param1:RoomEntryInfoMessageParser) : void
      {
         var_542 = null;
         var_188 = null;
         _currentRoomOwner = false;
         if(param1.guestRoom)
         {
            _currentRoomOwner = param1.owner;
         }
         else
         {
            var_542 = param1.publicSpace;
            var_381 = null;
         }
      }
      
      public function get currentRoomOwner() : Boolean
      {
         return _currentRoomOwner;
      }
      
      public function onFavourites(param1:FavouritesMessageParser) : void
      {
         var _loc2_:int = 0;
         this.var_2284 = param1.limit;
         this.var_1171 = param1.favouriteRoomIds.length;
         this.var_791 = new Dictionary();
         for each(_loc2_ in param1.favouriteRoomIds)
         {
            this.var_791[_loc2_] = "yes";
         }
      }
      
      public function get popularTags() : PopularRoomTagsData
      {
         return var_123 as PopularRoomTagsData;
      }
      
      public function get enteredPublicSpace() : PublicRoomShortData
      {
         return var_542;
      }
      
      public function get hotRoomPopupOpen() : Boolean
      {
         return var_1740;
      }
      
      public function set guestRoomSearchResults(param1:GuestRoomSearchResultData) : void
      {
         disposeCurrentMsg();
         var_123 = param1;
         var_648 = false;
      }
      
      public function set avatarId(param1:int) : void
      {
         var_1743 = param1;
      }
      
      public function get canEditRoomSettings() : Boolean
      {
         return var_188 != null && _currentRoomOwner;
      }
      
      public function isLoading() : Boolean
      {
         return this.var_648;
      }
      
      public function get visibleCategories() : Array
      {
         return var_982;
      }
      
      public function set categories(param1:Array) : void
      {
         var _loc2_:* = null;
         var_981 = param1;
         var_982 = new Array();
         for each(_loc2_ in var_981)
         {
            if(_loc2_.visible)
            {
               var_982.push(_loc2_);
            }
         }
      }
      
      public function get currentRoomRating() : int
      {
         return var_1742;
      }
      
      public function get publicSpaceNodeId() : int
      {
         return var_1744;
      }
      
      public function set settings(param1:NavigatorSettingsMessageParser) : void
      {
         var_1424 = param1;
      }
      
      private function disposeCurrentMsg() : void
      {
         if(var_123 == null)
         {
            return;
         }
         var_123.dispose();
         var_123 = null;
      }
      
      public function get roomEventData() : RoomEventData
      {
         return var_381;
      }
      
      public function favouriteChanged(param1:int, param2:Boolean) : void
      {
         var_791[param1] = !!param2 ? "yes" : null;
         var_1171 += !!param2 ? 1 : -1;
      }
      
      public function get officialRooms() : OfficialRoomsData
      {
         return var_123 as OfficialRoomsData;
      }
      
      public function get avatarId() : int
      {
         return var_1743;
      }
      
      public function isCurrentRoomFavourite() : Boolean
      {
         var _loc1_:int = 0;
         return false;
      }
      
      public function get officialRoomsArrived() : Boolean
      {
         return var_123 != null && var_123 as OfficialRoomsData != null;
      }
      
      public function set hotRoomPopupOpen(param1:Boolean) : void
      {
         var_1740 = param1;
      }
      
      public function set currentRoomRating(param1:int) : void
      {
         var_1742 = param1;
      }
      
      public function set hcMember(param1:Boolean) : void
      {
         var_1727 = param1;
      }
      
      public function set enteredRoom(param1:GuestRoomData) : void
      {
         if(var_188 != null)
         {
            var_188.dispose();
         }
         var_188 = param1;
      }
      
      public function isCurrentRoomHome() : Boolean
      {
         if(var_188 == null)
         {
            return false;
         }
         var _loc1_:int = 0;
         return this.var_1424.homeRoomId == _loc1_;
      }
      
      public function isFavouritesFull() : Boolean
      {
         return var_1171 >= var_2284;
      }
      
      public function set publicSpaceNodeId(param1:int) : void
      {
         var_1744 = param1;
      }
      
      public function get hcMember() : Boolean
      {
         return var_1727;
      }
      
      public function get canAddFavourite() : Boolean
      {
         return var_188 != null && !_currentRoomOwner;
      }
      
      public function set createdFlatId(param1:int) : void
      {
         var_1745 = param1;
      }
   }
}
