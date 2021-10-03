package com.sulake.habbo.moderation
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IDropMenuWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.moderation.INamed;
   import com.sulake.habbo.communication.messages.incoming.moderation.OffenceCategoryData;
   import com.sulake.habbo.communication.messages.incoming.moderation.OffenceData;
   import com.sulake.habbo.communication.messages.outgoing.moderator.ModAlertMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.moderator.ModBanMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.moderator.ModKickMessageComposer;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.events.Event;
   
   public class ModActionCtrl implements IDisposable, TrackedWindow
   {
      
      private static var var_138:Array;
       
      
      private var _disposed:Boolean;
      
      private var var_889:IButtonWindow;
      
      private var var_1327:int;
      
      private var var_49:ModerationManager;
      
      private var var_722:OffenceCategoryData;
      
      private var var_419:ITextFieldWindow;
      
      private var var_890:IButtonWindow;
      
      private var var_1326:String;
      
      private var var_289:Boolean = true;
      
      private var var_1555:String;
      
      private var var_891:IDropMenuWindow;
      
      private var var_52:IFrameWindow;
      
      private var var_721:OffenceData;
      
      public function ModActionCtrl(param1:ModerationManager, param2:int, param3:String, param4:String)
      {
         super();
         var_49 = param1;
         var_1327 = param2;
         var_1555 = param3;
         var_1326 = param4;
         if(var_138 == null)
         {
            var_138 = new Array();
            var_138.push(new BanDefinition("2 hours",2));
            var_138.push(new BanDefinition("4 hours",4));
            var_138.push(new BanDefinition("12 hours",12));
            var_138.push(new BanDefinition("24 hours",24));
            var_138.push(new BanDefinition("2 days",48));
            var_138.push(new BanDefinition("3 days",72));
            var_138.push(new BanDefinition("1 week",168));
            var_138.push(new BanDefinition("2 weeks",336));
            var_138.push(new BanDefinition("3 weeks",504));
            var_138.push(new BanDefinition("1 month",720));
            var_138.push(new BanDefinition("2 months",1440));
            var_138.push(new BanDefinition("1 year",8760));
            var_138.push(new BanDefinition("2 years",17520));
            var_138.push(new BanDefinition("Permanent",100000));
         }
         var_889 = IButtonWindow(var_49.getXmlWindow("modact_offence"));
         var_890 = IButtonWindow(var_49.getXmlWindow("modact_offencectg"));
      }
      
      public static function hideChildren(param1:IWindowContainer) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < param1.numChildren)
         {
            param1.getChildAt(_loc2_).visible = false;
            _loc2_++;
         }
      }
      
      private function onBanButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Ban...");
         if(!isMsgGiven())
         {
            return;
         }
         if(this.var_891.selection < 0)
         {
            var_49.windowManager.alert("Alert","You must select ban lenght",0,onAlertClose);
            return;
         }
         var_49.connection.send(new ModBanMessageComposer(var_1327,var_419.text,getBanLength(),var_1326));
         this.dispose();
      }
      
      public function getId() : String
      {
         return var_1555;
      }
      
      private function onInputClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_198)
         {
            return;
         }
         if(!var_289)
         {
            return;
         }
         var_419.text = "";
         var_289 = false;
      }
      
      private function getBanLength() : int
      {
         var _loc1_:int = this.var_891.selection;
         var _loc2_:BanDefinition = var_138[_loc1_];
         return _loc2_.banLengthHours;
      }
      
      private function prepareBanSelect(param1:IDropMenuWindow) : void
      {
         var _loc3_:* = null;
         var _loc2_:Array = new Array();
         for each(_loc3_ in var_138)
         {
            _loc2_.push(_loc3_.name);
         }
         param1.populate(_loc2_);
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      private function refreshButtons(param1:String, param2:int, param3:Array, param4:IWindow, param5:Function) : void
      {
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc6_:IWindowContainer = IWindowContainer(var_52.findChildByName(param1));
         hideChildren(_loc6_);
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         for each(_loc11_ in param3)
         {
            _loc12_ = "" + _loc7_;
            _loc13_ = IButtonWindow(_loc6_.findChildByName(_loc12_));
            if(_loc13_ == null)
            {
               _loc13_ = IButtonWindow(param4.clone());
               _loc13_.procedure = param5;
               _loc13_.x = _loc9_ * (param4.width + 5);
               _loc13_.y = _loc8_ * (param4.height + 5);
               _loc13_.name = _loc12_;
               _loc6_.addChild(_loc13_);
            }
            _loc13_.caption = _loc11_.name;
            _loc13_.visible = true;
            _loc7_++;
            _loc9_++;
            if(_loc9_ >= param2)
            {
               _loc9_ = 0;
               _loc8_++;
            }
         }
         _loc6_.height = RoomToolCtrl.getLowestPoint(_loc6_);
         _loc6_.visible = true;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(var_52 != null)
         {
            var_52.destroy();
            var_52 = null;
         }
         if(var_889 != null)
         {
            var_889.destroy();
            var_889 = null;
         }
         if(var_890 != null)
         {
            var_890.destroy();
            var_890 = null;
         }
         var_891 = null;
         var_419 = null;
         var_49 = null;
      }
      
      private function onSendCautionButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Sending caution...");
         if(!isMsgGiven())
         {
            return;
         }
         var_49.connection.send(new ModAlertMessageComposer(var_1327,var_419.text,var_1326));
         this.dispose();
      }
      
      private function onAlertClose(param1:IAlertDialog, param2:Event) : void
      {
         param1.dispose();
      }
      
      public function getType() : int
      {
         return WindowTracker.const_1228;
      }
      
      private function onChangeCategorizationButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(var_721 != null)
         {
            var_721 = null;
         }
         else
         {
            var_722 = null;
         }
         this.refreshCategorization();
      }
      
      private function onOffenceCtgButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:int = int(param2.name);
         var_722 = var_49.initMsg.offenceCategories[_loc3_];
         this.refreshCategorization();
      }
      
      public function getFrame() : IFrameWindow
      {
         return var_52;
      }
      
      private function isMsgGiven() : Boolean
      {
         if(var_289 || false)
         {
            var_49.windowManager.alert("Alert","You must input a message to the user",0,onAlertClose);
            return false;
         }
         return true;
      }
      
      private function onKickButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Kick...");
         if(!isMsgGiven())
         {
            return;
         }
         var_49.connection.send(new ModKickMessageComposer(var_1327,var_419.text,var_1326));
         this.dispose();
      }
      
      private function onClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         dispose();
      }
      
      public function refreshCategorization() : void
      {
         var _loc1_:IWindowContainer = IWindowContainer(var_52.findChildByName("categorization_cont"));
         hideChildren(_loc1_);
         _loc1_.findChildByName("categorization_caption_txt").visible = true;
         _loc1_.findChildByName("change_categorization_but").visible = var_722 != null;
         if(this.var_721 != null)
         {
            var_52.findChildByName("offence_txt").caption = this.var_721.name;
            var_52.findChildByName("offence_category").visible = true;
         }
         else if(this.var_722 != null)
         {
            this.refreshButtons("offences_cont",2,var_722.offences,var_889,onOffenceButton);
         }
         else
         {
            this.refreshButtons("offence_categories_cont",3,var_49.initMsg.offenceCategories,var_890,onOffenceCtgButton);
            _loc1_.height = RoomToolCtrl.getLowestPoint(_loc1_);
         }
      }
      
      private function onOffenceButton(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:int = int(param2.name);
         var_721 = var_722.offences[_loc3_];
         var_419.text = var_721.msg;
         var_289 = false;
         this.refreshCategorization();
      }
      
      public function show() : void
      {
         var_52 = IFrameWindow(var_49.getXmlWindow("modact_summary"));
         var_52.caption = "Mod action on: " + var_1555;
         var_52.findChildByName("send_caution_but").procedure = onSendCautionButton;
         var_52.findChildByName("kick_but").procedure = onKickButton;
         var_52.findChildByName("ban_but").procedure = onBanButton;
         var_52.findChildByName("change_categorization_but").procedure = onChangeCategorizationButton;
         var_49.disableButton(var_49.initMsg.alertPermission,var_52,"send_caution_but");
         var_49.disableButton(var_49.initMsg.kickPermission,var_52,"kick_but");
         var_49.disableButton(var_49.initMsg.banPermission,var_52,"ban_but");
         var_419 = ITextFieldWindow(var_52.findChildByName("message_input"));
         var_419.procedure = onInputClick;
         var_891 = IDropMenuWindow(var_52.findChildByName("banLengthSelect"));
         prepareBanSelect(var_891);
         var _loc1_:IWindow = var_52.findChildByTag("close");
         _loc1_.procedure = onClose;
         refreshCategorization();
         var_52.visible = true;
      }
   }
}
