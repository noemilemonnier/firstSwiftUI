//
//  ContentView.swift
//  ASlotDemo
//Following CodingWithChris Tutorial and customizing it
//
//  Created by Noémi Lemonnier on 2020-07-26.
//  Copyright © 2020 Noemi Lemonnier. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    //Number of credits available
    @State private var credits = 1000
    
    //Set an amount to bet (here 5 credits)
    private var betAmount = 5
    
    //The variables for the card should be to the ContentView as it has the logic to determine wins and it has the spin button. => Source of truth of this data
    //Set a winning message
    @State private var winningMsg = ""
    
    //declaring an array of names of the pictures
    @State private var symbols = ["donut", "lemon", "apple"]
    
    // This array represents the state of the 3 images showing such as 0=donut, 1=lemon, 2=apple
    @State private var numbers = [1, 0, 2]
    
    
    //TO change background image when there is a win
    @State private var backgrounds = [Color.white, Color.white, Color.white]
    
    var body: some View {
        ZStack{
            //Background Dark brown
            Rectangle()
                .foregroundColor(Color(red: 171/255, green: 255/255, blue: 250/255 ))
                .edgesIgnoringSafeArea(.all)
            
            //Background Light brown
            Rectangle()
                .foregroundColor(Color(red: 255/255, green: 182/255, blue: 199/255 ))
                .rotationEffect(Angle(degrees: 45))
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                
                Spacer()
                
                //Title
                HStack{
                    Image(systemName: "star.fill").foregroundColor(.pink).font(.largeTitle)
                    
                    Text("SwiftUI Slots")
                        .foregroundColor(Color(red: 118/255, green: 91/255, blue: 91/255))
                        .bold()
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(10)
                    
                    
                    Image(systemName: "star.fill").foregroundColor(.pink).font(.largeTitle)
                    
                    }.scaleEffect(2).padding(.all, 20)
                
                
                Spacer()
                
                //credits counter
                Text("Credits: " + String(credits))
                    .foregroundColor(.black)
                    .padding(.all, 10)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                
                Spacer()
                
                //Winning Message
                Text(self.winningMsg)
                    .font(.subheadline)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.black)
                    .padding(.all, 20)
                
                
                
                //Cards
                HStack{
                    Spacer()
                    
                    //Compared to Part 1, the code for the 3 cards repeats itself, so we can reduce this by creating a new class
                    
                    CardView(symbol: $symbols[numbers[0]], background: $backgrounds[0])
                    
                    CardView(symbol: $symbols[numbers[1]], background: $backgrounds[1])
                    
                    CardView(symbol: $symbols[numbers[2]], background: $backgrounds[2])
                    
                    Spacer()
                    
                }
                
                Spacer()
                
                //Button
                Button(action: {
                    
                    //Resets the background LONG WAY
                    // self.backgrounds[0] = Color.white
                    // self.backgrounds[1] = Color.white
                    // self.backgrounds[2] = Color.white
                    
                    //Using a map function to run a code on every single item of the array. Color is the element that we are transforming. In this case we want to replace it and not transform it. This will return a new copy of your array so we need ti assign ut again
                    self.backgrounds = self.backgrounds.map { _ in
                        Color.white
                    }
                    
                    //Randomize the numbers of the array ==> change the images
                    // self.numbers[0] = Int.random(in: 0...self.symbols.count - 1)
                    // self.numbers[1] = Int.random(in: 0...self.symbols.count - 1)
                    // self.numbers[2] = Int.random(in: 0...self.symbols.count - 1)
                    //We use _ as we are assigning and not transforming
                    self.numbers =  self.numbers.map { _ in
                        Int.random(in: 0...self.symbols.count - 1)
                    }
                    
                    
                    //Checking wins
                    if self.numbers[0] == self.numbers[1] && self.numbers[1] == self.numbers[2] {
                        self.credits += self.betAmount*10
                        self.winningMsg = "You won 50 credits!"
                        
                        //Change background images
                        // self.backgrounds[0] = Color.green
                        //self.backgrounds[1] = Color.green
                        //self.backgrounds[2] = Color.green
                        self.backgrounds = self.backgrounds.map { _ in
                            Color.green
                        }
                        
                        
                    }
                        //If lost
                    else{
                        self.credits -= self.betAmount
                        self.winningMsg = "You lost!"
                    }
                    
                    
                }) {
                    Text("Spin!")
                        .bold()
                        .foregroundColor(.white)
                        .padding(.all, 10)
                        .padding([.leading, .trailing], 30)
                        .background(Color.pink)
                        .cornerRadius(20)
                }
                
                Spacer()
            }.padding()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
