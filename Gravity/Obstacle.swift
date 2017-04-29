//
//  Obstacle.swift
//  Golf
//
//  Created by Tim on 09.09.16.
//  Copyright © 2016 yujtah. All rights reserved.
//

import Foundation
import SpriteKit


class Obstacle: SKSpriteNode, GameSprite {
	let textureAtlas = SKTextureAtlas(named: "planet.atlas")
	var isTouching: Bool = false
	
	func spawn(_ parentNode:SKNode, position: CGPoint, size:CGSize = CGSize(width: 32, height: 32)) {
		parentNode.addChild(self)
		
		self.size = size
		self.position = position
		self.color = UIColor.darkGray
//		self.texture = textureAtlas.textureNamed("planet")
	
	}
	
	func onTap() {
		
	}
	
}
