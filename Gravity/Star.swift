//
//  Star.swift
//  Golf
//
//  Created by Tim on 08.09.16.
//  Copyright © 2016 yujtah. All rights reserved.
//

import Foundation
import SpriteKit

class Star: SKSpriteNode, GameSprite {
	
	var textureAtlas:SKTextureAtlas = SKTextureAtlas(named:"star.atlas")
	var isTouching: Bool = false
	let gravityField = SKFieldNode.radialGravityField()
	
	func spawn(_ parentNode:SKNode, position: CGPoint, size:CGSize = CGSize(width: 32, height: 32)) {
		
		parentNode.addChild(self)
		
		self.size = size
		self.position = position
		// self.color = UIColor.darkGrayColor()
		self.texture = textureAtlas.textureNamed("star")
		
		//		self.physicsBody = SKPhysicsBody(texture: bodyTexture, size: size)
		physicsBody = SKPhysicsBody(circleOfRadius: size.height / 2)
		physicsBody?.affectedByGravity = false
		physicsBody?.allowsRotation = false
		physicsBody?.friction = 0
		physicsBody?.angularDamping = 0
		physicsBody?.linearDamping = 0
		
		gravityField.isEnabled = false
//		gravityField.position = position
		gravityField.strength = pow(2, 2)
		
		addChild(gravityField)
		
		physicsBody?.mass = pow(10, 24)
		physicsBody?.isDynamic = false
	}
	
	func onTap() {
		
	}
}
