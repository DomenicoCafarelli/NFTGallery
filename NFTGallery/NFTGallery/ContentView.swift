//
//  ContentView.swift
//  NFTGallery
//
//  Created by Domenico Cafarelli on 31/03/22.
//

import SwiftUI
import RealityKit
import ARKit

struct ContentView : View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var selectedModel: String?
    @Binding var ModelConfirmedForPlacement: String?
    @Binding var isPlaced: Bool
    var models: [String] = {
        
        let filemanager = FileManager.default
        
        guard let path = Bundle.main.resourcePath, let files = try? filemanager.contentsOfDirectory(atPath: path) else {
            return []
        }
        
        var availableModels: [String] = []
        for filename in files where filename.hasSuffix("usdz") {
            let modelName = filename.replacingOccurrences(of: ".usdz", with: "")
            availableModels.append(modelName)
        }
        
        return availableModels
    }()
    
    var body: some View {
        ZStack(alignment: .bottom){
           
            ARViewContainer(ModelConfirmedForPlacement: self.$ModelConfirmedForPlacement)
            
            ControlView(selectedModel: self.$selectedModel, ModelConfirmedForPlacement: self.$ModelConfirmedForPlacement, isPlaced: self.$isPlaced)
            
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    @Binding var ModelConfirmedForPlacement: String?
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal, .vertical]
        config.environmentTexturing = .automatic
        
        arView.session.run(config)
        
        if ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh) {
            config.sceneReconstruction = .mesh
        }
        
        let coaching = ARCoachingOverlayView()
        
        coaching.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        coaching.session = arView.session
        coaching.goal = .verticalPlane
        
        arView.addSubview(coaching)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        if let modelName = self.ModelConfirmedForPlacement {
            
            print("DEBUG - adding model to scene - \(modelName)")
            
            let filename = modelName + ".usdz"
            let modelEntity = try! ModelEntity.loadModel(named: filename)
            modelEntity.generateCollisionShapes(recursive: true)
            uiView.installGestures([.translation, .scale, .rotation], for: modelEntity)
            
            let anchorEntity = AnchorEntity(plane: .vertical)
            anchorEntity.addChild(modelEntity)
            
            uiView.scene.addAnchor(anchorEntity.clone(recursive: false))
            
            DispatchQueue.main.async {
                self.ModelConfirmedForPlacement = nil
            }
        }
    }
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView(selectedModel: .constant("NicolasFlameGold"), ModelConfirmedForPlacement: .constant("NicolasFlameGold"),isPlaced: .constant(true), models: [""])
    }
}
#endif
