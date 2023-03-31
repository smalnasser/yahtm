//
//  ViewModel.swift
//  Yahtam
//
//  Created by sarah alnasser on 06/08/1444 AH.
//

import Foundation



final class ViewModel: ObservableObject{
    @Published var result : [String] = []
    @Published  var modelInput = ""
    @Published  var modelOutput = [String]()
    @Published  var alertShow = false
    @Published var ResultParty : [String] = []
    
    func classify() {
            do {
                modelOutput = []
                let model = try Yahtam(configuration: .init())
                let prediction = try model.prediction(text: modelInput)
               
             // for _ in 1...5 {
                  
                   modelOutput.append(prediction.label)
               // modelOutput.append(prediction.featureValue(for: <#T##String#>))
                  //هنا
               // modelOutput.append(prediction.featureValue(for: <#T##String#>))
          //  }
                print(modelOutput)
            } catch {
                modelOutput.append("Something went wrong")
            }
        alertShow = true
        ResultParty = modelOutput
        //= ["Ministry of Interior","Ministry of Health","Ministry of Energy"]
       
        //print("🦁🦁🦁🦁🦁🦁🦁🦁🦁🦁🦁🦁🦁🦁🦁🦁🦁🦁")
      }
    
    
}
