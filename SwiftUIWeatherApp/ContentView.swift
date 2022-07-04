//
//  ContentView.swift
//  SwiftUIWeatherApp
//
//  Created by Ben Garrison on 7/3/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var weatherVM: WeatherViewModel
    
    init() {
        self.weatherVM = WeatherViewModel()
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("City:")
                .font(.custom("Helvetica", size: 25))
                .padding()
            
            TextField("Enter City Name", text: self.$weatherVM.cityName) {
                self.weatherVM.search()
            }.font(.custom("Helvetica", size: 50))
                .fixedSize()
            
            HStack {
            Text("Temperature: ")
                .font(.custom("Helvetica", size: 25))
            
            Text(self.weatherVM.temperature)
                .font(.custom("Helvetica", size: 40))
                .foregroundColor(.mint)
            }
            .padding()
            
            HStack {
            Text("Humidity: ")
                .font(.custom("Helvetica", size: 25))
            
            Text(self.weatherVM.humidity)
                .font(.custom("Helvetica", size: 40))
                .foregroundColor(.mint)
            }
            .padding()

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
