//
//  GameScene.swift
//  Gravity
//
//  Created by Tim on 08.09.16.
//  Copyright (c) 2016 yujtah. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
	
	let playerPlanet = Planet()

	var traceArray = [SKSpriteNode]()
    var directionDots = [SKSpriteNode]()
	let sun = Star()
		
    override func didMove(to view: SKView) {
		self.backgroundColor = UIColor(red: 5/255, green: 56/255, blue:71/255, alpha: 1.0)
		
		physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
		physicsBody?.mass = 0
		physicsWorld.gravity = CGVector(dx: 0,dy: 0)
//		physicsWorld.contactDelegate =
		physicsBody?.affectedByGravity = false
		
		let planetHeight =  min(frame.width, frame.height) / 20
		let planetSize = CGSize(width: planetHeight, height: planetHeight)
		let planetPosition = CGPoint(x: frame.width / 2, y: planetHeight*3)
		
		playerPlanet.spawn(self, position: planetPosition, size: planetSize)

		let sunWidth =  min(frame.width, frame.height) / 20
		let sunSize = CGSize(width: sunWidth, height: sunWidth*10)
		let sunPosition = CGPoint(x:frame.width / 2, y:frame.height - sunWidth*12)
		sun.spawn(self, position: sunPosition)
    }
	
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       /* Called when a touch begins */
		sun.gravityField.isEnabled = false
        for touch in touches {
			playerPlanet.isTouching = true
        }
    }
	
	override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
		sun.gravityField.isEnabled = true
		let location = touches.first?.location(in: self)
		if let location = location {
			let impulsX = playerPlanet.position.x - location.x
			let impulsY = playerPlanet.position.y - location.y
			playerPlanet.physicsBody?.applyForce(CGVector(dx: impulsX * 6, dy: impulsY * 6))
		}
		playerPlanet.isTouching = false
    }
    
    func drawDirection(impulsX: CGPoint, impulsY: CGPoint) {
        
        let dirSprite = SKSpriteNode()
        dirSprite.color = UIColor.darkGray
        self.directionDots.append(dirSprite)
        self.addChild(dirSprite)
    }
	
	override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
		playerPlanet.isTouching = false
		sun.gravityField.isEnabled = true
	}
   
    override func update(_ currentTime: TimeInterval) {
		
		let dot = SKSpriteNode()
		dot.position = playerPlanet.position
		dot.size = CGSize(width: 1, height: 1)
		dot.color = UIColor.lightGray
		traceArray.append(dot)
		self.addChild(dot)
		if traceArray.count > 200 {
			traceArray.first?.removeFromParent()
			traceArray.removeFirst()
		}
    }
	
}


enum PhysicsCategory: UInt32 {
	case world = 1
	case star = 2
	case planet = 4
}
