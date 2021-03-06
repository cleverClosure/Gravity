//
//  GameViewController.swift
//  Gravity
//
//  Created by Tim on 08.09.16.
//  Copyright (c) 2016 yujtah. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

		let scene = GameScene()
		// Configure the view:
		let skView = self.view as! SKView
		skView.showsFPS = true
		skView.showsNodeCount = true
		skView.ignoresSiblingOrder = true
		scene.scaleMode = .aspectFill
		skView.showsPhysics = true
		// size our scene to fit the view exactly:
		scene.size = view.bounds.size
		// Show the new scene:
		skView.presentScene(scene)
		
		
//        if let scene = GameScene(fileNamed:"GameScene") {
//            // Configure the view.
//            let skView = self.view as! SKView
//            skView.showsFPS = true
//            skView.showsNodeCount = true
//            
//            /* Sprite Kit applies additional optimizations to improve rendering performance */
//            skView.ignoresSiblingOrder = true
//			
//            /* Set the scale mode to scale to fit the window */
//            scene.scaleMode = .aspectFill
//            
//            skView.presentScene(scene)
//        }
    }

    override var shouldAutorotate : Bool {
        return false
    }

    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden : Bool {
        return true
    }
}
