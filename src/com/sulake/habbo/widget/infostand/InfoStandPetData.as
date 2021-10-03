package com.sulake.habbo.widget.infostand
{
   import com.sulake.habbo.widget.events.RoomWidgetPetInfoUpdateEvent;
   import flash.display.BitmapData;
   
   public class InfoStandPetData
   {
       
      
      private var var_2035:int;
      
      private var var_2059:int;
      
      private var var_2054:int;
      
      private var _type:int;
      
      private var var_1166:int = -1;
      
      private var var_2058:int;
      
      private var _nutrition:int;
      
      private var var_2053:int;
      
      private var _energy:int;
      
      private var var_1896:int;
      
      private var var_2056:int;
      
      private var var_2137:int;
      
      private var var_2057:int;
      
      private var _petRespect:int;
      
      private var _canOwnerBeKicked:Boolean;
      
      private var _image:BitmapData;
      
      private var _ownerName:String;
      
      private var var_2136:Boolean;
      
      private var _name:String = "";
      
      private var var_2055:int;
      
      public function InfoStandPetData()
      {
         super();
      }
      
      public function get isOwnPet() : Boolean
      {
         return var_2136;
      }
      
      public function get level() : int
      {
         return var_2035;
      }
      
      public function get energy() : int
      {
         return _energy;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get experienceMax() : int
      {
         return var_2053;
      }
      
      public function get id() : int
      {
         return var_1166;
      }
      
      public function get nutritionMax() : int
      {
         return var_2054;
      }
      
      public function get ownerId() : int
      {
         return var_2055;
      }
      
      public function setData(param1:RoomWidgetPetInfoUpdateEvent) : void
      {
         _name = param1.name;
         var_1166 = param1.id;
         _type = param1.petType;
         var_1896 = param1.petRace;
         _image = param1.image;
         var_2136 = param1.isOwnPet;
         var_2055 = param1.ownerId;
         _ownerName = param1.ownerName;
         _canOwnerBeKicked = param1.canOwnerBeKicked;
         var_2035 = param1.level;
         var_2058 = param1.levelMax;
         var_2059 = param1.experience;
         var_2053 = param1.experienceMax;
         _energy = param1.energy;
         var_2056 = param1.energyMax;
         _nutrition = param1.nutrition;
         var_2054 = param1.nutritionMax;
         _petRespect = param1.petRespect;
         var_2137 = param1.roomIndex;
         var_2057 = param1.age;
      }
      
      public function get roomIndex() : int
      {
         return var_2137;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get energyMax() : int
      {
         return var_2056;
      }
      
      public function get levelMax() : int
      {
         return var_2058;
      }
      
      public function get petRespect() : int
      {
         return _petRespect;
      }
      
      public function get race() : int
      {
         return var_1896;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get canOwnerBeKicked() : Boolean
      {
         return _canOwnerBeKicked;
      }
      
      public function get experience() : int
      {
         return var_2059;
      }
      
      public function get age() : int
      {
         return var_2057;
      }
   }
}
