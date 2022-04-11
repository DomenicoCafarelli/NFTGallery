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
        
        Text(NFTstore.nft[0].NFT_name)
        
    }
}

struct SelectedCollection_Previews: PreviewProvider {
    static var previews: some View {
        SelectedCollection()
    }
}
