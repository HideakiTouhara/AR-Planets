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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let earth = SCNNode()
        earth.geometry = SCNSphere(radius: 0.2)
//        earth.geometry?.firstMaterial?.diffuse.contents = 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

