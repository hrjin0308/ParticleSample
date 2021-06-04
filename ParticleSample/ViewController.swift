//
//  ViewController.swift
//  ParticleSample
//
//  Created by JinHyeRim on 2021/06/04.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {
    
    //
    // MARK: - UI Component
    var effectView = SKView()
    var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
        startTimer()
    }
    
    private func prepareUI() {
        // effectView
        effectView.backgroundColor = .clear
        effectView.showsFPS = true
        effectView.showsNodeCount = true
        effectView.frame = self.view.bounds
        self.view.addSubview(effectView)
    }

    @objc private func showEffect() {
        // scene
        let scene = EffectScene(size: effectView.frame.size)
        
        scene.emitter?.numParticlesToEmit = Int(arc4random_uniform(50) + 1)
        effectView.presentScene(scene)
    }
    
    //
    // MARK: - Timer
    private func startTimer() {
        if let _ = timer {
            stopTimer()
        }
        
        timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(showEffect), userInfo: nil, repeats: true)
        timer?.fire()
    }
    
    private func stopTimer() {
        if let timer = timer {
            timer.invalidate()
        }
    }
    
}

