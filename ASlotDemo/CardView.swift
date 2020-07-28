//
//  CardView.swift
//  ASlotDemo
//
//  Created by Noémi Lemonnier on 2020-07-28.
//  Copyright © 2020 Noemi Lemonnier. All rights reserved.
//

import SwiftUI

struct CardView: View {
    
    //Create a binding for the image name
    @Binding var symbol:String
    
    //Create a binding for the images' background
    @Binding var background:Color
    
    var body: some View {
        
        //here symbols[numbers[0]] must be changed
        Image(symbol)
        .resizable()
        .aspectRatio(1, contentMode: .fit)
        .background(background.opacity(0.5))
        .cornerRadius(20)
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        //Specify which symbol to display
        CardView(symbol: Binding.constant("donut"), background: Binding.constant(Color.green))
    }
}
