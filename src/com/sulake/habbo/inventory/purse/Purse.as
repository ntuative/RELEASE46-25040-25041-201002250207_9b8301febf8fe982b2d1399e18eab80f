package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_2213:Boolean = false;
      
      private var var_2211:int = 0;
      
      private var var_2207:int = 0;
      
      private var var_2212:int = 0;
      
      private var var_1521:int = 0;
      
      private var var_2208:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function set creditBalance(param1:int) : void
      {
         var_1521 = Math.max(0,param1);
      }
      
      public function get clubPastPeriods() : int
      {
         return var_2211;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return var_2213;
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         var_2213 = param1;
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         var_2211 = Math.max(0,param1);
      }
      
      public function set clubDays(param1:int) : void
      {
         var_2207 = Math.max(0,param1);
      }
      
      public function get creditBalance() : int
      {
         return var_1521;
      }
      
      public function set pixelBalance(param1:int) : void
      {
         var_2212 = Math.max(0,param1);
      }
      
      public function get clubDays() : int
      {
         return var_2207;
      }
      
      public function get pixelBalance() : int
      {
         return var_2212;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_2208 = Math.max(0,param1);
      }
      
      public function get clubPeriods() : int
      {
         return var_2208;
      }
   }
}
