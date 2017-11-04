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
        let earth = planet(geometry: SCNSphere(radius: 0.3), diffuse: #imageLiteral(resourceName: "Earth day"), specular: #imageLiteral(resourceName: "Earth Specular"), emission: #imageLiteral(resourceName: "Earth Emission"), normal: #imageLiteral(resourceName: "Earth Normal"), position: SCNVector3(1.2,0,0))
        let venus = planet(geometry: SCNSphere(radius: 0.1), diffuse: #imageLiteral(resourceName: "Venus diffuse"), specular: nil, emission: venus #imageLiteral(resourceName: "Venus emission"), normal: nil, position: SCNVector3(0.7,0,0))
        let action = SCNAction.rotateBy(x: 0, y: 360, z: 0, duration: 8)
        let forever = SCNAction.repeatForever(action)
        sun.runAction(forever)
        sun.addChildNode(earth)
        sun.addChildNode(venus)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func planet(geometry: SCNGeometry, diffuse: UIImage, specular: UIImage?, emission: UIImage?, normal: UIImage?, position: SCNVector3) -> SCNNode {
        let planet = SCNNode(geometry: geometry)
        planet.geometry?.firstMaterial?.diffuse.contents = diffuse
        planet.geometry?.firstMaterial?.specular.contents = specular
        planet.geometry?.firstMaterial?.emission.contents = emission
        planet.geometry?.firstMaterial?.normal.contents = normal
        planet.position = position
        return planet
    }


}

extension Int {
    var degreesToRadians: Double {
        return Double(self) / 180 * Double.pi
    }
}

