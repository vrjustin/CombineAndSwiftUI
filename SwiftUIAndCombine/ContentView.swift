//
//  ContentView.swift
//  SwiftUIAndCombine
//
//  Created by Justin Maronde on 9/6/24.
//

import SwiftUI
import Combine

class ContentViewModel: ObservableObject {
    
    @Published var value: Int = 0
    private var cancellable: AnyCancellable?
    
    init() {
        let publisher = Timer.publish(every: 1.0, on: .main, in: .default).autoconnect().map {
            _ in self.value + 1
        }
        cancellable = publisher.assign(to: \.value, on: self)
    }
}

struct ContentView: View {
    
    @StateObject private var vm = ContentViewModel()
    
    var body: some View {
        VStack {
            Text("\(vm.value)").font(.largeTitle)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
