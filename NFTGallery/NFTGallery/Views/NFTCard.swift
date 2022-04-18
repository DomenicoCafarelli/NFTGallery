//
//  NFTCard.swift
//  NFTGallery
//
//  Created by Hamza Rochd on 11/04/22.
//
//
//import SwiftUI
//
//struct NFTCard: View {
//    
//    var author : String
//    var image : String
//    var title : String
//    var threeDmodel: String
//    
//    @State private var ARisPresenting = false
//    @State var selectedModel: String
//    @State var ModelConfirmedForPlacement: String
//    
//    var body: some View {
//        Button {
//            ARisPresenting = true
//            self.selectedModel = threeDmodel
//            
//        } label: {
//            ZStack{
//                Color.gray
//                    .opacity(0.5)
//                VStack(spacing: 30.0){
//                    
//                    Text(title)
//                    
////                    Spacer()
//                    Image(image)
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .cornerRadius(12)
//                        .padding(5)
//                    
//                    Text(author)
//                    
//                }
//                .padding(/*@START_MENU_TOKEN@*/.all, 10.0/*@END_MENU_TOKEN@*/)
//            }
//            .frame(width: 200, height: 300)
//            .cornerRadius(20)
//            
//        }.padding(10.0)
//            .fullScreenCover(isPresented: $ARisPresenting) {
//                ContentView(selectedModel: self.$selectedModel, ModelConfirmedForPlacement: self.$ModelConfirmedForPlacement)
//            }
//            
//        
//        
//    }
//}

//struct NFTCard_Previews: PreviewProvider {
//    static var previews: some View {
//        NFTCard()
//    }
//}
