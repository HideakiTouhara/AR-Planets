//
//  ViewController.swift
//  Planets
//
//  Created by HideakiTouhara on 2017/11/04.
//  Copyright © 2017年 HideakiTouhara. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    
    let configuration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin, ARSCNDebugOptions.showFeaturePoints]
        self.sceneView.session.run(configuration)
        self.sceneView.autoenablesDefaultLighting = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let sun = SCNNode(geometry: SCNSphere(radius: 0.35))
        sun.geometry?.firstMaterial?.diffuse.contents = #imageLiteral(resourceName: "Sun diffuse")
        sun.position = SCNVector3(0,0,-1)
        self.sceneView.scene.rootNode.addChildNode(sun)
        let earth = SCNNode()
        earth.geometry = SCNSphere(radius: 0.2)
        earth.geometry?.firstMaterial?.diffuse.contents = #imageLiteral(resourceName: "Earth day")
        earth.geometry?.firstMaterial?.specular.contents = #imageLiteral(resourceName: "Earth Specular")
        earth.geometry?.firstMaterial?.emission.contents = #imageLiteral(resourceName: "Earth Emission")
        earth.geometry?.firstMaterial?.normal.contents = #imageLiteral(resourceName: "Earth Normal")
        earth.position = SCNVector3(1.2,0,0)
        sun.addChildNode(earth)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension Int {
    var degreesToRadians: Double {
        return Double(self) / 180 * Double.pi
    }
}

