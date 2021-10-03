package com.sulake.habbo.help
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.help.cfh.data.CallForHelpData;
   import com.sulake.habbo.help.cfh.data.UserRegistry;
   import com.sulake.habbo.help.enum.HabboHelpViewEnum;
   import com.sulake.habbo.help.help.HelpUI;
   import com.sulake.habbo.help.help.data.FaqIndex;
   import com.sulake.habbo.help.tutorial.TutorialUI;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.events.RoomSessionEvent;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import com.sulake.iid.IIDHabboToolbar;
   import flash.utils.Dictionary;
   import iid.IIDHabboWindowManager;
   
   public class HabboHelp extends Component implements IHabboHelp
   {
       
      
      private var var_2230:UserRegistry;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_142:TutorialUI;
      
      private var var_737:IHabboLocalizationManager;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_59:HelpUI;
      
      private var var_738:IHabboConfigurationManager;
      
      private var var_194:IHabboToolbar;
      
      private var var_300:IHabboCommunicationManager;
      
      private var var_911:FaqIndex;
      
      private var var_2046:String = "";
      
      private var var_1019:IncomingMessages;
      
      private var var_1344:CallForHelpData;
      
      public function HabboHelp(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         var_1344 = new CallForHelpData();
         var_2230 = new UserRegistry();
         super(param1,param2,param3);
         _assetLibrary = param3;
         var_911 = new FaqIndex();
         queueInterface(new IIDHabboWindowManager(),onWindowManagerReady);
      }
      
      public function get toolbar() : IHabboToolbar
      {
         return var_194;
      }
      
      public function tellUI(param1:String, param2:* = null) : void
      {
         if(var_59 != null)
         {
            var_59.tellUI(param1,param2);
         }
      }
      
      private function toggleHelpUI() : void
      {
         if(var_59 == null)
         {
            if(!createHelpUI())
            {
               return;
            }
         }
         var_59.toggleUI();
      }
      
      private function removeTutorialUI() : void
      {
         if(var_142 != null)
         {
            var_142.dispose();
            var_142 = null;
         }
      }
      
      public function get ownUserName() : String
      {
         return var_2046;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return _windowManager;
      }
      
      public function reportUser(param1:int, param2:String) : void
      {
         var_1344.reportedUserId = param1;
         var_1344.reportedUserName = param2;
         var_59.showUI(HabboHelpViewEnum.const_304);
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return var_737;
      }
      
      private function onRoomSessionEvent(param1:RoomSessionEvent) : void
      {
         switch(param1.type)
         {
            case RoomSessionEvent.const_85:
               if(var_59 != null)
               {
                  var_59.setRoomSessionStatus(true);
               }
               if(var_142 != null)
               {
                  var_142.setRoomSessionStatus(true);
               }
               break;
            case RoomSessionEvent.const_97:
               if(var_59 != null)
               {
                  var_59.setRoomSessionStatus(false);
               }
               if(var_142 != null)
               {
                  var_142.setRoomSessionStatus(false);
               }
               userRegistry.unregisterRoom();
         }
      }
      
      public function enableCallForGuideBotUI() : void
      {
         if(var_59 != null)
         {
            var_59.updateCallForGuideBotUI(true);
         }
      }
      
      public function get userRegistry() : UserRegistry
      {
         return var_2230;
      }
      
      public function showCallForHelpResult(param1:String) : void
      {
         if(var_59 != null)
         {
            var_59.showCallForHelpResult(param1);
         }
      }
      
      override public function dispose() : void
      {
         if(var_59 != null)
         {
            var_59.dispose();
            var_59 = null;
         }
         if(var_142 != null)
         {
            var_142.dispose();
            var_142 = null;
         }
         if(var_911 != null)
         {
            var_911.dispose();
            var_911 = null;
         }
         var_1019 = null;
         if(var_194)
         {
            var_194.release(new IIDHabboToolbar());
            var_194 = null;
         }
         if(var_737)
         {
            var_737.release(new IIDHabboLocalizationManager());
            var_737 = null;
         }
         if(var_300)
         {
            var_300.release(new IIDHabboCommunicationManager());
            var_300 = null;
         }
         if(var_738)
         {
            var_738.release(new IIDHabboConfigurationManager());
            var_738 = null;
         }
         if(_windowManager)
         {
            _windowManager.release(new IIDHabboWindowManager());
            _windowManager = null;
         }
         super.dispose();
      }
      
      private function setHabboToolbarIcon() : void
      {
         if(var_194 != null)
         {
            var_194.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_115,HabboToolbarIconEnum.HELP));
         }
      }
      
      private function createTutorialUI() : Boolean
      {
         if(var_142 == null && _assetLibrary != null && _windowManager != null)
         {
            var_142 = new TutorialUI(this);
         }
         return var_142 != null;
      }
      
      private function createHelpUI() : Boolean
      {
         if(var_59 == null && _assetLibrary != null && _windowManager != null)
         {
            var_59 = new HelpUI(this,_assetLibrary,_windowManager,var_737,var_194);
         }
         return var_59 != null;
      }
      
      public function set ownUserName(param1:String) : void
      {
         var_2046 = param1;
      }
      
      public function get callForHelpData() : CallForHelpData
      {
         return var_1344;
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _windowManager = IHabboWindowManager(param2);
         queueInterface(new IIDHabboCommunicationManager(),onCommunicationManagerReady);
      }
      
      private function onLocalizationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_737 = IHabboLocalizationManager(param2);
         queueInterface(new IIDHabboConfigurationManager(),onConfigurationManagerReady);
      }
      
      public function updateTutorial(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         if(param1 && param2 && param3)
         {
            removeTutorialUI();
            return;
         }
         if(var_142 == null)
         {
            if(!createTutorialUI())
            {
               return;
            }
         }
         var_142.update(param1,param2,param3);
      }
      
      private function onCommunicationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_300 = IHabboCommunicationManager(param2);
         var_1019 = new IncomingMessages(this,var_300);
         queueInterface(new IIDHabboToolbar(),onToolbarReady);
      }
      
      public function showUI(param1:String = null) : void
      {
         if(var_59 != null)
         {
            var_59.showUI(param1);
         }
      }
      
      public function sendMessage(param1:IMessageComposer) : void
      {
         if(var_300 != null && param1 != null)
         {
            var_300.getHabboMainConnection(null).send(param1);
         }
      }
      
      public function getFaq() : FaqIndex
      {
         return var_911;
      }
      
      public function disableCallForGuideBotUI() : void
      {
         if(var_59 != null)
         {
            var_59.updateCallForGuideBotUI(false);
         }
      }
      
      public function hideUI() : void
      {
         if(var_59 != null)
         {
            var_59.hideUI();
         }
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_194 = IHabboToolbar(param2);
         queueInterface(new IIDHabboLocalizationManager(),onLocalizationManagerReady);
      }
      
      private function onConfigurationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_738 = IHabboConfigurationManager(param2);
         queueInterface(new IIDHabboRoomSessionManager(),onRoomSessionManagerReady);
      }
      
      public function get tutorialUI() : TutorialUI
      {
         return var_142;
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type == HabboToolbarEvent.const_79)
         {
            setHabboToolbarIcon();
            return;
         }
         if(param1.type == HabboToolbarEvent.const_55)
         {
            if(param1.iconId == HabboToolbarIconEnum.HELP)
            {
               toggleHelpUI();
               return;
            }
         }
      }
      
      private function onRoomSessionManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var _loc3_:IRoomSessionManager = IRoomSessionManager(param2);
         _loc3_.events.addEventListener(RoomSessionEvent.const_85,onRoomSessionEvent);
         _loc3_.events.addEventListener(RoomSessionEvent.const_97,onRoomSessionEvent);
         var_194.events.addEventListener(HabboToolbarEvent.const_79,onHabboToolbarEvent);
         var_194.events.addEventListener(HabboToolbarEvent.const_55,onHabboToolbarEvent);
         createHelpUI();
         setHabboToolbarIcon();
      }
      
      public function showCallForHelpReply(param1:String) : void
      {
         if(var_59 != null)
         {
            var_59.showCallForHelpReply(param1);
         }
      }
      
      public function getConfigurationKey(param1:String, param2:String = null, param3:Dictionary = null) : String
      {
         if(var_738 == null)
         {
            return param1;
         }
         return var_738.getKey(param1,param2,param3);
      }
   }
}
