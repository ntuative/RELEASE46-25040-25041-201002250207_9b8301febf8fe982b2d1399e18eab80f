package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_883:String = "inventory_badges";
      
      public static const const_1242:String = "inventory_clothes";
      
      public static const const_1298:String = "inventory_furniture";
      
      public static const const_631:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_858:String = "inventory_effects";
       
      
      private var var_1739:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_631);
         var_1739 = param1;
      }
      
      public function get inventoryType() : String
      {
         return var_1739;
      }
   }
}
