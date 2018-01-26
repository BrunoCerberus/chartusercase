//
//  PieChartProtocol.swift
//
//  Created by Bruno Lopes de Mello on 23/01/2018.
//  Copyright © 2018 Bruno Lopes de Mello. All rights reserved.
//

import UIKit
import Charts



/// Define os protocolos para o uso do PieChart
protocol PieChartProtocol {
    
    
    /// Define se os valores a serem exibidos estarao em percentagem
    ///
    /// - Parameter value: true para sim e false para nao
    func usePercentValuesEnabled( _ value : Bool)
    
    
    func drawSlicesUnderHoleEnabled( _ value: Bool)
    
    
    /// Define o radio do circulo
    ///
    /// - Parameter value: valor do raio a ser inserido
    func holeRadiusPercent( _ value: Float)
    
    
    /// Define o nivel de transparencia do circulo
    ///
    /// - Parameter value: Valor de 0.0 a 1
    func transparentCircleRadiusPercent( _ value: Float)
    
    
    func chartDescription( _ value: Bool)
    
    
    /// Define os espacamentos para as direcoes
    ///
    /// - Parameters:
    ///   - ofSetLeft: espacamento a esquerda
    ///   - ofSetRight: espacamento a direita
    ///   - ofSetTop: espacamento do topo
    ///   - ofSetBottom: espacamento da base
    func chartOfSet( _ ofSetLeft: Int, _ ofSetRight: Int, _ ofSetTop: Int, _ ofSetBottom: Int)
    
    
    /// Define se havera um texto no centro ou nao
    ///
    /// - Parameter value: true para sim e false para nao
    func drawCenterTextEnabled( _ value: Bool)
    
    
    /// Define se vai ter o buraco no meio do circulo
    ///
    /// - Parameter value: true para sim e false para nao
    func drawHoleEnabled( _ value: Bool)
    
    
    /// Angulo de rotacao
    ///
    /// - Parameter value:
    func rotationAngle( _ value: Int)
    
    
    /// Habilita a rotacao como iteracao
    ///
    /// - Parameter value: true para sim e false para nao
    func rotationEnabled( _ value: Bool)
    
    
    /// Define se as fatias do circulo sao iterativos
    ///
    /// - Parameter value:
    func highlightPerTapEnabled( _ value: Bool)
    
    
    /// Define o intervalo e o tipo da animacao
    ///
    /// - Parameters:
    ///   - timeInterval: O valor é em segundos
    ///   - animation:
    func chartAnimation(_ timeInterval: TimeInterval,_ animation: ChartEasingOption)
  
}

