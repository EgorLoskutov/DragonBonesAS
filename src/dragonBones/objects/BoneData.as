package dragonBones.objects
{
	final public class BoneData
	{
		public var name:String;
		public var parent:String;
		public var length:Number;
		
		public var global:DBTransform;
		public var transform:DBTransform;
		
		public function BoneData()
		{
			length = 0;
			transform = new DBTransform();
		}
	}
}