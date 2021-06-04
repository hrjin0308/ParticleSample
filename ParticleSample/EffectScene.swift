//
//  EffectScene.swift
//  ParticleSample
//
//  Created by JinHyeRim on 2021/06/04.
//

import SpriteKit

class EffectScene: SKScene {
    var emitter = SKEmitterNode(fileNamed: "Spark")
    
    override init(size: CGSize) {
        super.init(size: size)
        prepareScene()
        prepareNode()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
    }

    override func didApplyConstraints() {
        guard let view = view else { return }
        scene?.size = view.frame.size
    }

    private func prepareScene() {
        backgroundColor = .clear
        scene?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        scene?.scaleMode = .aspectFill
    }

    private func prepareNode() {
        guard
            let scene = scene,
            let emitter = emitter
        else {
            return
        }
        emitter.position = .zero
        scene.addChild(emitter)
    }
}

