import SwiftUI

struct ManualMealView: View {

    @State private var name = ""
    @State private var portion = ""
    @State private var calories = ""
    @State private var protein = ""
    @State private var carbs = ""
    @State private var fat = ""

    var body: some View {

        ZStack {

            SnapCalTheme.background
                .ignoresSafeArea()

            ScrollView {

                VStack(alignment: .leading, spacing: 20) {

                    Text("Add Meal Manually")
                        .font(.title2)
                        .fontWeight(.semibold)

                    SnapTextField(title: "Food name", text: $name)
                    SnapTextField(title: "Portion size (g)", text: $portion)
                    SnapTextField(title: "Calories (kcal)", text: $calories)

                    HStack {
                        SnapTextField(title: "Protein (g)", text: $protein)
                        SnapTextField(title: "Carbs (g)", text: $carbs)
                        SnapTextField(title: "Fat (g)", text: $fat)
                    }

                    PrimaryButton(title: "Save Meal") {

                    }

                    Divider()

                    recentMeals

                }
                .padding(.horizontal, SnapCalTheme.screenHorizontalPadding)
            }
        }
    }

    private var recentMeals: some View {

        VStack(alignment: .leading, spacing: 12) {

            Text("Recent meals")
                .fontWeight(.semibold)

            SnapCard {

                HStack {

                    VStack(alignment: .leading) {

                        Text("Protein Shake")
                            .fontWeight(.semibold)

                        Text("120 kcal • P 24 • C 3 • F 1")
                            .font(.caption)

                        Text("Snack / Post-workout")
                            .font(.caption)

                    }

                    Spacer()

                    Image(systemName: "pencil")
                    Image(systemName: "trash")

                }

            }

        }
    }
}

#Preview {
    ManualMealView()
}
