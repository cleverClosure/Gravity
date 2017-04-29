//
//  GameSprite.swift
//  PenguinGame
//
//  Created by Tim on 04.09.16.
//  Copyright © 2016 yujtah. All rights reserved.
//

import Foundation
import SpriteKit

protocol GameSprite {
//	var textureAtlas: SKTextureAtlas {get set}
	func spawn(_ parentNode: SKNode, position: CGPoint, size: CGSize)
	func onTap()
}
