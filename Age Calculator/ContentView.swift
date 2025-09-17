//
//  ContentView.swift
//  Age Calculator
//
//  Created by Cal on 2025/09/17.
//

import SwiftUI

struct ContentView: View {
    
    @State var dateOfBirth: Date = Date()
    var today:Date = Date()
    @State var age: Double = 0
    
    var body: some View {
        VStack {
            HStack{
                Image(systemName: "birthday.cake.fill")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                    .font(.title)
                Text("Age Calculator")
                    .font(.title)
            }.padding()
            HStack{
                Text("Enter Date of Birth:").font(.title2)
            }.padding()
            HStack{
                DatePicker("",
                           selection: $dateOfBirth,
                           displayedComponents: [.date]).datePickerStyle(.wheel).padding()
            }
        }
        HStack{
            Text("Your age is: \(calculateAge(secondsSinceDate: today.timeIntervalSince(dateOfBirth)))")
        }.padding()
        if today.timeIntervalSince(dateOfBirth) < 0{
            HStack{
                Text("Please enter a date in the past!").font(.callout)
            }
        }
        
    }
    
    func calculateAge(secondsSinceDate:Double) -> Int{
        let years:Int = Int(floor(secondsSinceDate / 31556952))
        if years < 1{
            return 0
        }else{
            return years
        }
    }
}

#Preview {
    ContentView()
}
