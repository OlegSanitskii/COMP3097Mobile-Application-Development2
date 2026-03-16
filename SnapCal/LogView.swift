import SwiftUI
struct LogMealView: View {

    @State private var mealName = ""
    @State private var calories = ""

    var body: some View {
        VStack(spacing: 20) {

            Text("Log Meal")
                .font(.title)
                .fontWeight(.bold)

            TextField("Meal name", text: $mealName)
                .textFieldStyle(.roundedBorder)

            TextField("Calories", text: $calories)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)

            Button("Save Meal") {
                print("Meal saved")
            }
            .buttonStyle(.borderedProminent)

            Spacer()
        }
        .padding()
        .navigationTitle("Log Meal")
    }
}
