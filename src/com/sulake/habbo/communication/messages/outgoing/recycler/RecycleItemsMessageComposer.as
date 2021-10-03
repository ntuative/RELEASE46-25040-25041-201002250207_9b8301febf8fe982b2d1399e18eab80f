package com.sulake.habbo.communication.messages.outgoing.recycler
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RecycleItemsMessageComposer implements IMessageComposer
   {
       
      
      private var var_883:Array;
      
      public function RecycleItemsMessageComposer(param1:Array)
      {
         super();
         var_883 = new Array();
         var_883.push(param1.length);
         var_883 = var_883.concat(param1);
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return var_883;
      }
   }
}
