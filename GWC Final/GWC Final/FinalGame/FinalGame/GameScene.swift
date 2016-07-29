//
//  GameScene.swift
//  game4
//
//  Created by Facebook on 7/27/16.
//  Copyright (c) 2016 DaryaVer. All rights reserved.
//



//        let location = touch.locationInNode(self)
//
//                        if manSprite.containsPoint(location) {
//                            self.score += 1
//                            self.myLabel.text = String(self.score)
//                        }
//                    }




import SpriteKit

import UIKit

class GameScene: SKScene {
    
    var TextureAtlas1 = SKTextureAtlas()
    
    var TextureArray = [SKTexture]()
    
    var People = SKNode()
    
    var moveAndRemove = SKAction()
    
    var gameStarted = Bool()
    
    var ScoreLabel = SKLabelNode(fontNamed: "Arial")
    
    var person = SKSpriteNode()
    
    var score:Int = 0
    
    func createPeople() {
        
        People = SKNode()
        
        TextureAtlas1 = SKTextureAtlas(named: "people")
        
        for i in 1...TextureAtlas1.textureNames.count{
            
            let Name = "walkingman_\(i).png"
            TextureArray.append(SKTexture(imageNamed: Name))
        }
        
        person = SKSpriteNode(imageNamed: TextureAtlas1.textureNames[0])
        person.position = CGPointMake(425,333.5)
        person.size = CGSize(width: 100, height: 200)
        
        People.addChild(person)
        
        People.runAction(moveAndRemove)
        
        self.addChild(People)
        
    }
    
    override func didMoveToView(view: SKView) {
        
        //        self.backgroundColor = SKColor.magentaColor()
        
        self.ScoreLabel.text = String(self.score)
        
        self.ScoreLabel.fontSize = 20
        self.ScoreLabel.position = CGPointMake(self.frame.width - 20, self.frame.height - 20)
        self.addChild(ScoreLabel)
    }
    
        
        //
        //        self.addChild(myLabel)
        //        self.addChild(manSprite)
        //        self.addChild(manSprite2)
        //
        //        self.manSprite.position = CGPointMake(425,333.5)
        //        self.manSprite2.position = CGPointMake(425, 333.5)
        //
        //        self.manSprite.size = CGSize(width: 50, height: 100)
        //        self.manSprite2.size = CGSize(width: 50, height: 150)
        //
        //        let moveAction = SKAction.moveToX(-25, duration: 3)
        //        let moveAction2 = SKAction.moveToX(-25, duration: 5)
        //
        //        self.manSprite.runAction(moveAction)
        //        self.manSprite2.runAction(moveAction2)
        
    //
    /* Called when a touch begins */
    //
    //        for touch in touches {
    //            let location = touch.locationInNode(self)
    //
    //            if manSprite.containsPoint(location) {
    //                self.score += 1
    //                self.myLabel.text = String(self.score)
    //            }
    //        }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if gameStarted == false{
            
            gameStarted = true
            

            
            let spawn = SKAction.runBlock({
                () in
                
                self.createPeople()
                self.person.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(self.TextureArray, timePerFrame: 0.2)))
                
            })
            
            let delay = SKAction.waitForDuration(3.0)
            
            let SpawnDelay = SKAction.sequence([spawn, delay])
            
            let SpawnDelayForever = SKAction.repeatActionForever(SpawnDelay)
            
            self.runAction(SpawnDelayForever)
            
            let distance = CGFloat(self.frame.width + People.frame.width + 80)
            
            let movePeople = SKAction.moveByX(-distance, y: 0, duration: NSTimeInterval(0.01 * distance))
            
            let removePeople = SKAction.removeFromParent()
            
            moveAndRemove = SKAction.sequence([movePeople, removePeople])
            
        }
            
        else {
            
            for touch in touches {
                
                let location = touch.locationInNode(self)
                
                if People.containsPoint(location) {
                    self.score += 1
                    self.ScoreLabel.text = String(self.score)
                }
            }
        }
        
    }
    
    
    
    
    //    override func update(currentTime: CFTimeInterval) {
    //        /* Called before each frame is rendered */
    //    }
}






