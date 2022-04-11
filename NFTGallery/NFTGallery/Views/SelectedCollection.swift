//
//  SelectedCollection.swift
//  NFTGallery
//
//  Created by Domenico Cafarelli on 10/04/22.
//

import SwiftUI

struct SelectedCollection: View {
    @StateObject var NFTstore = NFTStore()
    var body: some View {
        
        
        
        ScrollView(.horizontal, showsIndicators: false){
            HStack {
                ForEach(NFTstore.nfts) { nft in
                    GeometryReader { geometry in
                        let minX = geometry.frame(in: .global).minX
                        NFTCard(author: nft.NFT_author, image: nft.NFT_image, title: nft.NFT_name)
                            .rotation3DEffect(.degrees(minX / -10), axis: (x: 0, y: 1, z: 0))
                            .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 0)
                        //                    .overlay(
                        //                        Image(nft.NFT_image)
                        //                            .resizable()
                        //                            .aspectRatio(contentMode: .fit)
                        //                            .frame(height: 150)
                        //                            .cornerRadius(12)
                        //                            .offset(x: 0, y: 0)
                        //                            .offset(x: minX / 2)
                        //                        )
                    }
                    .frame(width: 250, height: 350)
                    
                    
                    
                    //                    ZStack{
                    //
                    //                        Color.gray
                    //                            .opacity(0.5)
                    //
                    //                        VStack(spacing: 30.0){
                    //
                    //                            Text(nft.NFT_name)
                    //
                    //                            Image(nft.NFT_image)
                    //                                .resizable()
                    //                                .aspectRatio(contentMode: .fit)
                    //                                .cornerRadius(12)
                    //                                .padding(5)
                    //
                    //                            Text(nft.NFT_author)
                    //
                    //                        }.padding(.all)
                    //
                    //                    }
                    //                    .frame(width: 200, height: 300)
                    //                        .cornerRadius(20)
                    //                        .padding()
                    
                }
            }
        }
        
        
        
    }
}

struct SelectedCollection_Previews: PreviewProvider {
    static var previews: some View {
        SelectedCollection()
    }
}
