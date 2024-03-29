//
//  StyleColor.swift
//  DrgonBollWiki
//
//  Created by Esteban Perez Castillejo on 13/3/24.
//

import SwiftUI

struct StyleColorDegrader: ViewModifier {
    var isColor: Color
    var isColor2: Color
    
    func body(content: Content) -> some View {
        content
            .containerRelativeFrame([.horizontal, .vertical]).background(Gradient(colors: [ isColor, isColor2]))
    }
}

struct StyleViewFont: ViewModifier{
    var size: CGFloat
    var color: Color
    
    func body(content: Content) -> some View {
        content
            .font(.custom("SaiyanSans", size: size))
            .foregroundStyle(color)
            .shadow(color: .black, radius: 0, x: 1, y: 1)
            .shadow(color: .black, radius: 0, x: -1, y: -1)
    }
}

struct CustomFond: ViewModifier {
   
    var size: CGFloat
    var shadow: CGFloat
    var colorShadow: Color
    var colorFont: Color
    
    func body(content: Content) -> some View {
        content
            .font(.custom("SaiyanSans", size: size))
            .foregroundStyle(colorFont)
            .shadow(color: colorShadow ,radius: shadow)
    }
}

extension AnyTransition{
   
    static let hero = AnyTransition.modifier(
        active: HeroModiFire(porcentage: 1),
        identity: HeroModiFire(porcentage: 0)
    )
    
    struct HeroModiFire: AnimatableModifier {
        
        var porcentage: Double
        
        var animatableData: Double {
            get{
                porcentage
            }
            
            set {
              porcentage = newValue
            }
        }
        
        func body(content: Content) -> some View {
            content
                .opacity(1)
        }

    }
}
