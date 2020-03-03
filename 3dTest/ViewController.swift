//
//  ViewController.swift
//  3dTest
//
//  Created by Егор Красильников on 03/03/2020.
//  Copyright © 2020 Егор Красильников. All rights reserved.
//

import UIKit
import SceneKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let scene = SCNScene()
        
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        
        cameraNode.position = SCNVector3(x: 0, y: 0, z:5)
        scene.rootNode.addChildNode(cameraNode)
        
        let stars = SCNParticleSystem(named: "StarsParticle.scnp", inDirectory: nil)!
        scene.rootNode.addParticleSystem(stars)
        
        let earthNode = EarthNode()
        scene.rootNode.addChildNode(earthNode)
        
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light?.type = .omni
        lightNode.position = SCNVector3(x: 0, y: 10, z: 2)
        scene.rootNode.addChildNode(lightNode)
        
        let sceneView = self.view.viewWithTag(1) as! SCNView
        sceneView.scene = scene //если мы поменяем scene то она поменяется внутри sceneView?
        
        
        
        sceneView.showsStatistics = true
        sceneView.backgroundColor = UIColor.black
        sceneView.allowsCameraControl = true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }


}

