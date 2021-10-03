package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_933:int = 0;
      
      private var var_1246:int = 0;
      
      private var var_1601:String = "";
      
      private var var_934:int = 0;
      
      private var var_1993:String = "";
      
      private var var_1994:int = 0;
      
      private var var_1378:String = "";
      
      private var var_1991:int = 0;
      
      private var var_1992:int = 0;
      
      private var var_1603:String = "";
      
      private var var_1995:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         var_1991 = param1;
         var_1603 = param2;
         var_1378 = param3;
         var_1601 = param4;
         var_1993 = param5;
         if(param6)
         {
            var_1246 = 1;
         }
         else
         {
            var_1246 = 0;
         }
         var_1994 = param7;
         var_1992 = param8;
         var_934 = param9;
         var_1995 = param10;
         var_933 = param11;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1991,var_1603,var_1378,var_1601,var_1993,var_1246,var_1994,var_1992,var_934,var_1995,var_933];
      }
      
      public function dispose() : void
      {
      }
   }
}
