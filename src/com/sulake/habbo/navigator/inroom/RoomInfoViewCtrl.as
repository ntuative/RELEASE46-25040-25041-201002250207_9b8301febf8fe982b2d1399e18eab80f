package com.sulake.habbo.navigator.inroom
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.outgoing.navigator.AddFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CanCreateEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.DeleteFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RateFlatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.UpdateNavigatorSettingsMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.SimpleAlertView;
   import com.sulake.habbo.navigator.TagRenderer;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.events.HabboRoomSettingsTrackingEvent;
   import com.sulake.habbo.navigator.roomsettings.IRoomSettingsCtrlOwner;
   import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
   import com.sulake.habbo.navigator.roomthumbnails.RoomThumbnailCtrl;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class RoomInfoViewCtrl implements IRoomSettingsCtrlOwner
   {
       
      
      private var var_675:IWindowContainer;
      
      private var var_1005:ITextWindow;
      
      private var var_193:RoomSettingsCtrl;
      
      private var var_1207:IContainerButtonWindow;
      
      private var _window:IWindowContainer;
      
      private var _hideInfoTimer:Timer;
      
      private var var_1204:ITextWindow;
      
      private var var_330:IWindowContainer;
      
      private var var_1851:IWindowContainer;
      
      private var var_1853:ITextWindow;
      
      private var var_810:IWindowContainer;
      
      private var var_1457:IButtonWindow;
      
      private var _ownerName:ITextWindow;
      
      private var var_625:ITextWindow;
      
      private var var_1461:IWindowContainer;
      
      private var var_1208:IWindowContainer;
      
      private var var_812:ITextWindow;
      
      private var var_1003:ITextFieldWindow;
      
      private var var_294:IWindowContainer;
      
      private var var_811:ITextWindow;
      
      private var var_1460:IButtonWindow;
      
      private var var_1004:ITextWindow;
      
      private var var_2296:int;
      
      private var var_1209:IContainerButtonWindow;
      
      private var var_813:IWindowContainer;
      
      private var var_1205:ITextWindow;
      
      private var var_1203:IContainerButtonWindow;
      
      private var var_1459:ITextWindow;
      
      private var var_1458:IButtonWindow;
      
      private var var_751:TagRenderer;
      
      private var var_1595:ITextWindow;
      
      private var var_331:RoomEventViewCtrl;
      
      private var _navigator:HabboNavigator;
      
      private var var_674:ITextWindow;
      
      private var var_256:RoomThumbnailCtrl;
      
      private var var_1206:IContainerButtonWindow;
      
      private var var_1852:IWindowContainer;
      
      private var var_255:IWindowContainer;
      
      public function RoomInfoViewCtrl(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_331 = new RoomEventViewCtrl(_navigator);
         var_193 = new RoomSettingsCtrl(_navigator,this,true);
         var_256 = new RoomThumbnailCtrl(_navigator);
         var_751 = new TagRenderer(_navigator);
         _navigator.roomSettingsCtrls.push(this.var_193);
         _hideInfoTimer = new Timer(6000,1);
         _hideInfoTimer.addEventListener(TimerEvent.TIMER,hideInfo);
      }
      
      public function backToRoomSettings() : void
      {
         this.var_193.active = true;
         this.var_331.active = false;
         this.var_256.active = false;
         this.reload();
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      private function refreshEventButtons(param1:RoomEventData) : void
      {
         if(false)
         {
            return;
         }
         var_1457.visible = param1 == null && _navigator.data.currentRoomOwner;
         var_1458.visible = param1 != null && (_navigator.data.currentRoomOwner || _navigator.data.eventMod);
         var_1461.visible = Util.hasVisibleChildren(var_1461);
      }
      
      private function refreshRoomDetails(param1:GuestRoomData, param2:Boolean) : void
      {
         if(param1 == null || false || false)
         {
            return;
         }
         var_625.text = param1.roomName;
         var_625.height = NaN;
         _ownerName.text = param1.ownerName;
         var_812.text = param1.description;
         var_751.refreshTags(var_330,param1.tags);
         var_812.visible = false;
         if(param1.description != "")
         {
            var_812.height = NaN;
            var_812.visible = true;
         }
         var _loc3_:* = _navigator.data.currentRoomRating == -1;
         _navigator.refreshButton(var_330,"thumb_up",_loc3_,onThumbUp,0);
         _navigator.refreshButton(var_330,"thumb_down",_loc3_,onThumbDown,0);
         var_1853.visible = _loc3_;
         var_811.visible = !_loc3_;
         var_1459.visible = !_loc3_;
         var_1459.text = "" + _navigator.data.currentRoomRating;
         _navigator.refreshButton(var_330,"home",param2,null,0);
         _navigator.refreshButton(var_330,"favourite",!param2 && _navigator.data.isCurrentRoomFavourite(),null,0);
         Util.moveChildrenToColumn(var_330,["room_name","owner_name_cont","tags","room_desc","rating_cont"],var_625.y,0);
         var_330.visible = true;
         var_330.height = Util.getLowestPoint(var_330);
      }
      
      private function getButtonsMinHeight() : int
      {
         return !!_navigator.data.currentRoomOwner ? 0 : 21;
      }
      
      public function dispose() : void
      {
         if(_hideInfoTimer)
         {
            _hideInfoTimer.removeEventListener(TimerEvent.TIMER,hideInfo);
            _hideInfoTimer.reset();
            _hideInfoTimer = null;
         }
      }
      
      private function onThumbUp(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new RateFlatMessageComposer(1));
      }
      
      private function hideInfo(param1:Event) : void
      {
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_427,HabboToolbarIconEnum.ROOMINFO,_window,false));
      }
      
      private function getRoomInfoMinHeight() : int
      {
         return 37;
      }
      
      public function onAddFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         if(_navigator.data.isFavouritesFull())
         {
            _loc3_ = new SimpleAlertView(_navigator,"${navigator.favouritesfull.title}","${navigator.favouritesfull.body}");
            _loc3_.show();
         }
         else
         {
            _navigator.send(new AddFavouriteRoomMessageComposer(_navigator.data.enteredGuestRoom.flatId));
         }
      }
      
      private function refreshRoomButtons(param1:Boolean) : void
      {
         if(_navigator.data.enteredGuestRoom == null || false || false)
         {
            return;
         }
         var_1460.visible = _navigator.data.canEditRoomSettings;
         var _loc2_:Boolean = _navigator.data.isCurrentRoomFavourite();
         var_1207.visible = _navigator.data.canAddFavourite && !_loc2_;
         var_1206.visible = _navigator.data.canAddFavourite && _loc2_;
         var_1209.visible = _navigator.data.canEditRoomSettings && !param1;
         var_1203.visible = _navigator.data.canEditRoomSettings && param1;
         var_1208.visible = Util.hasVisibleChildren(var_1208);
      }
      
      public function open(param1:Boolean) : void
      {
         this._hideInfoTimer.reset();
         this.var_331.active = false;
         this.var_193.active = false;
         this.var_256.active = false;
         if(param1)
         {
            this.startRoomSettingsEdit(_navigator.data.enteredGuestRoom.flatId);
         }
         refresh();
         _window.visible = true;
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_45,HabboToolbarIconEnum.ROOMINFO,_window,false));
         _window.parent.activate();
         _window.activate();
         if(!param1)
         {
            this._hideInfoTimer.start();
         }
      }
      
      public function toggle() : void
      {
         this._hideInfoTimer.reset();
         this.var_331.active = false;
         this.var_193.active = false;
         this.var_256.active = false;
         refresh();
         if(true)
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_45,HabboToolbarIconEnum.ROOMINFO,_window,false));
            _window.parent.activate();
         }
         else
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_427,HabboToolbarIconEnum.ROOMINFO,_window,false));
         }
      }
      
      private function refreshRoom() : void
      {
         Util.hideChildren(var_294);
         var_294.findChildByName("close").visible = true;
         var _loc1_:GuestRoomData = _navigator.data.enteredGuestRoom;
         var _loc2_:Boolean = _navigator.data.settings != null && _loc1_ != null && _loc1_.flatId == _navigator.data.settings.homeRoomId;
         refreshRoomDetails(_loc1_,_loc2_);
         refreshPublicSpaceDetails(_navigator.data.enteredPublicSpace);
         refreshRoomButtons(_loc2_);
         this.var_193.refresh(var_294);
         this.var_256.refresh(var_294);
         Util.moveChildrenToColumn(var_294,["room_details","room_buttons"],0,2);
         var_294.height = Util.getLowestPoint(var_294);
         var_294.visible = true;
         Logger.log("XORP: undefined, undefined, undefined, undefined, undefined");
      }
      
      private function onCloseButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         hideInfo(null);
      }
      
      private function onEmbedSrcClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var_1003.setSelection(0,var_1003.text.length);
      }
      
      private function getEmbedData() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(_navigator.data.enteredGuestRoom != null)
         {
            _loc1_ = "private";
            _loc2_ = "" + _navigator.data.enteredGuestRoom.flatId;
         }
         else
         {
            _loc1_ = "public";
            _loc2_ = "" + _navigator.data.publicSpaceNodeId;
            Logger.log("Node id is: " + _loc2_);
         }
         var _loc3_:String = _navigator.configuration.getKey("user.hash","");
         _navigator.registerParameter("navigator.embed.src","roomType",_loc1_);
         _navigator.registerParameter("navigator.embed.src","embedCode",_loc3_);
         _navigator.registerParameter("navigator.embed.src","roomId",_loc2_);
         return _navigator.getText("navigator.embed.src");
      }
      
      private function onThumbDown(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new RateFlatMessageComposer(-1));
      }
      
      private function refreshEvent() : void
      {
         Util.hideChildren(var_255);
         var _loc1_:RoomEventData = _navigator.data.roomEventData;
         refreshEventDetails(_loc1_);
         refreshEventButtons(_loc1_);
         this.var_331.refresh(var_255);
         if(Util.hasVisibleChildren(var_255) && !this.var_256.active)
         {
            Util.moveChildrenToColumn(var_255,["event_details","event_buttons"],0,2);
            var_255.height = Util.getLowestPoint(var_255);
            var_255.visible = true;
         }
         else
         {
            var_255.visible = false;
         }
         Logger.log("EVENT: undefined, undefined");
      }
      
      public function startEventEdit() : void
      {
         this._hideInfoTimer.reset();
         this.var_331.active = true;
         this.var_193.active = false;
         this.var_256.active = false;
         this.reload();
      }
      
      private function getEventInfoMinHeight() : int
      {
         return 18;
      }
      
      public function onRemoveFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         _navigator.send(new DeleteFavouriteRoomMessageComposer(_navigator.data.enteredGuestRoom.flatId));
      }
      
      private function onHover(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            return;
         }
         _hideInfoTimer.reset();
      }
      
      private function refreshPublicSpaceDetails(param1:PublicRoomShortData) : void
      {
         if(param1 == null || false || false)
         {
            return;
         }
         var_1005.text = _navigator.getPublicSpaceName(param1.unitPropertySet,param1.worldId);
         var_1005.height = NaN;
         var_1204.text = _navigator.getPublicSpaceDesc(param1.unitPropertySet,param1.worldId);
         var_1204.height = NaN;
         Util.moveChildrenToColumn(var_675,["public_space_name","public_space_desc"],var_1005.y,0);
         var_675.visible = true;
         var_675.height = Math.max(86,Util.getLowestPoint(var_675));
      }
      
      public function reload() : void
      {
         if(_window != null && false)
         {
            refresh();
         }
      }
      
      private function find(param1:String) : IWindow
      {
         var _loc2_:IWindow = _window.findChildByName(param1);
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      private function refreshEmbed() : void
      {
         var _loc1_:* = _navigator.configuration.getKey("embed.showInRoomInfo","false") == "true";
         if(_loc1_ && true && true && true)
         {
            var_813.visible = true;
            var_1003.text = this.getEmbedData();
         }
         else
         {
            var_813.visible = false;
         }
      }
      
      public function startRoomSettingsEdit(param1:int) : void
      {
         this._hideInfoTimer.reset();
         this.var_193.load(param1);
         this.var_193.active = true;
         this.var_331.active = false;
         this.var_256.active = false;
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function startThumbnailEdit() : void
      {
         this._hideInfoTimer.reset();
         this.var_193.active = false;
         this.var_331.active = false;
         this.var_256.active = true;
         this.reload();
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_THUMBS));
      }
      
      private function prepareWindow() : void
      {
         if(_window != null)
         {
            return;
         }
         _window = IWindowContainer(_navigator.getXmlWindow("iro_room_details"));
         _window.setParamFlag(HabboWindowParam.const_65,false);
         _window.setParamFlag(HabboWindowParam.const_1239,true);
         _window.visible = false;
         var_294 = IWindowContainer(find("room_info"));
         var_330 = IWindowContainer(find("room_details"));
         var_675 = IWindowContainer(find("public_space_details"));
         var_1852 = IWindowContainer(find("owner_name_cont"));
         var_1851 = IWindowContainer(find("rating_cont"));
         var_1208 = IWindowContainer(find("room_buttons"));
         var_625 = ITextWindow(find("room_name"));
         var_1005 = ITextWindow(find("public_space_name"));
         _ownerName = ITextWindow(find("owner_name"));
         var_812 = ITextWindow(find("room_desc"));
         var_1204 = ITextWindow(find("public_space_desc"));
         var_1004 = ITextWindow(find("owner_caption"));
         var_811 = ITextWindow(find("rating_caption"));
         var_1853 = ITextWindow(find("rate_caption"));
         var_1459 = ITextWindow(find("rating_txt"));
         var_255 = IWindowContainer(find("event_info"));
         var_810 = IWindowContainer(find("event_details"));
         var_1461 = IWindowContainer(find("event_buttons"));
         var_1595 = ITextWindow(find("event_name"));
         var_674 = ITextWindow(find("event_desc"));
         var_1207 = IContainerButtonWindow(find("add_favourite_button"));
         var_1206 = IContainerButtonWindow(find("rem_favourite_button"));
         var_1209 = IContainerButtonWindow(find("make_home_button"));
         var_1203 = IContainerButtonWindow(find("unmake_home_button"));
         var_1460 = IButtonWindow(find("room_settings_button"));
         var_1457 = IButtonWindow(find("create_event_button"));
         var_1458 = IButtonWindow(find("edit_event_button"));
         var_813 = IWindowContainer(find("embed_info"));
         var_1205 = ITextWindow(find("embed_info_txt"));
         var_1003 = ITextFieldWindow(find("embed_src_txt"));
         Util.setProcDirectly(var_1207,onAddFavouriteClick);
         Util.setProcDirectly(var_1206,onRemoveFavouriteClick);
         Util.setProcDirectly(var_1460,onRoomSettingsClick);
         Util.setProcDirectly(var_1209,onMakeHomeClick);
         Util.setProcDirectly(var_1203,onUnmakeHomeClick);
         Util.setProcDirectly(var_1457,onEventSettingsClick);
         Util.setProcDirectly(var_1458,onEventSettingsClick);
         Util.setProcDirectly(var_1003,onEmbedSrcClick);
         _navigator.refreshButton(var_1207,"favourite",true,null,0);
         _navigator.refreshButton(var_1206,"favourite",true,null,0);
         _navigator.refreshButton(var_1209,"home",true,null,0);
         _navigator.refreshButton(var_1203,"home",true,null,0);
         _window.findChildByName("close").procedure = onCloseButtonClick;
         Util.setProcDirectly(var_294,onHover);
         Util.setProcDirectly(var_255,onHover);
         var_1004.width = var_1004.textWidth;
         Util.moveChildrenToRow(var_1852,["owner_caption","owner_name"],var_1004.x,var_1004.y,3);
         var_811.width = var_811.textWidth;
         Util.moveChildrenToRow(var_1851,["rating_caption","rating_txt"],var_811.x,var_811.y,3);
         var_1205.height = NaN;
         Util.moveChildrenToColumn(var_813,["embed_info_txt","embed_src_txt"],var_1205.y,2);
         var_813.height = Util.getLowestPoint(var_813) + 5;
         var_2296 = NaN;
      }
      
      private function refreshEventDetails(param1:RoomEventData) : void
      {
         if(param1 == null || false)
         {
            return;
         }
         var_1595.text = param1.eventName;
         var_674.text = param1.eventDescription;
         var_751.refreshTags(var_810,[_navigator.getText("roomevent_type_" + param1.eventType),param1.tags[0],param1.tags[1]]);
         var_674.visible = false;
         if(param1.eventDescription != "")
         {
            var_674.height = NaN;
            var_674.y = Util.getLowestPoint(var_810) + 2;
            var_674.visible = true;
         }
         var_810.visible = true;
         var_810.height = Util.getLowestPoint(var_810);
      }
      
      private function refresh() : void
      {
         prepareWindow();
         refreshRoom();
         refreshEvent();
         refreshEmbed();
         Util.moveChildrenToColumn(this._window,["room_info","event_info","embed_info"],0,2);
         _window.height = Util.getLowestPoint(_window);
         _window.y = _window.desktop.height - 0 - 5;
         Logger.log("MAIN: undefined, undefined, undefined");
      }
      
      private function onRoomSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = _navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         startRoomSettingsEdit(_loc3_.flatId);
      }
      
      private function onUnmakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("CLEARING HOME ROOM:");
         _navigator.send(new UpdateNavigatorSettingsMessageComposer(0));
      }
      
      private function onEventSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.roomEventData == null)
         {
            if(_navigator.data.currentRoomOwner)
            {
               _navigator.send(new CanCreateEventMessageComposer());
            }
         }
         else
         {
            startEventEdit();
         }
      }
      
      public function roomSettingsRefreshNeeded() : void
      {
         refresh();
      }
      
      public function close() : void
      {
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_803,HabboToolbarIconEnum.ROOMINFO,_window,false));
         if(_window == null)
         {
            return;
         }
         this._window.visible = false;
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED));
      }
      
      private function onMakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = _navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         Logger.log("SETTING HOME ROOM TO: " + _loc3_.flatId);
         _navigator.send(new UpdateNavigatorSettingsMessageComposer(_loc3_.flatId));
      }
   }
}
