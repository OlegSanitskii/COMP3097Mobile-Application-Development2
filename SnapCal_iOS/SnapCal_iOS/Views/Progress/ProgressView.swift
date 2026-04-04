import SwiftUI

struct ProgressView: View {

    var body: some View {

        ZStack {

            SnapCalTheme.background
                .ignoresSafeArea()

            ScrollView {

                VStack(alignment: .leading, spacing: 24) {

                    Text("Progress")
                        .font(.title2)
                        .fontWeight(.semibold)

                    summaryCards

                    weeklyChart

                    todayMeals

                }
                .padding(.horizontal, SnapCalTheme.screenHorizontalPadding)

            }

        }
    }

    private var summaryCards: some View {

        HStack {

            card("Calories", "1335 kcal")
            card("Protein", "105 g")
            card("Carbs", "115 g")
            card("Fat", "46 g")

        }
    }

    private func card(_ title: String, _ value: String) -> some View {

        SnapCard {

            VStack {

                Text(title)
                    .font(.caption)

                Text(value)
                    .fontWeight(.bold)

            }

        }
    }

    private var weeklyChart: some View {

        VStack(alignment: .leading) {

            Text("Calories In (weekly)")

            RoundedRectangle(cornerRadius: 12)
                .fill(SnapCalTheme.surface)
                .frame(height: 180)

        }
    }

    private var todayMeals: some View {

        VStack(alignment: .leading, spacing: 12) {

            Text("Today's Meals")
                .fontWeight(.semibold)

            SnapCard {

                HStack {

                    VStack(alignment: .leading) {

                        Text("Protein Shake")
                            .fontWeight(.semibold)

                        Text("120 kcal • P 24 • C 3 • F 1")
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
    ProgressView()
}
