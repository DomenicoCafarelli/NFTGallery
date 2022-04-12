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
    var body: some View {
        VStack{
            
            HStack{
                
                Spacer()
                
                ControlButton(systemIconName: "x.circle.fill") {
                    presentationMode.wrappedValue.dismiss()
                    self.selectedModel = nil
                }
                .padding()
                
            }
            .padding()
            
            Spacer()
            
            ControlButtonBar(selectedModel: self.$selectedModel, ModelConfirmedForPlacement: self.$ModelConfirmedForPlacement)
            
        }
    }
}


struct ControlButtonBar: View {
    @Binding var selectedModel: String?
    @Binding var ModelConfirmedForPlacement: String?
    var body: some View {
        HStack{
            
            ControlButton(systemIconName: "checkmark.circle.fill") {
                print("Model Placed")
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

