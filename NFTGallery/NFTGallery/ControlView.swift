//
//  ControlView.swift
//  NFTGallery
//
//  Created by Hamza Rochd on 12/04/22.
//

import Foundation
import SwiftUI

struct ControlView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var selectedModel: String?
    @Binding var ModelConfirmedForPlacement: String?
    @Binding var isPlaced: Bool
    var body: some View {
        VStack{
            
            HStack{
                
                Spacer()
                
                ControlButton(systemIconName: "xmark") {
                    presentationMode.wrappedValue.dismiss()
                    self.selectedModel = nil
                }
                .padding()
                
            }
            .padding(.top)
            
            
            Spacer()
            
            ControlButtonBar(selectedModel: self.$selectedModel, ModelConfirmedForPlacement: self.$ModelConfirmedForPlacement, isPlaced: self.$isPlaced)
            
        }
    }
}


struct ControlButtonBar: View {
    @Binding var selectedModel: String?
    @Binding var ModelConfirmedForPlacement: String?
    @Binding var isPlaced: Bool
    var body: some View {
        HStack{
            if isPlaced {
                ControlButton(systemIconName: "checkmark") {
                    print("Model Placed")
                    self.ModelConfirmedForPlacement = self.selectedModel
                    self.isPlaced = false
                    
                }
            }
            
            
        }
        .frame(maxWidth: 500)
        .padding(30)
        .background(Color.black.opacity(0.25))
    }
}

struct ControlButton: View {
    let systemIconName: String
    let action: () -> Void
    var body: some View {
        
        Button(action: {
            self.action()
        }) {
            Image(systemName: systemIconName)
                .font(.system(size: 35))
                .foregroundColor(.white)
                .buttonStyle(PlainButtonStyle())
            
        }
        .frame(width: 50, height: 50)
        
    }
}

