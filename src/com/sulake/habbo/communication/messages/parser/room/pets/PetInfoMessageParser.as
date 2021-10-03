package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_2057:int;
      
      private var var_566:String;
      
      private var var_2035:int;
      
      private var var_2024:int;
      
      private var var_2059:int;
      
      private var var_2171:int;
      
      private var _nutrition:int;
      
      private var var_1166:int;
      
      private var var_2172:int;
      
      private var var_2170:int;
      
      private var _energy:int;
      
      private var _name:String;
      
      private var _ownerName:String;
      
      private var var_2055:int;
      
      private var var_2173:int;
      
      public function PetInfoMessageParser()
      {
         super();
      }
      
      public function get level() : int
      {
         return var_2035;
      }
      
      public function get energy() : int
      {
         return _energy;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get maxEnergy() : int
      {
         return var_2171;
      }
      
      public function flush() : Boolean
      {
         var_1166 = -1;
         return true;
      }
      
      public function get maxLevel() : int
      {
         return var_2172;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return var_2170;
      }
      
      public function get maxNutrition() : int
      {
         return var_2173;
      }
      
      public function get figure() : String
      {
         return var_566;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get respect() : int
      {
         return var_2024;
      }
      
      public function get petId() : int
      {
         return var_1166;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_1166 = param1.readInteger();
         _name = param1.readString();
         var_2035 = param1.readInteger();
         var_2172 = param1.readInteger();
         var_2059 = param1.readInteger();
         var_2170 = param1.readInteger();
         _energy = param1.readInteger();
         var_2171 = param1.readInteger();
         _nutrition = param1.readInteger();
         var_2173 = param1.readInteger();
         var_566 = param1.readString();
         var_2024 = param1.readInteger();
         var_2055 = param1.readInteger();
         var_2057 = param1.readInteger();
         _ownerName = param1.readString();
         return true;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function get experience() : int
      {
         return var_2059;
      }
      
      public function get ownerId() : int
      {
         return var_2055;
      }
      
      public function get age() : int
      {
         return var_2057;
      }
   }
}
