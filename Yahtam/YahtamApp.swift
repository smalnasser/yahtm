//
//  YahtamApp.swift
//  Yahtam
//
//  Created by sarah alnasser on 23/07/1444 AH.
//


//
import SwiftUI
@main
struct YahtamApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var vm = Vars()
    @StateObject var viewmodel = ViewModel()
    var body: some Scene {
        WindowGroup {
           // Result()
            LunchScreen()
           // SearchM()
               .environmentObject(vm)
               .environmentObject(viewmodel)
        }
    }
    
}
