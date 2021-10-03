package com.sulake.core.window.utils
{
   import com.sulake.core.utils.Map;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getQualifiedClassName;
   
   public class PropertyStruct
   {
      
      public static const const_542:String = "Rectangle";
      
      public static const const_57:String = "Boolean";
      
      public static const const_734:String = "Number";
      
      public static const const_59:String = "int";
      
      public static const STRING:String = "String";
      
      public static const const_606:String = "Point";
      
      public static const const_830:String = "Array";
      
      public static const const_786:String = "uint";
      
      public static const const_458:String = "hex";
      
      public static const const_988:String = "Map";
       
      
      private var var_579:String;
      
      private var var_174:Object;
      
      private var var_2307:Boolean;
      
      private var _type:String;
      
      private var var_2078:Boolean;
      
      public function PropertyStruct(param1:String, param2:Object, param3:String, param4:Boolean)
      {
         super();
         var_579 = param1;
         var_174 = param2;
         _type = param3;
         var_2078 = param4;
         var_2307 = param3 == const_988 || param3 == const_830 || param3 == const_606 || param3 == const_542;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function toString() : String
      {
         switch(_type)
         {
            case const_458:
               return "0x" + uint(var_174).toString(16);
            case const_57:
               return Boolean(var_174) == true ? "true" : "false";
            case const_606:
               return "Point(" + Point(var_174).x + ", " + Point(var_174).y + ")";
            case const_542:
               return "Rectangle(" + Rectangle(var_174).x + ", " + Rectangle(var_174).y + ", " + Rectangle(var_174).width + ", " + Rectangle(var_174).height + ")";
            default:
               return String(value);
         }
      }
      
      public function toXMLString() : String
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         switch(_type)
         {
            case const_988:
               _loc3_ = var_174 as Map;
               _loc1_ = "<var key=\"" + var_579 + "\">\r<value>\r<" + _type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc3_.length)
               {
                  _loc1_ += "<var key=\"" + _loc3_.getKey(_loc2_) + "\" value=\"" + _loc3_.getWithIndex(_loc2_) + "\" type=\"" + getQualifiedClassName(_loc3_.getWithIndex(_loc2_)) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_830:
               _loc4_ = var_174 as Array;
               _loc1_ = "<var key=\"" + var_579 + "\">\r<value>\r<" + _type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc4_.length)
               {
                  _loc1_ += "<var key=\"" + String(_loc2_) + "\" value=\"" + _loc4_[_loc2_] + "\" type=\"" + getQualifiedClassName(_loc4_[_loc2_]) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_606:
               _loc5_ = var_174 as Point;
               _loc1_ = "<var key=\"" + var_579 + "\">\r<value>\r<" + _type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc5_.x + "\" type=\"" + const_59 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc5_.y + "\" type=\"" + const_59 + "\" />\r";
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_542:
               _loc6_ = var_174 as Rectangle;
               _loc1_ = "<var key=\"" + var_579 + "\">\r<value>\r<" + _type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc6_.x + "\" type=\"" + const_59 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc6_.y + "\" type=\"" + const_59 + "\" />\r";
               _loc1_ += "<var key=\"width\" value=\"" + _loc6_.width + "\" type=\"" + const_59 + "\" />\r";
               _loc1_ += "<var key=\"height\" value=\"" + _loc6_.height + "\" type=\"" + const_59 + "\" />\r";
               _loc1_ += "</" + _type + ">\r</value>\r</var>";
               break;
            case const_458:
               _loc1_ = "<var key=\"" + var_579 + "\" value=\"" + "0x" + uint(var_174).toString(16) + "\" type=\"" + _type + "\" />";
               break;
            default:
               _loc1_ = "<var key=\"" + var_579 + "\" value=\"" + var_174 + "\" type=\"" + _type + "\" />";
         }
         return _loc1_;
      }
      
      public function get value() : Object
      {
         return var_174;
      }
      
      public function get valid() : Boolean
      {
         return var_2078;
      }
      
      public function get key() : String
      {
         return var_579;
      }
   }
}
