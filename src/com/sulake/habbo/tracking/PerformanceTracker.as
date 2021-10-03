package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.utils.debug.GarbageMonitor;
   import com.sulake.habbo.communication.messages.outgoing.tracking.PerformanceLogMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.external.ExternalInterface;
   import flash.system.Capabilities;
   import flash.system.System;
   import flash.utils.getTimer;
   
   public class PerformanceTracker
   {
       
      
      private var var_1377:GarbageMonitor = null;
      
      private var var_1109:int = 0;
      
      private var var_1246:Boolean = false;
      
      private var var_1601:String = "";
      
      private var var_1378:String = "";
      
      private var var_319:Number = 0;
      
      private var var_1108:int = 10;
      
      private var var_2275:Array;
      
      private var var_619:int = 0;
      
      private var var_1107:int = 60;
      
      private var var_933:int = 0;
      
      private var var_934:int = 0;
      
      private var var_1993:String = "";
      
      private var var_1599:Number = 0;
      
      private var var_1110:int = 1000;
      
      private var var_1602:Boolean = true;
      
      private var var_1600:Number = 0.15;
      
      private var var_168:IHabboConfigurationManager = null;
      
      private var var_1603:String = "";
      
      private var var_1111:int = 0;
      
      private var _connection:IConnection = null;
      
      public function PerformanceTracker()
      {
         var_2275 = [];
         super();
         var_1378 = Capabilities.version;
         var_1601 = Capabilities.os;
         var_1246 = Capabilities.isDebugger;
         var_1603 = !true ? ExternalInterface.call("window.navigator.userAgent.toString") : "unknown";
         var_1377 = new GarbageMonitor();
         updateGarbageMonitor();
         var_1109 = getTimer();
      }
      
      private function updateGarbageMonitor() : Object
      {
         var _loc2_:* = null;
         var _loc1_:Array = var_1377.list;
         if(_loc1_ == null || _loc1_.length == 0)
         {
            _loc2_ = new GarbageTester("tester");
            var_1377.insert(_loc2_,"tester");
            return _loc2_;
         }
         return null;
      }
      
      public function dispose() : void
      {
      }
      
      public function get averageUpdateInterval() : int
      {
         return var_319;
      }
      
      private function differenceInPercents(param1:Number, param2:Number) : Number
      {
         if(param1 == param2)
         {
            return 0;
         }
         var _loc3_:Number = param1;
         var _loc4_:Number = param2;
         if(param2 > param1)
         {
            _loc3_ = param2;
            _loc4_ = param1;
         }
         return 100 * (1 - _loc4_ / _loc3_);
      }
      
      public function set reportInterval(param1:int) : void
      {
         var_1107 = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
      
      public function get flashVersion() : String
      {
         return var_1378;
      }
      
      public function update(param1:uint) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Boolean = false;
         var _loc6_:Number = NaN;
         var _loc2_:Object = updateGarbageMonitor();
         if(_loc2_ != null)
         {
            ++var_934;
            Logger.log("Garbage collection");
         }
         var _loc3_:Boolean = false;
         if(param1 > var_1110)
         {
            ++var_933;
            _loc3_ = true;
         }
         else
         {
            ++var_619;
            if(var_619 <= 1)
            {
               var_319 = param1;
            }
            else
            {
               _loc4_ = Number(var_619);
               var_319 = var_319 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
            }
         }
         if(getTimer() - var_1109 > var_1107 * 1000 && var_1111 < var_1108)
         {
            Logger.log("*** Performance tracker: average frame rate " + 1000 / var_319);
            _loc5_ = true;
            if(var_1602 && var_1111 > 0)
            {
               _loc6_ = differenceInPercents(var_1599,var_319);
               if(_loc6_ < var_1600)
               {
                  _loc5_ = false;
               }
            }
            var_1109 = getTimer();
            if(_loc5_ || _loc3_)
            {
               var_1599 = var_319;
               if(sendReport())
               {
                  ++var_1111;
               }
            }
         }
      }
      
      public function set reportLimit(param1:int) : void
      {
         var_1108 = param1;
      }
      
      public function set slowUpdateLimit(param1:int) : void
      {
         var_1110 = param1;
      }
      
      private function sendReport() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(_connection != null)
         {
            _loc1_ = null;
            _loc2_ = getTimer() / 1000;
            _loc3_ = -1;
            _loc4_ = 0;
            _loc1_ = new PerformanceLogMessageComposer(_loc2_,var_1603,var_1378,var_1601,var_1993,var_1246,_loc4_,_loc3_,var_934,var_319,var_933);
            _connection.send(_loc1_);
            var_934 = 0;
            var_319 = 0;
            var_619 = 0;
            var_933 = 0;
            return true;
         }
         return false;
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         var_168 = param1;
         var_1107 = int(var_168.getKey("performancetest.interval","60"));
         var_1110 = int(var_168.getKey("performancetest.slowupdatelimit","1000"));
         var_1108 = int(var_168.getKey("performancetest.reportlimit","10"));
         var_1600 = Number(var_168.getKey("performancetest.distribution.deviancelimit.percent","10"));
         var_1602 = Boolean(int(var_168.getKey("performancetest.distribution.enabled","1")));
      }
   }
}
