import SwiftUI

struct EditMealSheet: View {

    @Environment(\.dismiss) var dismiss

    @State private var name = "Protein Shake"
    @State private var portion = "30"
    @State private var calories = "120"
    @State private var protein = "24"
    @State private var carbs = "3"
    @State private var fat = "1"

    var body: some View {

        NavigationStack {

            VStack(spacing: 16) {

                SnapTextField(title: "Food name", text: $name)
                SnapTextField(title: "Portion size", text: $portion)
                SnapTextField(title: "Calories", text: $calories)

                HStack {
                    SnapTextField(title: "Protein", text: $protein)
                    SnapTextField(title: "Carbs", text: $carbs)
                    SnapTextField(title: "Fat", text: $fat)
                }

                HStack(spacing: 12) {

                    PrimaryButton(title: "Update") {

                    }

                    SecondaryButton(title: "Cancel") {
                        dismiss()
                    }

                }

                Spacer()

            }
            .padding()
            .navigationTitle("Edit meal")
        }
    }
}

#Preview {
    EditMealSheet()
}
