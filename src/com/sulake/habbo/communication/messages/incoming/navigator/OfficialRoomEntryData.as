package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1359:int = 4;
      
      public static const const_692:int = 3;
      
      public static const const_687:int = 2;
      
      public static const const_884:int = 1;
       
      
      private var var_1717:String;
      
      private var _disposed:Boolean;
      
      private var var_1696:int;
      
      private var var_1716:Boolean;
      
      private var var_787:String;
      
      private var var_784:PublicRoomData;
      
      private var var_1715:int;
      
      private var _index:int;
      
      private var var_1714:String;
      
      private var _type:int;
      
      private var var_1630:String;
      
      private var var_783:GuestRoomData;
      
      private var var_1718:String;
      
      private var _open:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         _index = param1.readInteger();
         var_1717 = param1.readString();
         var_1718 = param1.readString();
         var_1716 = param1.readInteger() == 1;
         var_1714 = param1.readString();
         var_787 = param1.readString();
         var_1715 = param1.readInteger();
         var_1696 = param1.readInteger();
         _type = param1.readInteger();
         if(_type == const_884)
         {
            var_1630 = param1.readString();
         }
         else if(_type == const_692)
         {
            var_784 = new PublicRoomData(param1);
         }
         else if(_type == const_687)
         {
            var_783 = new GuestRoomData(param1);
         }
      }
      
      public function get folderId() : int
      {
         return var_1715;
      }
      
      public function get popupCaption() : String
      {
         return var_1717;
      }
      
      public function get userCount() : int
      {
         return var_1696;
      }
      
      public function get open() : Boolean
      {
         return _open;
      }
      
      public function get showDetails() : Boolean
      {
         return var_1716;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_884)
         {
            return 0;
         }
         if(this.type == const_687)
         {
            return this.var_783.maxUserCount;
         }
         if(this.type == const_692)
         {
            return this.var_784.maxUsers;
         }
         return 0;
      }
      
      public function get popupDesc() : String
      {
         return var_1718;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(this.var_783 != null)
         {
            this.var_783.dispose();
            this.var_783 = null;
         }
         if(this.var_784 != null)
         {
            this.var_784.dispose();
            this.var_784 = null;
         }
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return var_783;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get picText() : String
      {
         return var_1714;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return var_784;
      }
      
      public function get picRef() : String
      {
         return var_787;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get tag() : String
      {
         return var_1630;
      }
      
      public function toggleOpen() : void
      {
         _open = !_open;
      }
   }
}
