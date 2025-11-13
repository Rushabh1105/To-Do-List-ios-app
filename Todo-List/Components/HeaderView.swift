//
//  HeaderView.swift
//  Todo-List
//
//  Created by miniOrange Inc on 08/10/25.
//

import SwiftUI

struct HeaderView: View {
    let title: String;
    let subtitle: String;
    let rotationAngle: Double;
    let backgroundColor: Color;
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundStyle(backgroundColor)
                .rotationEffect(Angle(degrees: rotationAngle))
            
            VStack {
                Text(title)
                    .font(.system(size: 50))
                    .foregroundStyle(.white)
                    .bold()
                    
                Text(subtitle)
                    .font(.system(size: 30))
                    .foregroundStyle(.white)
            }
            .padding(.top, 80)
        }
        .offset(y: -150)
        .frame(width: UIScreen.main.bounds.width * 3, height: 350)
    }
}

#Preview {
    HeaderView(
        title: "title", subtitle: "subtitle", rotationAngle: 15, backgroundColor: .blue
    )
}
