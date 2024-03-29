//
//  ReproductionView.swift
//  DrgonBollWiki
//
//  Created by Esteban Perez Castillejo on 21/3/24.
//

import SwiftUI

struct ReproductionView: View {
    
    @State var audioViewModel = DetailAudioViewModel()
    
    @State private var showStatus = false
    @State private var statusButtonStop = false
    @State private var mostrarButtonMnu = true
    @Binding var mostrarButton: Bool
    
    @Binding var title: String
    @Binding var cover: String
    
    @Namespace var winAnimation
    
    var body: some View {
        if !mostrarButtonMnu {
            VStack{
                HStack{
                    Button(action: {
                        
                        withAnimation(.spring( response: 0.5, dampingFraction: 0.8)){
                            mostrarButtonMnu = true
                        }
                        
                    }, label: {
                        Image(systemName: "arrow.up.backward.and.arrow.down.forward")
                            .symbolEffect(.bounce, value:  mostrarButtonMnu)
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.white)
                            .padding(7)
                            .background {
                                RoundedRectangle(cornerRadius: 300)
                                    .fill(.ultraThinMaterial)
                            }
                    }).padding()
                    
                    Spacer()
                }
                Image(cover)
                    .resizable()
                    .frame(width: 300, height: 300)
                    .padding(4)
                    .onTapGesture {
                        
                    }
                
                Text(title)
                    .font(.custom("SaiyanSans", size: 50)).bold()
                    .foregroundStyle(Color.yellow)
                    .blur(radius: 0)
                    .overlay(
                        Text(title)
                            .font(.custom("SaiyanSans", size: 50)).bold()
                            .foregroundStyle(Color.red)
                            .offset(x: 3, y: 3)
                        
                    ).padding(.horizontal, 3)
                    .shadow(radius: 10)
                
                HStack{
                    Button(action: {
                        showStatus.toggle()
                        audioViewModel.tooglePlayback(for: showStatus == true ? .play : .pause, title: title)
                    }, label: {
                        
                        Image(systemName: showStatus ? "pause.fill" : "play.fill")
                            .shadow(radius: 8)
                            .symbolEffect(.bounce, value: showStatus)
                            .font(.custom( "", size: 60))
                            .foregroundStyle(showStatus ? Color.green : Color.primary)
                    }).padding(.horizontal, -2)
                    
                    Button(action: {
                        showStatus = false
                        audioViewModel.tooglePlayback(for:  .stop, title: title)
                    }, label: {
                        
                        Image(systemName: "stop.fill")
                            .shadow(radius: 8)
                            .symbolEffect(.bounce, value: statusButtonStop)
                            .font(.custom( "", size: 60))
                            .foregroundStyle(showStatus ? Color.red : Color.primary)
                        
                    }).padding(.horizontal, 5)
                }.padding()
            }.matchedGeometryEffect(id: "reproduction", in: winAnimation)
                .background{
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .fill(.ultraThinMaterial)
                }
                .padding()
            
        }else{
            VStack{
                if mostrarButton == true {
                    HStack{
                        Button(action: {
                            withAnimation(.spring( response: 0.5, dampingFraction: 0.8)){
                                mostrarButton = false
                            }
                        }, label: {
                            Image(systemName: "xmark")
                                .font(.footnote)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.white)
                                .padding(7)
                            
                                .background{
                                    RoundedRectangle(cornerRadius: 100)
                                        .fill(.ultraThinMaterial)
                                }
                            
                                .padding(9)
                        })
                        
                        Button(action: {
                            withAnimation(.spring( response: 0.5, dampingFraction: 0.8)){
                                mostrarButtonMnu = false
                            }
                        }, label: {
                            Image(cover)
                                .resizable()
                                .frame(width: 50, height: 50)
                                .padding(4)
                        })
                        
                        Text(title)
                            .modifier(StyleViewFont(size: 25, color: .red))
                            .padding(.horizontal, 5)
                        
                        Button(action: {
                            showStatus.toggle()
                            audioViewModel.tooglePlayback(for: showStatus == true ? .play : .pause, title: title)
                        }, label: {
                            
                            Image(systemName: showStatus ? "pause.fill" : "play.fill")
                                .shadow(radius: 8)
                                .symbolEffect(.bounce, value: showStatus)
                                .font(.custom( "", size: 30))
                                .foregroundStyle(showStatus ? Color.green : Color.primary)
                        }).padding(.horizontal, -2)
                        
                        Button(action: {
                            showStatus = false
                            audioViewModel.tooglePlayback(for:  .stop, title: title)
                        }, label: {
                            
                            Image(systemName: "stop.fill")
                                .shadow(radius: 8)
                                .symbolEffect(.bounce, value: statusButtonStop)
                                .font(.custom( "", size: 30))
                                .foregroundStyle(showStatus ? Color.red : Color.primary)
                            
                        }).padding(.horizontal, 5)
                        
                    }.matchedGeometryEffect(id: "reproduction", in: winAnimation)
                        .background{
                            RoundedRectangle(cornerRadius: 15, style: .continuous)
                                .fill(.ultraThinMaterial)
                        }
                        .padding()
                       
                    Spacer()
                }
            }
        }
        
    }
    
    
}

#Preview {
    
    ReproductionView(mostrarButton: .constant(true), title: .constant("Dagon Ball") , cover: .constant("DragonBall_CD"))
}
