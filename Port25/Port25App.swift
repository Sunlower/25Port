//
//  Port25App.swift
//  Port25
//
//  Created by Ieda Xavier on 23/01/25.
//


import SwiftUI

@main
struct Port25App: App {

    var body: some Scene {
        WindowGroup {
            GeometryReader { geometry in
                NavigationView {
                    ContentView()
                        .overlay {
                            ZStack {
                                Image("bg")
                                    .resizable()
                                    .scaledToFill()

                                Image("goodBob")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: geometry.size.height * 0.3)
                                    .overlay {
                                        Text("Please, prefer use this application on landscape orientation for a better experience!")
                                            .font(.system(size: 28,
                                                          weight: .bold,
                                                          design: .rounded))
                                            .foregroundStyle(Color.init(red: 32/255,
                                                                        green: 49/255,
                                                                        blue: 55/255))
                                            .multilineTextAlignment(.center)
                                    }


                            }
                            .opacity(geometry.size.width < geometry.size.height ? 1 : 0)
                        }

                }
                .navigationViewStyle(.stack)
                .environment(\.mainWindowSize, geometry.size)
            }
        }
    }
}

private struct MainWindowSizeKey: EnvironmentKey {
    static let defaultValue: CGSize = .zero
}

extension EnvironmentValues {
    var mainWindowSize: CGSize {
        get { self[MainWindowSizeKey.self] }
        set { self[MainWindowSizeKey.self] = newValue }
    }
}
