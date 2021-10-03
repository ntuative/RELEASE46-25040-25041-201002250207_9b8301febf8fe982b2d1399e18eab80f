package com.sulake.habbo.help.cfh.data
{
   import com.sulake.core.utils.Map;
   
   public class UserRegistry
   {
      
      private static const const_1040:int = 80;
       
      
      private var var_442:Map;
      
      private var var_625:String = "";
      
      private var var_1128:Array;
      
      public function UserRegistry()
      {
         var_442 = new Map();
         var_1128 = new Array();
         super();
      }
      
      private function addRoomNameForMissing() : void
      {
         var _loc1_:* = null;
         while(false)
         {
            _loc1_ = var_442.getValue(var_1128.shift());
            if(_loc1_ != null)
            {
               _loc1_.roomName = var_625;
            }
         }
      }
      
      public function registerUser(param1:int, param2:String, param3:Boolean = true) : void
      {
         var _loc4_:* = null;
         if(var_442.getValue(param1) != null)
         {
            var_442.remove(param1);
         }
         if(param3)
         {
            _loc4_ = new UserRegistryItem(param1,param2,var_625);
         }
         else
         {
            _loc4_ = new UserRegistryItem(param1,param2);
         }
         if(param3 && var_625 == "")
         {
            var_1128.push(param1);
         }
         var_442.add(param1,_loc4_);
         purgeUserIndex();
      }
      
      public function getRegistry() : Map
      {
         return var_442;
      }
      
      public function unregisterRoom() : void
      {
         var_625 = "";
      }
      
      private function purgeUserIndex() : void
      {
         var _loc1_:int = 0;
         while(var_442.length > const_1040)
         {
            _loc1_ = var_442.getKey(0);
            var_442.remove(_loc1_);
         }
      }
      
      public function registerRoom(param1:String) : void
      {
         var_625 = param1;
         if(var_625 != "")
         {
            addRoomNameForMissing();
         }
      }
   }
}
