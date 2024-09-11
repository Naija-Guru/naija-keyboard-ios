//
//  SpellCheckMatchView.swift
//  Nigerian Pidgin Keyboard
//
//  Created by Emmanuel Idaresit on 24/08/2024.
//

import SwiftUI

struct SpellCheckMatchView: View {
    
    let match : Match
    let onAccept : () -> Void
    let onIgnoreRule : () -> Void
    let onIgnoreCategory : () -> Void
    
    var body: some View {
        GeometryReader { rect in
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    Image("bulls_eye")
                    Text("Correctness · \(match.rule.category.name)")
                        .font(.custom("Poppins-Regular", size: 12))
                        .foregroundColor(Color(hex:"84888A"))
                    Spacer()
                }
                .padding(.top, 10)//The Stuff make sense if them com
                .padding(.horizontal, 12)
                
                ZStack {
                    Text(match.replacements.first?.value ?? "")
                        .font(.custom("CabinetGroteskVariable-Bold_Medium", size: 24))
                        .foregroundColor(.white)
                        .padding(.vertical, 4)
                        .padding(.horizontal, 10)
                }
                .background(KeyboardColours.primary)
                .clipShape(RoundedCornersShape(corners: .allCorners, radius: 4))
                .padding(.horizontal, 12)
                .onTapGesture {
                    onAccept()
                }
                
                ScrollView {
                    Text(match.message)
                        .font(.custom("Poppins-Regular", size: 16))
                        .foregroundColor(.black)
                        .padding(.horizontal, 12)
                }
                
                Spacer()
                
                HStack() {
                    Spacer()
                    Button(action: onIgnoreRule) {
                        Text("Ignore Rule")
                            .font(.custom("Poppins-Medium", size: 14))
                            .foregroundColor(Color(hex: "8E8E93"))
                            .padding(.vertical, 10)
                            .padding(.horizontal, 19)
                    }
                    Button(action: onIgnoreCategory) {
                        Text("Ignore Category")
                            .font(.custom("Poppins-Medium", size: 14))
                            .foregroundColor(Color(hex: "8E8E93"))
                            .padding(.vertical, 10)
                            .padding(.horizontal, 19)
                    }
                    
                }
                .padding(.trailing, 18)
                .padding(.bottom, 10)

            }
            
            .frame( maxHeight: rect.size.height)
            .frame(width: rect.size.width )
            .overlay(RoundedCornersShape(corners: [.allCorners], radius: 16)
                .stroke( KeyboardColours.borderColor, lineWidth: 1)
            )
            .padding(.horizontal, 12)
            .padding(.top, 10)
        }
    }
}

//#Preview {
//    SpellCheckMatchView(match: Match(from: JSONDecoder() as! Decoder), onAccept: {}, onIgnore: {})
//}
