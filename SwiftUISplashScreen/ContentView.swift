//
//  ContentView.swift
//  SwiftUISplashScreen
//
//  Created by Dev on 17/01/21.
//

import SwiftUI
import Lottie

struct ContentView: View {
    var body: some View {

        SplashScreen()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SplashScreen: View {
    
    @State var show = false
        
    @State var phNo = ""
    
    var body: some View {
        
        ZStack {
                
            Color(.systemOrange)
                    .ignoresSafeArea()
                            
                    VStack {
                                        
                    AnimatedView(show: $show)
                    // default Frame....
                        .frame(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.height / 2, alignment: .top)
                        .padding(.bottom, 0)
                        .padding(.top, -200)
                        .fixedSize()
                        .padding(.leading,0)
                        .padding(.trailing,0)
                        .aspectRatio(contentMode: .fit)
                        .opacity(show ? 0 : 1)
                        
                    VStack{
                        
                        HStack{
                            
                            VStack(alignment: .leading, spacing: 10, content: {
                                Text("Namaste!")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)

                                
                                Text("Enter your phone number to continue")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14))
                            })
                            
                            Spacer(minLength: 15)
                            
                        }
                        
                        VStack {
                            HStack(spacing: 15) {
                                
                                Text("+91")
                                    .foregroundColor(.black)
                                
                                Rectangle()
                                    .fill(Color("bg"))
                                    .frame(width: 1, height: 18)
                                
                                TextField("", text: $phNo)
                            }
                            
                            Divider()
                                .background(Color("bg"))
                        }
                        .padding(.vertical)
                        
                        Button(action: {}, label: {
                            Text("Verify")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.vertical, 10)
                                .frame(width: UIScreen.main.bounds.width - 60)
                                .background(Color(.systemGreen))
                                .clipShape(Capsule())
                            
                        })
                        
                        HStack{
                            
                            Rectangle()
                                .fill(Color.black.opacity(0.3))
                                .frame(height: 1)
                            
                            Text("OR")
                                .fontWeight(.bold)
                                .foregroundColor(Color.black.opacity(0.3))
                            
                            Rectangle()
                                .fill(Color.black.opacity(0.3))
                                .frame(height: 1)
                        }
                        .padding(.vertical, 0)
                        
                        HStack(spacing: 20){
                            
                            Button(action: {}, label: {
                                
                                HStack(spacing: 10){
                                    
                                    Image("fb")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 25, height: 25)
                                    
                                    Text("facebook")
                                        .fontWeight(.bold)
                                        .padding(.leading,-30)
                                        .foregroundColor(.white)
                                }
                                .padding(.vertical,10)
                                .frame(width: (UIScreen.main.bounds.width - 80) / 2)
                                .background(Color(.blue))
                                .clipShape(Capsule())
                            })
                            
                            Button(action: {}, label: {
                                
                                HStack(spacing: 10){
                                    
                                    Image("google")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 25, height: 25)
                                    
                                    Text("Google")
                                        .fontWeight(.bold)
                                        .padding(.leading,-25)     .foregroundColor(.white)
                                }
                                .padding(.vertical,10)
                                .frame(width: (UIScreen.main.bounds.width - 80) / 2)
                                .background(Color("google"))
                                .clipShape(Capsule())
                            })
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(21)
                    .padding()
                    
                    // Bottom To up Transition..
                    
                    // we can acheive this by frame property...
                    .frame(height: show ? nil : 0)
                    .opacity(show ? 1 : 0)

            }
        }
    }
}


// Animated View...

struct AnimatedView: UIViewRepresentable {
    
    @Binding var show: Bool
    
    func makeUIView(context: Context) -> AnimationView{
        
        let view = AnimationView(name: "namaste", bundle: Bundle.main)
        
        // on Complete....
        view.play { (status) in
            
            if status{
                
                // toggling view...
                withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 0.8, blendDuration: 0.8)){
                    show.toggle()
                }
            }
        }
        
        return view
    }
    
    func updateUIView(_ uiView: AnimationView, context: Context) {
        
        
    }
}

