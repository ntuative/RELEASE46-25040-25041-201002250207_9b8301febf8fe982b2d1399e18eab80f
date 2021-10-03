package com.sulake.habbo.sound.object
{
   import com.sulake.habbo.sound.IHabboSound;
   import flash.events.Event;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   
   public class HabboSound implements IHabboSound
   {
       
      
      private var var_1060:SoundChannel = null;
      
      private var var_875:Boolean;
      
      private var var_1059:Sound = null;
      
      private var var_682:Number;
      
      public function HabboSound(param1:Sound)
      {
         super();
         var_1059 = param1;
         var_1059.addEventListener(Event.COMPLETE,onComplete);
         var_682 = 1;
         var_875 = false;
      }
      
      public function get finished() : Boolean
      {
         return !var_875;
      }
      
      public function stop() : Boolean
      {
         var_1060.stop();
         return true;
      }
      
      public function play() : Boolean
      {
         var_875 = false;
         var_1060 = var_1059.play(0);
         this.volume = var_682;
         return true;
      }
      
      public function set position(param1:Number) : void
      {
      }
      
      public function get volume() : Number
      {
         return var_682;
      }
      
      public function get ready() : Boolean
      {
         return true;
      }
      
      public function get position() : Number
      {
         return var_1060.position;
      }
      
      public function get length() : Number
      {
         return var_1059.length;
      }
      
      public function set volume(param1:Number) : void
      {
         var_682 = param1;
         if(var_1060 != null)
         {
            var_1060.soundTransform = new SoundTransform(var_682);
         }
      }
      
      private function onComplete(param1:Event) : void
      {
         var_875 = true;
      }
   }
}
