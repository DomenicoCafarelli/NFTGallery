//
//  ContentView.swift
//  NFTGallery
//
//  Created by Domenico Cafarelli on 31/03/22.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var selectedModel: String?
    @Binding var ModelConfirmedForPlacement: String?
    var body: some View {
        ZStack(alignment: .bottom){
           
            ARViewContainer()
            
            ControlView(selectedModel: self.$selectedModel, ModelConfirmedForPlacement: self.$ModelConfirmedForPlacement)
            
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

//#if DEBUG
//struct ContentView_Previews : PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
//#endif
