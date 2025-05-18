//
//  TilePreviewShape.swift
//

import SwiftUI

struct TilePreviewShape: Shape {
  func path(in rect: CGRect) -> Path {
    let cornerRadius: CGFloat = 27
    let cutoutWidthRatio: CGFloat = 0.75
    let cutoutHeight: CGFloat = 30
    let curveSpread: CGFloat = 50
    
    let cutoutWidth = rect.width * cutoutWidthRatio
    let cutoutStartX = rect.midX - cutoutWidth / 2
    let cutoutEndX = rect.midX + cutoutWidth / 2
    let cutoutTopY = rect.maxY - cutoutHeight
    
    var path = Path()
    
    path.move(to: CGPoint(x: rect.minX + cornerRadius, y: rect.maxY))
    
    path.addArc(center: CGPoint(x: rect.minX + cornerRadius, y: rect.maxY - cornerRadius),
                radius: cornerRadius,
                startAngle: .degrees(90),
                endAngle: .degrees(180),
                clockwise: false)
    
    path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + cornerRadius))
    
    path.addArc(center: CGPoint(x: rect.minX + cornerRadius, y: rect.minY + cornerRadius),
                radius: cornerRadius,
                startAngle: .degrees(180),
                endAngle: .degrees(270),
                clockwise: false)
    
    path.addLine(to: CGPoint(x: rect.maxX - cornerRadius, y: rect.minY))
    
    path.addArc(center: CGPoint(x: rect.maxX - cornerRadius, y: rect.minY + cornerRadius),
                radius: cornerRadius,
                startAngle: .degrees(270),
                endAngle: .degrees(0),
                clockwise: false)
    
    path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - cornerRadius))
    
    path.addArc(center: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY - cornerRadius),
                radius: cornerRadius,
                startAngle: .degrees(0),
                endAngle: .degrees(90),
                clockwise: false)
    
    path.addLine(to: CGPoint(x: cutoutEndX, y: rect.maxY))
    
    path.addCurve(to: CGPoint(x: cutoutEndX - curveSpread, y: cutoutTopY), control1: CGPoint(x: cutoutEndX - curveSpread/2, y: rect.maxY), control2: CGPoint(x: cutoutEndX - curveSpread/2, y: cutoutTopY))
    
    path.addLine(to: CGPoint(x: cutoutStartX + curveSpread, y: cutoutTopY))
    
    path.addCurve(to: CGPoint(x: cutoutStartX, y: rect.maxY), control1: CGPoint(x: cutoutStartX + curveSpread/2, y: cutoutTopY), control2: CGPoint(x: cutoutStartX + curveSpread/2, y: rect.maxY))
    
    path.closeSubpath()
    
    return path
  }
}
