//
//  Ball.swift
//  Golf
//
//  Created by Tim on 08.09.16.
//  Copyright © 2016 yujtah. All rights reserved.
//

import Foundation
import SpriteKit

class Planet: SKSpriteNode, GameSprite {
	
	let textureAtlas = SKTextureAtlas(named: "planet.atlas")
	var isTouching: Bool = false
	
	func spawn(_ parentNode:SKNode, position: CGPoint, size:CGSize = CGSize(width: 32, height: 32)) {
		parentNode.addChild(self)
		
		self.size = size
		self.position = position
//		self.color = UIColor.redColor()
		self.texture = textureAtlas.textureNamed("planet")
		
//		self.physicsBody = SKPhysicsBody(texture: bodyTexture, size: size)
		physicsBody = SKPhysicsBody(circleOfRadius: size.height / 2)
		physicsBody?.affectedByGravity = true
		physicsBody?.allowsRotation = false
		physicsBody?.friction = 0
		physicsBody?.angularDamping = 0
		physicsBody?.linearDamping = 0

	}
	
	func onTap() {
		
	}
}
