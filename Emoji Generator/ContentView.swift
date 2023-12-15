//Marco Quintero CSE 310
//Emoji Generator

import SwiftUI

// This enum represents the different emojis we can display.
enum Emoji: String, CaseIterable {
    case cool = "😎"
    case incognito = "🥸"
    case fierce = "🐯"
    case clown = "🤡"
    
    // Here we're giving a friendly name to each emoji.
    var name: String {
        switch self {
        case .cool:
            return "Cool"
        case .incognito:
            return "Incognito"
        case .fierce:
            return "Fierce"
        case .clown:
            return "Clown"
        }
    }
}

// ContentView is our main view for the app.
struct ContentView: View {
    // This state variable keeps track of the currently selected emoji.
    @State private var selectedEmoji: Emoji = .cool
    
    var body: some View {
        // NavigationStack allows for navigation between different views.
        NavigationStack {
            // VStack arranges views vertically.
            VStack {
                // Displays the selected emoji in a large font.
                Text("Selected Emoji: \(selectedEmoji.rawValue)")
                    .font(.largeTitle)
                
                // Shows the name of the selected emoji.
                Text("Name: \(selectedEmoji.name)")
                    .font(.title2)
                    .padding()
                
                // This picker allows the user to select an emoji.
                Picker("Select Emoji", selection: $selectedEmoji) {
                    // Loops through all the emoji cases to create picker items.
                    ForEach(Emoji.allCases, id: \.self) { emoji in
                        HStack {
                            Text(emoji.rawValue)
                            Text(emoji.name)
                        }
                        .tag(emoji) // Tags each picker item with its corresponding emoji.
                    }
                }
                .pickerStyle(.wheel) // The style of the picker.
                .padding()
                
                // A button to generate a random emoji selection.
                Button("Generate Random Emoji") {
                    selectedEmoji = Emoji.allCases.randomElement() ?? .cool
                }
                .padding()
                .buttonStyle(.borderedProminent) // The style of the button.
            }
            .navigationTitle("Emoji Generator") // Title of the navigation bar.
            .padding()
        }
    }
}

// This struct provides a preview of the ContentView in Xcode's preview pane.
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

