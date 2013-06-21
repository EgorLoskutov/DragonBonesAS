package dragonBones.objects
{
	public class Timeline
	{
		private var _duration:Number;
		public function get duration():Number
		{
			return _duration;
		}
		public function set duration(value:Number):void
		{
			_duration = value > 0?value:0;
		}
		
		private var _scale:Number;
		public function get scale():Number
		{
			return _scale;
		}
		public function set scale(value:Number):void
		{
			if(value == Infinity || isNaN(value))
			{
				value = 1;
			}
			else if(value < 0)
			{
				value = 0;
			}
			_scale = value;
		}
		
		private var _frameList:Vector.<Frame>;
		public function get frameList():Vector.<Frame>
		{
			return _frameList;
		}
		
		public function Timeline()
		{
			_duration = 0;
			_scale = 1;
			
			_frameList = new Vector.<Frame>(0, true);
		}
		
		public function dispose():void
		{
			_frameList.fixed = false;
			_frameList.length = 0;
			//_frameList = null;
		}
		
		public function addFrame(frame:Frame):void
		{
			if(!frame)
			{
				throw new ArgumentError();
			}
			
			if(_frameList.indexOf(frame) < 0)
			{
				_frameList.fixed = false;
				_frameList[_frameList.length] = frame;
				_frameList.fixed = true;
			}
			else
			{
				throw new ArgumentError();
			}
		}
	}
	
}