//
//  SearchM.swift
//  Yahtam
//
//  Created by sarah alnasser on 01/08/1444 AH.
//

import Foundation
//
//  ContentView.swift
//  MlTextCla
//
//  Created by Maria Alattas on 23/05/1444 AH.
//
import SwiftUI
import CoreML

struct SearchM: View {
    @EnvironmentObject var viewmodel:ViewModel
//    @State private var modelInput = ""
//    @State private var modelOutput = [String]()
//    @State private var alertShow = false
    @State var search : String = ""
//    @State var ResultParty : [String] = [] //= ["Ministry Of Communication and technologies","Ministry of Commerce","Ministry of Culture"]// //
    var isSignInButtonDisabled: Bool {
       [viewmodel.modelInput].contains(where: \.isEmpty)
    }
    @FocusState private var nameIsFocused: Bool
    var body: some View {
        NavigationView
        {
            
            VStack(alignment: .leading, spacing: 10.0) {
                
                Image("yahtm 2")
                    .resizable()
                    .frame(width: 303.0, height: 275.0)
                    .imageScale(.small)
                VStack(alignment: .leading){
                    Text("How can i help?")
                        .fontWeight(.semibold)
                        .foregroundColor(Color(red: -0.194, green: 0.42, blue: 0.338))
                        .multilineTextAlignment(.leading)
                        .frame(width: 130, height: 30.0)
                    ///here
                }
                ZStack(alignment: .leading) {
                    if self.viewmodel.modelInput.isEmpty {
                        
                        VStack(alignment: .trailing) {
                            Text("Tell us what is your case")
                                .padding(EdgeInsets(top: 0, leading: 10, bottom: 40, trailing: 0))
                                .multilineTextAlignment(.trailing)
                            
                        }
                    }
                    TextEditor(text: $viewmodel.modelInput)
                        .focused($nameIsFocused)
                        .padding(EdgeInsets(top: 0, leading:5, bottom: 25, trailing: 0))
                        .opacity(self.search.isEmpty ? 0.5 : 1)
                        .colorMultiply(Color(red: 0.862, green: 0.842, blue: 0.787))
                        .cornerRadius(8)
                }
                
                .background(Color(red: 0.862, green: 0.842, blue: 0.787))
                .accentColor(Color(red: 0.003, green: 0.2, blue: 0.253))
                .foregroundColor(Color(red: 0.003, green: 0.2, blue: 0.253))
                .frame(width: 335.0, height: 79.0)
                .cornerRadius(8)
                
                
                VStack(alignment: .center){
                    
                    //here search
                    
                    
                    NavigationLink {
                        
                        Result(PartyResultArray: $viewmodel.ResultParty)
                        
                    }
                label:{ Text("Search")
                    
                        .multilineTextAlignment(.center)
                        .padding()
                        .cornerRadius(2)
                        .font(.body)
                        .foregroundColor(Color(red: 0.862, green: 0.842, blue: 0.787))
                        .frame(width: 143.0, height: 40.0)
                    
                        .background(
                            isSignInButtonDisabled ?
                            LinearGradient(colors: [.gray], startPoint: .topLeading, endPoint: .bottomTrailing) :
                                LinearGradient(colors: [Color(red: 0.003, green: 0.2, blue: 0.253)], startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                    //.onSubmit {
                    //                                Result(PartyResultArray: $ResultParty)
                    // classify()
                    
                    //  Register()}
                    
                        .cornerRadius(8)
                    
                }.onAppear {
                    viewmodel.classify()
                    nameIsFocused = false
                }
                    
                    
                }
                .padding(.leading, 80.0)
                .padding()
                // Spacer()
                
                
                //            .alert(isPresented: $alertShow, content: {
                //            Alert(title: Text("Prediction"), message: Text(modelOutput), dismissButton: .default(Text("OK")))
                //            })
                
            }.padding(.bottom, 10.0)
            
                .navigationTitle("")
        }
}
    
    
//func classify() {
//        do {
//            modelOutput = []
//            let model = try Yahtam(configuration: .init())
//            let prediction = try model.prediction(text: modelInput)
//
//         // for _ in 1...5 {
//
//               modelOutput.append(prediction.label)
//           // modelOutput.append(prediction.featureValue(for: <#T##String#>))
//              //هنا
//           // modelOutput.append(prediction.featureValue(for: <#T##String#>))
//      //  }
//            print(modelOutput)
//        } catch {
//            modelOutput.append("Something went wrong")
//        }
//    alertShow = true
//    ResultParty = modelOutput
//
//    //print("🦁🦁🦁🦁🦁🦁🦁🦁🦁🦁🦁🦁🦁🦁🦁🦁🦁🦁")
//  }
    
    }
  


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SearchM()
            .environmentObject(ViewModel())
    }
    
}

