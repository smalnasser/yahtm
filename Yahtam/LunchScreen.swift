//
//  LunchScreen.swift
//  Yahtam
//
//  Created by sarah alnasser on 01/08/1444 AH.
//
///
//

import SwiftUI
import CoreML

enum AnimationState{
    case normal
    case compress
    case expend
}
struct LunchScreen: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var isActive = false

    
    @State private var animationState: AnimationState  = .normal
    func calculate() -> Double{
        switch animationState {
        case .normal:
            return 0.2
        case .compress:
            return 0.09
        case .expend:
            return 0.7
        }
    }
    
    var body: some View {

        if isActive{
            SearchM()
        }else
        {
            ZStack{
                
                VStack{
                    Image("yahtm 1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .scaleEffect(calculate())
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.white)
                //                            .opacity(done ? 0: 1)
            }
            //                .navigationBarHidden(done ? false : true)
            .onAppear(){
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    withAnimation(.spring()) {
                        animationState = .compress
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            withAnimation(.spring()) {
                                animationState = .expend
                                withAnimation(.interpolatingSpring(mass: 1.0, stiffness: 100.0, damping: 10.0, initialVelocity: 0)){
                                    //                                done = true
                                }
                            }
                        }
                    }
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
                    self.isActive = true
                }
            }
        }
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LunchScreen()
    }
}
