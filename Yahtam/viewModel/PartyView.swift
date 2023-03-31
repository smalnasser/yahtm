//
//  PartyView.swift
//  Yahtam
//
//  Created by sarah alnasser on 24/07/1444 AH.
//

import Foundation
import Kingfisher
import SwiftUI


struct PartyView: View {
    
    let party: Party
  
  
    var body: some View {
        ZStack
        {
        
            RoundedRectangle(cornerRadius: 10).fill()
                .frame(width:352,height: 72)
          //  .overlay( RoundedRectangle(cornerRadius: 10).stroke( Color.gray,lineWidth:0))
                .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.067, green: 0.195, blue: 0.249)/*@END_MENU_TOKEN@*/)
            
                HStack (spacing: 15){ // pic
                 //   ZStack{
                       // Image(chooseRandomImage())
                    ZStack{
                        
                        /*
                        Circle().foregroundColor(.white)
                        pic
                            .resizable()
                            .scaledToFill()
                           
                        // .cornerRadius(40)
                            .clipShape(Circle())
                        
                        */
                        // KF
                        
                        
                        KFImage(URL(string:party.Pic)).placeholder{
                            
                            Circle()
                               
                           
                         
                        }.resizable()
                            .cornerRadius(40)
                        
                        
                        }
                    .frame(width: 56, height: 56)
                       //.overlay(Circle().stroke( Color.gray,lineWidth:0))//.padding(10)//.offset(x:10)
                    
                  
                    Text(party.PartyName).frame(width:250,height: 72,alignment: .leading).foregroundColor(.accentColor).accentColor(Color(red: 0.808, green: 0.808, blue: 0.808))
                       
                  
                }.frame(width:352, height: 72)
            
        }.frame(width:352,height: 72)
    }
 
}


struct PartyView_Previews: PreviewProvider {
    static var previews: some View {
       // let p2 = p1 as UIImage
        PartyView(party: Party(partyName: "sarah", description: "", contactEmail: "", contactNum: "", pic: pic ))
     

    }
}
