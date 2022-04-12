//
//  Model.swift
//  NFTGallery
//
//  Created by Domenico Cafarelli on 11/04/22.
//

import Foundation
import SwiftUI

struct NFT: Identifiable{
    let id = UUID()
    var NFT_model_name: String
    var NFT_name: String
    var NFT_collectionID: String
    var NFT_author: String
}

class NFTStore: ObservableObject {
    
    @Published var nfts: [NFT] = [
    
    NFT(NFT_model_name: "ParacelsusSculpture", NFT_name: "Paracelsus Sculpture", NFT_collectionID: "PRCLSS01 NFT", NFT_author: "Ricky Ammendola"),
    NFT(NFT_model_name: "ParacelsusGold", NFT_name: "Paracelsus Gold", NFT_collectionID: "PRCLSS.GLD NFT", NFT_author: "Ricky Ammendola"),
    NFT(NFT_model_name: "ParacelsusBismuth", NFT_name: "Paracelsus Bismuth", NFT_collectionID: "PRCLSS.BSMTH NFT", NFT_author: "Ricky Ammendola"),
    NFT(NFT_model_name: "NicolasFlamelBismuth", NFT_name: "Nicolas Flamel Bismuth", NFT_collectionID: "NCFLML01 NFT", NFT_author: "Ricky Ammendola"),
    NFT(NFT_model_name: "NicolasFlamelGold", NFT_name: "Nicolas Flamel Gold", NFT_collectionID: "NCFLML.GLD NFT", NFT_author: "Rikcy Ammendola"),
    NFT(NFT_model_name: "NicolasFlamelSculpture", NFT_name: "Nicolas Flamel Sculpture", NFT_collectionID: "NCFLML.GLD NFT", NFT_author: "Ricky Ammendola"),
    NFT(NFT_model_name: "SwanRich", NFT_name: "SwanRich", NFT_collectionID: "SWAN.RICH NFT", NFT_author: "Lino Drew")
    ]
    
}
