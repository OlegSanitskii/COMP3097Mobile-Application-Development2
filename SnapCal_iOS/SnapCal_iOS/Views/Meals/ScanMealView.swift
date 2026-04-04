import SwiftUI

struct ScanMealView: View {

    var body: some View {

        ZStack {

            SnapCalTheme.background
                .ignoresSafeArea()

            VStack(alignment: .leading, spacing: 24) {

                Text("Scan Product / Receipt")
                    .font(.title2)
                    .fontWeight(.semibold)

                cameraFrame

                captureButton

                detectedItem

                Spacer()
            }
            .padding(.horizontal, SnapCalTheme.screenHorizontalPadding)

        }
    }

    private var cameraFrame: some View {

        ZStack {

            RoundedRectangle(cornerRadius: 20)
                .fill(Color.black.opacity(0.85))
                .frame(height: 220)

            VStack(spacing: 6) {

                Text("Align label inside the frame")
                Text("Good lighting improves accuracy")

            }
            .foregroundStyle(.white.opacity(0.8))
        }
    }

    private var captureButton: some View {

        HStack {

            Spacer()

            Button {

            } label: {

                HStack {

                    Image(systemName: "camera")

                    Text("Capture")
                        .fontWeight(.semibold)

                }
                .padding(.horizontal, 24)
                .padding(.vertical, 10)
                .background(SnapCalTheme.primary)
                .foregroundStyle(.white)
                .clipShape(Capsule())

            }

            Spacer()

        }
    }

    private var detectedItem: some View {

        VStack(alignment: .leading, spacing: 12) {

            Text("Detected Item")
                .fontWeight(.semibold)

            Text("Greek Yogurt 2% (170 g)")
                .font(.headline)

            HStack {

                macro("Calories", "130 kcal")
                macro("Protein", "12 g")
                macro("Carbs", "5 g")
                macro("Fat", "4 g")

            }

            HStack(spacing: 12) {

                SecondaryButton(title: "Edit") {}

                PrimaryButton(title: "Save") {}

            }

        }
    }

    private func macro(_ title: String, _ value: String) -> some View {

        VStack {

            Text(title)
                .font(.caption)

            Text(value)
                .fontWeight(.semibold)

        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ScanMealView()
}
