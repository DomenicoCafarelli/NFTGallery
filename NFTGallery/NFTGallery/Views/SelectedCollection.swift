//
//  SelectedCollection.swift
//  NFTGallery
//
//  Created by Domenico Cafarelli on 10/04/22.
//

import SwiftUI

struct SelectedCollection: View {
    @StateObject var NFTstore = NFTStore()
    @State private var ARisPresenting = false
    @State var selectedModel: String?
    @State var ModelConfirmedForPlacement: String?
    @State var isPlaced: Bool = false
    let screenMinusCard = (UIScreen.main.bounds.width - 210) / 2
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack {
                ForEach(NFTstore.nfts) { nft in
                    GeometryReader { geometry in
                        
                        let minX = geometry.frame(in: .global).minX
                        
                        Button {
                            ARisPresenting = true
                            self.selectedModel = nft.NFT_3Dmodel
                            self.isPlaced = true
                        } label: {
                            ZStack{
                                Color.gray
                                    .opacity(0.5)
                                VStack(spacing: 30.0){
                                    
                                    Text(nft.NFT_name)
                                        .foregroundColor(.white)
                                        .padding(5)
                                    
                                    Image(nft.NFT_image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .cornerRadius(12)
                                        .padding(5)
                                    
                                    Text(nft.NFT_author)
                                        .foregroundColor(.white)
                                        .padding(5)
                                    
                                }
                                .padding(/*@START_MENU_TOKEN@*/.all, 10.0/*@END_MENU_TOKEN@*/)
                            }
                            .frame(width: 200, height: 300)
                            .cornerRadius(20)
                            
                        }.padding(10.0)
                            .fullScreenCover(isPresented: $ARisPresenting) {
                                ContentView(selectedModel: self.$selectedModel, ModelConfirmedForPlacement: self.$ModelConfirmedForPlacement, isPlaced: self.$isPlaced)
                            }
                            .rotation3DEffect(.degrees(Double((minX - screenMinusCard)) / -10), axis: (x: 0, y: 1, z: 0))
                            .shadow(color: .black.opacity(0.5), radius: 5, x: 0, y: 0)
                    }
                    .frame(width: 220, height: 320)
                }
            }
            .padding(.horizontal, screenMinusCard)
        }
    }
}

struct SelectedCollection_Previews: PreviewProvider {
    static var previews: some View {
        SelectedCollection(selectedModel: "NicolasFlameGold", ModelConfirmedForPlacement: "NicolasFlameGold")
    }
}
