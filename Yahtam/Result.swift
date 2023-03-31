//
//  ContentView.swift
//  Yahtam
//
//  Created by sarah alnasser on 23/07/1444 AH.
//

import SwiftUI
import Foundation
import FirebaseCore
import Firebase
import Kingfisher

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}


//
//extension String : Identifiable {
//    public var id: String {
//        Unmanaged.passUnretained(self as AnyObject).toOpaque()
//    }
//}




//var pic =  Image("MOJ")
var pic = "https://firebasestorage.googleapis.com/v0/b/yahtam-c7de6.appspot.com/o/justice.png?alt=media&token=9a0a8853-1919-47a5-bea0-d0f991cd2aca"

    
struct Result: View {
    @EnvironmentObject var viewmodel:ViewModel

    @EnvironmentObject var vm : Vars
    @State var partyArray : [Party] = []
    @State var partyArray1 : [Party] = []
   // @State var PartyResultArray : [String]
    @Binding var PartyResultArray : [String]
    //= ["Ministry of Interior","Ministry of Health","Ministry of Energy"]
    //
    
  //@State var PartyResultArray : [String: [AnyObject]] = ["groups" : ["Ministry Of Communication and technologies", "Ministry of Commerce"] as [AnyObject]]
    @State var ArraySize : Int = 0
    
    var body: some View {
      
        
       
     
     //   NavigationView{
            
            VStack()
            {
                
             
                   
                
                List{
                    
                    ForEach(partyArray) { party in
                        NavigationLink {
                            
                            PartyDetailsView(party: Party(partyName: party.PartyName, description: party.Description, contactEmail: party.ContactEmail, contactNum: party.ContactNum, pic: party.Pic))
                            
                        } label: {
                            
                            
                            PartyView(party: Party(partyName: party.PartyName, description: party.Description, contactEmail: party.ContactEmail, contactNum: party.ContactNum, pic: party.Pic ))
                            
                        }
                        
                    }
                    
                    
                }.scrollContentBackground(.hidden)

//                    .navigationTitle(Text("Results").font(.title)).foregroundColor(.white)
//                    .toolbarBackground(/*@START_MENU_TOKEN@*/Color(red: 0.068, green: 0.195, blue: 0.249)/*@END_MENU_TOKEN@*/, for: .navigationBar)
//                    .toolbarBackground(.visible, for: .navigationBar)
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
//
                     // For the > back button
                        .navigationTitle("")
                    
                
        // KFImage(URL(string: "https://firebasestorage.googleapis.com/v0/b/yahtam-c7de6.appspot.com/o/Culture.png?alt=media&token=584e215d-1778-476b-985a-121a3d8876a2"))
                //.frame(width: 20, height: 20)
            }
            .onAppear()
            {
                viewmodel.classify()
                ArraySize = PartyResultArray.count
                ArraySize -= 1
              //   print("🦖🐸🦖🐸🦖🐸🦖🐸🦖🐸🦖🐸🦖🐸🦖🐸\(ArraySize)")
                fetchParty()
                
            }
                
            
           
            
       // }

        
    }
    
    
    func fetchParty(){
        partyArray = []
      // @State var picString : String = ""
        //@State  var Pic : Image
        let db = Firestore.firestore()
       // let PartyRef = db.collection("Party")
      //  db.collection("Party").getDocuments(completion: <#T##(QuerySnapshot?, Error?) -> Void#>)
       //R= Result
        for R in 0...ArraySize {
            
            db.collection("Party").whereField("PartyName", isEqualTo: PartyResultArray[R]).getDocuments { snapshot, error in
                      if error == nil {
                       // print("🦖🐸🦖🐸🦖🐸🦖good 🐸🦖🐸🦖🐸🦖🐸🦖🐸")
                          //print("hiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii")
                          if let snapshot = snapshot {
                             // print("🦖🐸🦖🐸🦖🐸🦖snapgood 🐸🦖🐸🦖🐸🦖🦖🐸\(PartyResultArray[Result])")
                              DispatchQueue.main.async{
                                  
                                  self.partyArray1
                                  = snapshot.documents.map { m in
                                     // picString = m["Pic"] as! String
                                    //  picString = m["Pic"] as? String ?? ""
                                   
                                    //  Pic = KFImage(URL(string:picString)!).Placeholder
                                    // ------
                                    
                                      return Party(partyName: m["PartyName"] as? String ?? "", description: m["Description"] as? String ?? "", contactEmail: m["ContactEmail"] as? String ?? "" , contactNum: m["ContactNum"] as? String ?? "", pic: m["Pic"] as? String ?? "")
                                      
                                      ///-------
                                     

                                      
                                  }
                                 // print("🦖🐸🦖🐸🦖🐸🦖snapgood 🐸🦖🐸🦖🐸🦖🦖🐸\(partyArray1[0])")
                                  partyArray.append(partyArray1[0])
                              }
                              //m= ministry
                           
                          }
                        //  partyArray.append(partyArray1[0])
                      } else
                      {
                          print("There is error ")
                          print("🦖🐸🦖🐸🦖🐸🦖🐸error🦖🐸🦖🐸🦖🐸🦖🐸")
                      }
                  
                  }
           
        }
        
        
      
    
        
      
        
        
        
        
        
        
       /*
        db.collection("Party").whereField("PartyName", isEqualTo: "Ministry of Education")
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                    print("🦖🐸🦖🐸🦖🐸🦖🐸🦖🐸🦖🐸🦖🐸🦖🐸")
                } else {
                    for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                     
                        
                    }
                }
        }
       */
        
        
       /*
        db.collection("Party").whereField("PartyName", isEqualTo:
                                           "Ministry of Education"
)
            .getDocuments() { (querySnapshot, err) in
                if err != nil {
                    print("Error getting documents hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhssssssssssssssssssssssssshhhhhhhh: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                     //   print("Error getting documents hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhssssssssssssssssssssssssshhhhhhhh:")
                    }
                }
        }
        
        
      */
        
        
        
        
       ///start
        /*
        ///
        db.collection("Party").getDocuments { snapshot, error in
            if error == nil {
                //print("hiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii")
                if let snapshot = snapshot {
                    DispatchQueue.main.async{
                        self.partyArray = snapshot.documents.map { m in
                            //picString = m["Pic"] as! String
                            //picString = m["Pic"] as? String ?? ""
                         
                           // Pic = KFImage(URL(string:picString)!).Placeholder
                          
                            return Party(partyName: m["PartyName"] as? String ?? "", description: m["Description"] as? String ?? "", contactEmail: m["ContactEmail"] as? String ?? "" , contactNum: m["ContactNum"] as? String ?? "", pic: m["Pic"] as? String ?? "")
                            

                            
                        }
                    }
                    //m= ministry
                 
                }
                
            } else
            {
                print("hiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii")
            }
        
        }
    
        //end
        */
      //  let p = Party(partyName: "sarah", description: "Ensuring an excellent justice environment based on Islamic law, for providing, organizing, developing judicial and notarial services, and disseminating legal culture through an efficient institutional structure, well-qualified staff, and effective local and international partnerships, using advanced tools", contactEmail: "Gov.sa@gmail.com", contactNum: "0504216642", pic: pic )
        
      //partyArray.append(p)
    // partyArray.append(p)
     //partyArray.append(p)
       // partyArray.append(p)
       // partyArray.append(p)
     /*
           let predicate = NSPredicate(value: true)
           let query = CKQuery(recordType:"PostTable", predicate: predicate)

    
           let operation = CKQueryOperation(query: query)
           operation.recordMatchedBlock = { recordId, result in
               DispatchQueue.main.async {
                   switch result{
                   case .success(let record):
                       let posts = PostTable(record: record)
                       self.postArray.append(posts)
                   case .failure(let error):
                       print("\(error.localizedDescription)")
                   }
               }
           }

      CKContainer(identifier: "iCloud.demo.autismCommunity.community").publicCloudDatabase.add(operation)
      */
        
        
       }

    
}

struct Result_Previews: PreviewProvider {
    static var previews: some View {
        Result( PartyResultArray: .constant(["Ministry Of Communication and technologies","Ministry of Commerce","Ministry of Culture"]))
            .environmentObject(ViewModel())
    }
}
