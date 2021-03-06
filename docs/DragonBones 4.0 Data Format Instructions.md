﻿# DragonBones 4.0 格式说明
<code>
{
	"name": "dataName" 						// DB数据名称
	"version": "4.0" 						// DB版本号
	"frameRate": 24 						// DB动画帧频
	"isGlobal": 0 							//【可选属性】是否使用绝对数据，默认1（使用绝对数据）
	"armature": [{
		"name": "armatureName" 				// 骨架名称，一个数据文件可以有多个骨架
		"userData": 						//【可选属性】自定义数据区，可以是任何类型，默认是空
		"bone": [{ 							// 骨架中拥有的所有骨骼列表
			"name": "boneName" 				// 骨骼名称
			"parent": "parentBoneName" 		// 父骨骼名称
			"userData":						//【可选属性】自定义数据区，可以是任何类型，默认是空
			"length": 0 					//【可选属性】骨骼长度，默认0
			"transform": {x, y, scX, scY, skX, skY} 	// 骨骼的属性参数（属性可选）
														// x：X轴坐标偏移, y: Y轴坐标偏移，默认0
														// scX:X轴缩放值，scY:Y轴缩放值，默认1
														// skX:X轴旋转值，skY:Y轴旋转值, 默认0
		}]
		"slot": [{ 							// 骨架中拥有的插槽列表
			"name": "slotName" 				// 插槽名称
			"parent": "parentBoneName" 		// 插槽绑定的骨骼
			"z": 1							// 插槽的显示层级，数值越大，层级越靠上。
			"userData":						//【可选属性】自定义数据区，可以是任何类型，默认是空
			"displayIndex": 0	 			//【可选属性】插槽中的默认图片在插槽包含的图片列表中的索引。默认是0。
			"color":	 {aM, rM, gM, bM, aO, rO, gO, bO}	//【可选属性】颜色叠加。所有属性均为可选属性，默认值如下：aO,rO,gO,bO默认值为0; aM,rM,gM,bM 默认值为100。
															// 如果所有子属性都为默认,则color属性可以不写。
			"blendMode"=""					//【可选属性】混合模式。默认值是空。
		}]
		"skin": [{ 							// 骨架中拥有的皮肤列表
			"name": "skinName" 				// 皮肤名称，默认皮肤name为"",包含所有其他皮肤公用的插槽
			"slot": [{ 						// 皮肤中包含的插槽列表
				"name": "slotName" 			// 插槽名称
				"display": [{ 				// 插槽中拥有的显示对象列表
					"name": "displayName" 	// 显示对象对应的显示对象名称，包含二级目录相对路径
					"type": "image" 		// 显示对象类型，可为图片（image），子骨架（armature），可以根据不同引擎自由扩充。
					"transform": {x, y, scX, scY, skX, skY} 	// 显示对象的属性参数（属性可选），
																// x：X轴坐标偏移, y: Y轴坐标偏移，默认0
																// scX:X轴缩放值，scY:Y轴缩放值，默认1
																// skX:X轴旋转值，skY:Y轴旋转值, 默认0
				}]
			}]
		}]
		"animation": [{ 					// 骨架中拥有的动画列表
			"name": "animationName" 		// 动画名称
			"duration":0 					// 动画总帧数
			"fadeInTime": 0 				//【可选属性】淡入时间，默认为0
			"scale": 1 						//【可选属性】动画时间轴的缩放，默认为1，数值越大，播放时间越长，目前DB Pro暂未实现
			"playTimes": 1 					//【可选属性】播放次数，默认为1，0是无限循环
			"frame": [{ 					// 动画中包含的关键帧列表
				"duration": 1 				//【可选属性】关键帧持续帧数，默认1
				"event": 					//【可选属性】关键帧包含事件名，默认为空
				"sound": 					//【可选属性】关键帧包含声音名,默认为空
				"action": 					//【可选属性】跳转动作名，默认为空
			}]
			"bone": [{ 						// 动画中包含的骨骼列表（骨骼时间轴列表）
				"name": "boneName" 			// 骨骼名称
				"scale": 1 					//【可选属性】骨骼时间轴缩放值，默认是1（不缩放）
				"offset": 0 				//【可选属性】骨骼时间轴延时[0, 1]，默认值为0 
											// 比如一个循环跑步动作有 4 秒，其中对腿的动作设置此值为 0.25，那么腿的循环比其他骨骼动作提前1秒。
				"pX": 0 					//【可选属性】默认值为0 代表动画的中该骨骼轴点的初始值。
											// 这个属性只有用相对Parent的数据才有意义，如果用相对Global的数据，这个值会在数据解析时被覆盖。
				"pY": 0 					//【可选属性】默认值为0 代表动画的中该骨骼轴点的初始值。
											// 这个属性只有用相对Parent的数据才有意义，如果用相对Global的数据，这个值会在数据解析时被覆盖。
				"frame": [{ 				// 骨骼时间轴包含的关键帧列表
					"duration": 1 			//【可选属性】关键帧持续帧数，默认1
					"tweenEasing":0 		//【可选属性】是否缓动，默认为NaN,不缓动，0：线性缓动。
					"tweenRotate":0 		//【可选属性】顺时针或逆时针旋转几周，从补间动画中读取，必须为整数，默认值为0。
					"event": 				//【可选属性】关键帧包含事件名，默认为空
					"sound": 				//【可选属性】关键帧包含声音名,默认为空
					"transform": {x, y, scX, scY, skX, skY} 	// 此帧骨骼的属性参数（属性可选）
																// x：X轴坐标偏移, y: Y轴坐标偏移，默认0
																// scX:X轴缩放值，scY:Y轴缩放值，默认1
																// skX:X轴旋转值，skY:Y轴旋转值, 默认0
					“curve”:[x1,y1,x2,y2]	//【可选属性】曲线数据，默认为空。如果不为空，代表使用贝塞尔曲线表示动画补间的缓动效果
				}]
			}]
			"slot": [{ 						// 动画中拥有的插槽列表（插槽时间轴列表）
				"name": "slotName" 			// 插槽的名称
				"scale": 1 					//【可选属性】插槽的缩放值，默认是1
				"offset": 0 				//【可选属性】动作的延时[0, 1]，默认值为0 
											// 比如一个循环跑步动作有 4 秒，其中对腿的动作设置此值为 0.25，那么腿的循环比其他骨骼动作提前1秒。
				"frame": [{ 				// 插槽中的关键帧列表
					"duration": 1 			//【可选属性】关键帧持续帧数，默认1
					"displayIndex":0 		//【可选属性】此帧中显示图片的索引，默认是0， -1不显示， 对应是skin里的slot中的图片列表索引
					"zOrder": 0 			//【可选属性】插槽所在的层级，默认是0
					"tweenEasing":0 		//【可选属性】是否缓动，默认为NaN,不缓动，0：线性缓动。
					"action": 				//【可选属性】此帧执行的动作,默认是空
					"color": {aM, rM, gM, bM, aO, rO, gO, bO} 	//颜色叠加。所有属性均为可选属性，默认值如下：aO,rO,gO,bO默认值为0; aM,rM,gM,bM 默认值为100
					“curve”:[x1,y1,x2,y2]		//【可选属性】曲线数据，默认为空。如果不为空，代表使用贝塞尔曲线表示动画补间的缓动效果
				}]
			}]
		}]
	}]
}
</code>
# 和3.0相比的格式变化
* Armature 中包含Slot列表.
* Skin 中增加默认Skin, 默认skin有如下特性：
	1. 在skin列表中排第一
	2. 名字为空字符串“”
	3. 包含的slot会同时存在于其他的skin，相当于保存所有其他skin中共有的slot（相当于其他skin的基类）
* Skin中包含的Slot的Display的transform属性中不在有pX,pY属性
	1. Display不再有初始轴点属性，所有display的轴点均为中心点。
	2. 因为display在运动时的轴点是骨骼的原点，所以这里的轴点信息可以在初始化时换算成display的位置信息，从而可以完美还原动画。
* Animation中有下面的改动
	1. 去掉"tweenEasing":	动画不会覆盖关键帧的缓动值
	2. 去掉"autoTween":  	动画不会覆盖关键帧的补件值
	3. "loop"改名为"playtime"
	4. "colorTransform"改名为"color"
* 区分Bone时间轴和Slot时间轴
	1. Bone时间轴包含平移旋转缩放，自定义事件和声音事件
	2. Slot时间轴包含颜色变换，dispalyIndex变换和zorder变换
* Armature, Bone 和Slot中均添加了userData字段用于记录用户自定义信息，同时方便第三方扩展
* Frame中有如下改动
	1. 中去掉了hide 属性，动画中如果想隐藏某个插槽，改为设置dispalyIndex为-1. visible属性完全留给开发者使用，用于动态设置slot是否隐藏。
	2. 增加curve属性，使用贝塞尔曲线描述动画补间的缓动效果

