//
//  PartyDetailsView.swift
//  Yahtam
//
//  Created by sarah alnasser on 26/07/1444 AH.
//

import Foundation
import SwiftUI
import Kingfisher

class Vars: ObservableObject {
   
    @Published var showingInfo: Bool = false

}


struct PartyDetailsView: View {
    let party: Party
    @EnvironmentObject var vm : Vars
    
    //@StateObject var showingInfomation = Vars()
    var body: some View {
        NavigationView{
            
            VStack(spacing: 32)
            {
                
                
                
                // VStack{
                /*
                 pic.resizable().scaledToFit().clipShape(RoundedRectangle(cornerRadius: 11)).frame(width: 315, height: 176)
                 */
                // KF
                
                KFImage(URL(string:party.Pic)).placeholder{
                    
                    
                    
                    
                }.resizable(resizingMode: .stretch)
                    .scaledToFit()
                    .frame(width: 315, height: 176)
                    .shadow(radius: 6)
                //.clipShape(RoundedRectangle(cornerRadius: 11))
                
                // }.frame(width: 315, height: 176)
                Text (party.Description).foregroundColor(.accentColor).accentColor(Color(red: 0.077, green: 0.191, blue: 0.245))
                    .frame(width:302,height: 156, alignment: .leading).accentColor(Color(red: 1.0, green: 1.0, blue: 1.0))
                
                
                //   NavigationLink
                Button(action: {
                    //
                    vm.showingInfo.toggle()
                },
                       label:
                        {
                    ZStack{
                        RoundedRectangle(cornerRadius: 10,style: .continuous)
                        
                            .accentColor(/*@START_MENU_TOKEN@*/Color(red: 0.067, green: 0.195, blue: 0.249)/*@END_MENU_TOKEN@*/).frame(width: 134,height: 45)
                        Text("Contact Us").accentColor(Color(red: 0.862, green: 0.842, blue: 0.787))
                    }.offset(x:80)
                })
                Text("")
                        .navigationBarTitleDisplayMode(.inline
                        ).toolbarBackground(/*@START_MENU_TOKEN@*/Color(red: 0.067, green: 0.195, blue: 0.249)/*@END_MENU_TOKEN@*/, for: .navigationBar)
                    .toolbarBackground(.visible, for: .navigationBar)
                
                   
                
                        .toolbar { // <2>
                            ToolbarItem(placement: .principal) { // <3>
                                VStack {
                                    Text("Results").font(.title2)
                                        .foregroundColor(Color(red: 0.862, green: 0.842, blue: 0.787))
                                
                                }
                            }
                        }
            }.sheet(isPresented: $vm.showingInfo)
            {
                BottomSheetView(p: party).presentationDetents([.height(200)])
                // .presentationDragIndicator(.)
            }
            
            
            
            
        }
        
    }
    
}


struct BottomSheetView : View {
// @Environment(.dismiss) var dismiss
@EnvironmentObject var vm : Vars

let p :Party
// @StateObject var s = Vars()
var body: some View {
VStack{
List
{
HStack(spacing: 55.0){
Image(systemName: "phone.fill")
.resizable(resizingMode: .stretch)
.foregroundColor(.gray)
// .font(.system(size: 50))
.frame(width: 25,height: 25)

                Text( p.ContactNum)}
            
            HStack(spacing: 55.0){
                Image(systemName: "envelope.fill")
                    .resizable(resizingMode: .stretch)
                    .foregroundColor(.gray).frame(width: 28,height: 20)
                    
                Text( p.ContactEmail)
            }
            
            
           // HStack(alignment: .center){
                Button(action: {
                    vm.showingInfo = false
                    // dismiss()
                }, label: {Text("Cancel")
                        .font(.headline)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    .frame(width: 390.0, height: 30.0)})
           // }
            
        }
        .padding()
        .frame(width: 425.0)
        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        
        
        
        
        
        
    }
}
}


struct PartyDetailsView_Previews: PreviewProvider {
    static var previews: some View {
       // let p2 = p1 as UIImage
        PartyDetailsView(party: Party(partyName: "sarah", description: " Ensuring an excellent justice environment based on Islamic law, for providing, organizing, developing judicial and notarial services, and disseminating legal culture through an efficient institutional structure, well-qualified staff, and effective local and international partnerships, using advanced tools", contactEmail: "Gov.sa@gmail.com", contactNum: "0504216642", pic: pic ))
            .environmentObject(Vars())
     

    }
}
