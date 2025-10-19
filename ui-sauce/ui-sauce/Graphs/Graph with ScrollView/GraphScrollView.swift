//
//  GraphView.swift
//  ui-sauce
//
//  Created by Madison Adams on 10/15/25.
//

import SwiftUI



struct GraphScrollView: View {

    // hardcoded values - sequential June dates with times
    let dateTimeData = [
        ("06/01", "8:30am"),
        ("06/03", "10:15am"),
        ("06/05", "2:45pm"),
        ("06/08", "9:20am"),
        ("06/10", "11:30am"),
        ("06/12", "10:15am"),
        ("06/15", "3:15pm"),
        ("06/18", "8:45am")
    ]
    let values = [5, 10, 3, 7, 4, 9, 10]
    let maxValue = 10
    
    var body: some View {
        VStack(spacing: 20) {
            // White card containing both the header graph and ScrollView
            VStack(spacing: 0) {
                // Header
                VStack(spacing: 4) {
                    Text("Measurement View")
                        .font(.inter(18, weight: .bold))
                        .foregroundStyle(Color(.black))
                    
                    Text("Patient Vitals Trends")
                        .font(.inter(15, weight: .light))
                        .foregroundStyle(Color(.gray))
                }
                .padding(.top, 20)
                .padding(.bottom, 25)

                // Date and Time Labels Band
                VStack{
                    GeometryReader { geometry in
                        let width = geometry.size.width
                        let maxDateCount = 8
                        let pointSpacing = width / CGFloat(maxDateCount - 1)

                        ForEach(0..<dateTimeData.count, id: \.self) { index in
                            let x = CGFloat(index) * pointSpacing

                            VStack(spacing: 2) {
                                Text(dateTimeData[index].0)
                                    .font(.inter(12, weight: .medium))
                                    .foregroundStyle(Color(.black))
                                Text(dateTimeData[index].1)
                                    .font(.inter(11, weight: .regular))
                                    .foregroundStyle(Color(.gray))
                            }
                            .position(x: x, y: 15)
                        }
                    }
                    .frame(height: 30)


                }
                .padding(.leading, 35)
                .padding(.trailing, 35)
                .padding(.bottom, 16)

                // Light Divider
                Rectangle()
                    .fill(Color(.systemGray5))
                    .frame(height: 1)

                // ScrollView with VitalsTrendsCells
                ScrollView {
                    VStack(spacing: 0) {
                        MeasurementCellView(
                            title: "Heart Rate",
                            value: "74",
                            unit: "bpm",
                            values: [72, 75, 70, 68, 73, 76, 71, 74],
                            dateTimeData: dateTimeData,
                            isInRange: true
                        )
                        
                        Divider()
                            .frame(height: 1)
                            .background(Color(.systemGray5))
                        
                        MeasurementCellView(
                            title: "Blood Pressure",
                            value: "119",
                            unit: "mmHg",
                            values: [120, 118, 122, 125, 121, 117, 123, 119],
                            dateTimeData: dateTimeData,
                            isInRange: true
                        )
                        
                        Divider()
                            .frame(height: 1)
                            .background(Color(.systemGray5))
                        
                        MeasurementCellView(
                            title: "Temperature",
                            value: "99.3",
                            unit: "°F",
                            values: [100.2, 99.1, 98.6, 98.8, 99.5, 98.9, 99.7, 99.3],
                            dateTimeData: dateTimeData,
                            isInRange: false
                        )
                        
                        Divider()
                            .frame(height: 1)
                            .background(Color(.systemGray5))
                        
                        MeasurementCellView(
                            title: "Oxygen Saturation",
                            value: "97",
                            unit: "%",
                            values: [98, 97, 96, 99, 98, 95, 98, 97],
                            dateTimeData: dateTimeData,
                            isInRange: true
                        )
                    }
                }
            }
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
        }
        .padding()
        .padding(.horizontal, 16)
        .background(Color(.systemGray6))
    }
}


#Preview{
    GraphScrollView()
}


