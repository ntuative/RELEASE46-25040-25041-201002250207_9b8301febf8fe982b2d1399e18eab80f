package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.tracking.LatencyPingResponseMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.tracking.LatencyPingReportMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.tracking.LatencyPingRequestMessageComposer;
   import com.sulake.habbo.communication.messages.parser.tracking.LatencyPingResponseMessageParser;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.utils.getTimer;
   
   public class LatencyTracker
   {
       
      
      private var var_151:Array;
      
      private var var_33:Boolean = false;
      
      private var var_1427:int = 0;
      
      private var var_1429:int = 0;
      
      private var _communication:IHabboCommunicationManager;
      
      private var var_460:Map;
      
      private var var_1747:int = 0;
      
      private var var_1426:int = 0;
      
      private var var_168:IHabboConfigurationManager;
      
      private var var_1173:int = 0;
      
      private var _connection:IConnection;
      
      private var var_1428:int = 0;
      
      public function LatencyTracker()
      {
         super();
      }
      
      public function update(param1:uint) : void
      {
         if(!var_33)
         {
            return;
         }
         if(getTimer() - var_1427 > var_1429)
         {
            testLatency();
         }
      }
      
      private function testLatency() : void
      {
         var_1427 = getTimer();
         var_460.add(var_1173,var_1427);
         _connection.send(new LatencyPingRequestMessageComposer(var_1173));
         ++var_1173;
      }
      
      public function set communication(param1:IHabboCommunicationManager) : void
      {
         _communication = param1;
      }
      
      public function init() : void
      {
         if(var_168 == null || _communication == null || _connection == null)
         {
            return;
         }
         var_1429 = int(var_168.getKey("latencytest.interval"));
         var_1428 = int(var_168.getKey("latencytest.report.index"));
         var_1747 = int(var_168.getKey("latencytest.report.delta"));
         _communication.addHabboConnectionMessageEvent(new LatencyPingResponseMessageEvent(onPingResponse));
         if(var_1429 < 1)
         {
            return;
         }
         var_460 = new Map();
         var_151 = new Array();
         var_33 = true;
      }
      
      private function onPingResponse(param1:IMessageEvent) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:* = null;
         if(var_460 == null || var_151 == null)
         {
            return;
         }
         var _loc2_:LatencyPingResponseMessageParser = (param1 as LatencyPingResponseMessageEvent).getParser();
         var _loc3_:int = var_460.getValue(_loc2_.requestId);
         var_460.remove(_loc2_.requestId);
         var _loc4_:int = getTimer() - _loc3_;
         var_151.push(_loc4_);
         if(var_151.length == var_1428 && var_1428 > 0)
         {
            _loc5_ = 0;
            _loc6_ = 0;
            _loc7_ = 0;
            _loc8_ = 0;
            while(_loc8_ < var_151.length)
            {
               _loc5_ += var_151[_loc8_];
               _loc8_++;
            }
            _loc9_ = _loc5_ / 0;
            _loc8_ = 0;
            while(_loc8_ < var_151.length)
            {
               if(var_151[_loc8_] < _loc9_ * 2)
               {
                  _loc6_ += var_151[_loc8_];
                  _loc7_++;
               }
               _loc8_++;
            }
            if(_loc7_ == 0)
            {
               var_151 = [];
               return;
            }
            _loc10_ = _loc6_ / _loc7_;
            if(Math.abs(_loc9_ - var_1426) > var_1747 || var_1426 == 0)
            {
               var_1426 = _loc9_;
               _loc11_ = new LatencyPingReportMessageComposer(_loc9_,_loc10_,var_151.length);
               _connection.send(_loc11_);
            }
            var_151 = [];
         }
      }
      
      public function dispose() : void
      {
         var_33 = false;
         var_168 = null;
         _communication = null;
         _connection = null;
         if(var_460 != null)
         {
            var_460.dispose();
            var_460 = null;
         }
         var_151 = null;
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         var_168 = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
   }
}
