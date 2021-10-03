package com.sulake.habbo.widget.memenu
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarActionUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarEditorUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetCreditBalanceUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetDanceUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetFrameUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetHabboClubUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetSettingsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetToolbarClickedUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetTutorialEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEffectsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetWaveUpdateEvent;
   import com.sulake.habbo.widget.memenu.enum.HabboMeMenuTrackingEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetRequestWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetSelectOutfitMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetToolbarMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.external.ExternalInterface;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class MeMenuWidget extends RoomWidgetBase
   {
      
      public static const const_522:String = "me_menu_settings_view";
      
      private static const const_770:int = 10;
      
      public static const const_683:String = "me_menu_effects_view";
      
      public static const const_116:String = "me_menu_top_view";
      
      public static const const_1279:String = "me_menu_rooms_view";
      
      public static const const_1017:String = "me_menu_dance_moves_view";
      
      public static const const_241:String = "me_menu_my_clothes_view";
       
      
      private var var_2067:Boolean = false;
      
      private var _isAnimating:Boolean = false;
      
      private var _eventDispatcher:IEventDispatcher;
      
      private var var_1521:int = 0;
      
      private var var_2066:int = 0;
      
      private var var_2064:Boolean = false;
      
      private var var_269:Boolean = false;
      
      private var var_2063:int = 0;
      
      private var var_1918:Number = 0;
      
      private var _mainContainer:IWindowContainer;
      
      private var var_577:Boolean = false;
      
      private var var_95:ClubPromoView;
      
      private var _config:IHabboConfigurationManager;
      
      private var var_1281:int = 0;
      
      private var var_2065:Boolean = false;
      
      private var var_1055:Point;
      
      private var var_28:IMeMenuView;
      
      public function MeMenuWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager, param4:IEventDispatcher, param5:IHabboConfigurationManager)
      {
         super(param1,param2,param3);
         _config = param5;
         var_1055 = new Point(0,0);
         _eventDispatcher = param4;
         if(param5 != null && false)
         {
            var_2065 = param5.getKey("client.news.embed.enabled","false") == "true";
         }
         changeView(const_116);
         hide();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetWaveUpdateEvent.const_655,onWaveEvent);
         param1.addEventListener(RoomWidgetDanceUpdateEvent.const_511,onDanceEvent);
         param1.addEventListener(RoomWidgetUpdateEffectsUpdateEvent.const_646,onUpdateEffects);
         param1.addEventListener(RoomWidgetToolbarClickedUpdateEvent.const_530,onToolbarClicked);
         param1.addEventListener(RoomWidgetFrameUpdateEvent.const_300,onUpdate);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_675,onAvatarEditorClosed);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_433,onShowAvatarEditorClubPromo);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_843,onHideAvatarEditorClubPromo);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_185,onAvatarDeselected);
         param1.addEventListener(RoomWidgetHabboClubUpdateEvent.const_187,onHabboClubEvent);
         param1.addEventListener(RoomWidgetAvatarActionUpdateEvent.const_622,onAvatarActionEvent);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_211,onUserInfo);
         param1.addEventListener(RoomWidgetSettingsUpdateEvent.const_305,onSettingsUpdate);
         param1.addEventListener(RoomWidgetTutorialEvent.const_101,onTutorialEvent);
         param1.addEventListener(RoomWidgetTutorialEvent.const_396,onTutorialEvent);
         param1.addEventListener(RoomWidgetCreditBalanceUpdateEvent.const_170,onCreditBalance);
         super.registerUpdateEvents(param1);
      }
      
      private function onUpdate(param1:Event = null) : void
      {
         if(!_isAnimating)
         {
            return;
         }
      }
      
      override public function get mainWindow() : IWindow
      {
         return _mainContainer;
      }
      
      public function get hasEffectOn() : Boolean
      {
         return var_577;
      }
      
      private function onSettingsUpdate(param1:RoomWidgetSettingsUpdateEvent) : void
      {
         if(!var_269)
         {
            return;
         }
         if(var_28.window.name == const_522)
         {
            (var_28 as MeMenuSettingsView).updateSettings(param1);
         }
      }
      
      public function get isHabboClubActive() : Boolean
      {
         return var_1281 > 0;
      }
      
      private function onWaveEvent(param1:RoomWidgetWaveUpdateEvent) : void
      {
         Logger.log("[MeMenuWidget] Wave Event received");
      }
      
      private function onCreditBalance(param1:RoomWidgetCreditBalanceUpdateEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var_1521 = param1.balance;
         localizations.registerParameter("widget.memenu.credits","credits",var_1521.toString());
      }
      
      private function onUserInfo(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         var _loc2_:* = null;
         if(!(var_269 && var_28.window.name == const_241))
         {
            _loc2_ = new RoomWidgetRequestWidgetMessage(RoomWidgetRequestWidgetMessage.const_730);
            if(messageListener != null)
            {
               messageListener.processWidgetMessage(_loc2_);
            }
         }
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetWaveUpdateEvent.const_655,onWaveEvent);
         param1.removeEventListener(RoomWidgetDanceUpdateEvent.const_511,onDanceEvent);
         param1.removeEventListener(RoomWidgetUpdateEffectsUpdateEvent.const_646,onUpdateEffects);
         param1.removeEventListener(RoomWidgetToolbarClickedUpdateEvent.const_530,onToolbarClicked);
         param1.removeEventListener(RoomWidgetFrameUpdateEvent.const_300,onUpdate);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_185,onAvatarDeselected);
         param1.removeEventListener(RoomWidgetHabboClubUpdateEvent.const_187,onHabboClubEvent);
         param1.removeEventListener(RoomWidgetAvatarActionUpdateEvent.const_622,onAvatarActionEvent);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_675,onAvatarEditorClosed);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_433,onShowAvatarEditorClubPromo);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_843,onHideAvatarEditorClubPromo);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_211,onUserInfo);
         param1.removeEventListener(RoomWidgetSettingsUpdateEvent.const_305,onSettingsUpdate);
         param1.removeEventListener(RoomWidgetTutorialEvent.const_396,onTutorialEvent);
         param1.removeEventListener(RoomWidgetTutorialEvent.const_101,onTutorialEvent);
         param1.removeEventListener(RoomWidgetCreditBalanceUpdateEvent.const_170,onCreditBalance);
      }
      
      override public function dispose() : void
      {
         hide();
         _eventDispatcher = null;
         if(var_28 != null)
         {
            var_28.dispose();
            var_28 = null;
         }
         super.dispose();
      }
      
      public function get allowHabboClubDances() : Boolean
      {
         return var_2067;
      }
      
      public function changeToOutfit(param1:int) : void
      {
         var_1918 = new Date().valueOf();
         this.messageListener.processWidgetMessage(new RoomWidgetSelectOutfitMessage(param1));
      }
      
      private function onHideAvatarEditorClubPromo(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         if(var_95 != null)
         {
            var_95.dispose();
            var_95 = null;
         }
         updateSize();
      }
      
      public function get isDancing() : Boolean
      {
         return var_2064;
      }
      
      public function get creditBalance() : int
      {
         return var_1521;
      }
      
      private function onTutorialEvent(param1:RoomWidgetTutorialEvent) : void
      {
         switch(param1.type)
         {
            case RoomWidgetTutorialEvent.const_396:
               Logger.log("* MeMenuWidget: onHighlightClothesIcon " + var_269 + " view: " + var_28.window.name);
               if(var_269 != true || var_28.window.name != const_116)
               {
                  return;
               }
               (var_28 as MeMenuMainView).setIconAssets("clothes_icon",const_116,"clothes_highlighter_blue");
               break;
            case RoomWidgetTutorialEvent.const_101:
               hide();
         }
      }
      
      public function canChangeOutfit() : Boolean
      {
         var _loc1_:Number = new Date().valueOf();
         return _loc1_ - var_1918 > 5000;
      }
      
      public function get habboClubPeriods() : int
      {
         return var_2066;
      }
      
      private function onAvatarActionEvent(param1:RoomWidgetAvatarActionUpdateEvent) : void
      {
         switch(param1.actionType)
         {
            case RoomWidgetAvatarActionUpdateEvent.EFFECT_ACTIVE:
               var_577 = true;
               break;
            case RoomWidgetAvatarActionUpdateEvent.EFFECT_INACTIVE:
               var_577 = false;
               break;
            default:
               trace("MeMenuWidget: unknown avatar action event: " + param1.actionType);
         }
      }
      
      private function onHabboClubEvent(param1:RoomWidgetHabboClubUpdateEvent) : void
      {
         var _loc2_:* = var_1281 > 0;
         var_1281 = param1.daysLeft;
         var_2066 = param1.periodsLeft;
         var_2063 = param1.pastPeriods;
         var_2067 = param1.allowClubDances;
         if(_loc2_ != param1.daysLeft > 0)
         {
            if(var_28 != null)
            {
               changeView(var_28.window.name);
            }
         }
      }
      
      public function set isDancing(param1:Boolean) : void
      {
         var_2064 = param1;
      }
      
      private function onAvatarDeselected(param1:Event) : void
      {
         if(var_28 != null && var_28.window.name != const_241)
         {
            hide();
         }
      }
      
      private function onShowAvatarEditorClubPromo(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         var _loc2_:* = null;
         if(var_28 != null && var_28.window.name == const_241)
         {
            if(param1.promoMode == RoomWidgetAvatarEditorUpdateEvent.const_982)
            {
               var_95 = new ClubPromoView(this,param1.promoImageUrl,ClubPromoView.const_1272);
            }
            else
            {
               var_95 = new ClubPromoView(this,param1.promoImageUrl,ClubPromoView.const_368);
            }
            _loc2_ = _mainContainer.getChildByName(var_28.window.name);
            if(_loc2_ != null)
            {
               var_95.window.x = _loc2_.width + const_770;
               _mainContainer.addChild(var_95.window);
               _mainContainer.width = var_95.window.x + var_95.window.width;
            }
         }
      }
      
      private function onUpdateEffects(param1:RoomWidgetUpdateEffectsUpdateEvent) : void
      {
         var _loc2_:* = null;
         var_577 = false;
         for each(_loc2_ in param1.effects)
         {
            if(_loc2_.isInUse)
            {
               var_577 = true;
            }
         }
         if(var_28 != null && var_28.window.name == const_683)
         {
            (var_28 as MeMenuEffectsView).updateEffects(param1.effects);
         }
      }
      
      public function get habboClubPastPeriods() : int
      {
         return var_2063;
      }
      
      public function get habboClubDays() : int
      {
         return var_1281;
      }
      
      public function get mainContainer() : IWindowContainer
      {
         if(_mainContainer == null)
         {
            _mainContainer = windowManager.createWindow("me_menu_main_container","",HabboWindowType.const_1330,HabboWindowStyle.const_959,HabboWindowParam.const_39,new Rectangle(0,0,170,260)) as IWindowContainer;
            _mainContainer.tags.push("room_widget_me_menu");
         }
         return _mainContainer;
      }
      
      private function onToolbarClicked(param1:RoomWidgetToolbarClickedUpdateEvent) : void
      {
         switch(param1.iconType)
         {
            case RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ME_MENU:
               var_269 = !var_269;
               break;
            case RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ROOM_INFO:
               var_269 = false;
               break;
            default:
               return;
         }
         if(var_269)
         {
            show();
         }
         else
         {
            hide();
         }
      }
      
      private function onDanceEvent(param1:RoomWidgetDanceUpdateEvent) : void
      {
         Logger.log("[MeMenuWidget] Dance Event received, style: " + param1.style);
      }
      
      public function hide(param1:RoomWidgetRoomObjectUpdateEvent = null) : void
      {
         var _loc2_:RoomWidgetToolbarMessage = new RoomWidgetToolbarMessage(RoomWidgetToolbarMessage.const_583);
         _loc2_.window = _mainContainer.parent as IWindowContainer;
         if(messageListener != null)
         {
            messageListener.processWidgetMessage(_loc2_);
         }
         if(var_28 != null)
         {
            _mainContainer.removeChild(var_28.window);
            var_28.dispose();
            var_28 = null;
         }
         var_269 = false;
         _eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_CLOSE));
      }
      
      private function onAvatarEditorClosed(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         if(var_28 != null && var_28.window.name == const_241)
         {
            if(var_95 != null)
            {
               var_95.dispose();
               var_95 = null;
            }
            changeView(const_116);
         }
      }
      
      public function get isNewsEnabled() : Boolean
      {
         return var_2065;
      }
      
      public function changeView(param1:String) : void
      {
         var _loc2_:* = null;
         if(var_95 != null)
         {
            var_95.dispose();
            var_95 = null;
         }
         switch(param1)
         {
            case const_116:
               _loc2_ = new MeMenuMainView();
               _eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DEFAULT));
               break;
            case const_683:
               _loc2_ = new MeMenuEffectsView();
               _eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_EFFECTS));
               break;
            case const_1017:
               _loc2_ = new MeMenuDanceView();
               _eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DANCE));
               break;
            case const_241:
               _loc2_ = new MeMenuClothesView();
               break;
            case const_1279:
               _loc2_ = new MeMenuRoomsView();
               break;
            case const_522:
               _loc2_ = new MeMenuSettingsView();
               break;
            default:
               Logger.log("Me Menu Change view: unknown view: " + param1);
         }
         if(_loc2_ != null)
         {
            if(var_28 != null)
            {
               _mainContainer.removeChild(var_28.window);
               var_28.dispose();
               var_28 = null;
            }
            var_28 = _loc2_;
            var_28.init(this,param1);
         }
         updateSize();
      }
      
      public function updateSize() : void
      {
         if(var_28 != null)
         {
            var_1055.x = var_28.window.width + 10;
            var_1055.y = var_28.window.height;
            var_28.window.x = 5;
            var_28.window.y = 0;
            _mainContainer.width = var_1055.x;
            _mainContainer.height = var_1055.y;
            if(var_95 != null)
            {
               _mainContainer.width = var_95.window.x + var_95.window.width + const_770;
            }
         }
      }
      
      public function get config() : IHabboConfigurationManager
      {
         return _config;
      }
      
      private function show() : void
      {
         if(!_mainContainer || true)
         {
            return;
         }
         changeView(const_116);
         var _loc1_:RoomWidgetToolbarMessage = new RoomWidgetToolbarMessage(RoomWidgetToolbarMessage.const_516);
         _loc1_.window = _mainContainer.parent as IWindowContainer;
         if(messageListener != null)
         {
            messageListener.processWidgetMessage(_loc1_);
         }
         var_269 = true;
      }
   }
}
