//
//  ViewController.swift
//  ChartUserCase
//
//  Created by Bruno Lopes de Mello on 23/01/2018.
//  Copyright © 2018 Bruno Lopes de Mello. All rights reserved.
//

import UIKit
import Charts

enum Categories: String {
    case Alimentacao, Eletronicos, Transferencias
}

class ViewController: UIViewController, PieChartProtocol, ChartViewDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var chartView: PieChartView!
    
    var eletronicos = PieChartDataEntry()
    var alimentacao = PieChartDataEntry()
    var transferencias = PieChartDataEntry()
    var consumos: [Consumo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.isHidden = true
        self.chartInitialConfig()
        self.chartOptions()
        
    }
    
    
    /// Configuracao basica inicial
    private func chartInitialConfig() {
        
        self.chartView.delegate = self
        
         self.setDataCount()
    }
    
    
    /// Aqui sao definidas as configuraçoes iniciais baseadas no protocol
    private func chartOptions() {
        
        self.usePercentValuesEnabled(true)
        self.drawSlicesUnderHoleEnabled(true)
        self.holeRadiusPercent(0.25)
        self.transparentCircleRadiusPercent(0)
        self.chartDescription(false)
        self.chartOfSet(0, 0, 0, 0)
        self.drawCenterTextEnabled(false)
        self.drawHoleEnabled(true)
        self.rotationAngle(0)
        self.rotationEnabled(true)
        self.highlightPerTapEnabled(true)
        self.chartAnimation(2.5, .easeOutBack)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// responsible for take data from a source and feed the PieChart
    func setDataCount() {
        
        // define entries
        // Cada entry é o valor gasto para essa entry(categoria)
        self.eletronicos = PieChartDataEntry(value: 2500.00, label: Categories.Eletronicos.rawValue)
        self.alimentacao = PieChartDataEntry(value: 350, label: Categories.Alimentacao.rawValue)
        self.transferencias = PieChartDataEntry(value: 500, label: Categories.Transferencias.rawValue)
        let operacoes: [PieChartDataEntry] = [eletronicos,alimentacao,transferencias]
        
        // define DataSet
        let set = PieChartDataSet(values: operacoes, label: "teste")
        
        //Define se vai usar icone ou nao
        set.drawIconsEnabled = false
        
        //Define o espaçamento entre as fatias
        set.sliceSpace = 5
        
        // Defined at least 7 groups
        //        set.colors = [UIColor.green, UIColor.gray, UIColor.red, UIColor.brown,
        //                        UIColor.cyan, UIColor.darkGray, UIColor.yellow]
        
        //random colors
        set.colors = ChartColorTemplates.material()
        
        
        let data = PieChartData(dataSet: set)
        
        let pFormatter = NumberFormatter()
        pFormatter.numberStyle = .percent
        pFormatter.maximumFractionDigits = 1
        pFormatter.multiplier = 1
        pFormatter.percentSymbol = " %"
        data.setValueFormatter(DefaultValueFormatter(formatter: pFormatter))
        
        data.setValueFont(UIFont(name: "Corbert-Bold", size: 11))
        data.setValueTextColor(.black)
        
        chartView.data = data
        chartView.highlightValues(nil)
        
        
    }
    
    
    /// Executes everytime when a PieChar is clicked
    ///
    /// - Parameters:
    ///   - chartView: chart itself
    ///   - entry: data that comes from other source
    ///   - highlight: used for get some info from chosen chart
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        
        switch highlight.y {
            
        case alimentacao.value:
            print(Categories.Alimentacao.rawValue)
            self.tableView.isHidden = false
            
            self.consumos.removeAll()
            
            let c1 = Consumo(nome: "Nescal", preco: 8.50)
            let c2 = Consumo(nome: "Carne", preco: 27.57)
            let c3 = Consumo(nome: "feijao", preco: 12.00)
            self.consumos.append(c1)
            self.consumos.append(c2)
            self.consumos.append(c3)
            
            self.tableView.reloadData()
            
            break
            
        case eletronicos.value:
            print(Categories.Eletronicos.rawValue)
            self.tableView.isHidden = false
            
            self.consumos.removeAll()
            
            self.consumos.append(Consumo(nome: "Controle", preco: 300))
            self.consumos.append(Consumo(nome: "NoteBook", preco: 800))
            
            self.tableView.reloadData()
            
            
            break
            
        case transferencias.value:
            print(Categories.Transferencias.rawValue)
            self.tableView.isHidden = false
            
            self.consumos.removeAll()
            
            self.consumos.append(Consumo(nome: "Pai", preco: 300))
            self.consumos.append(Consumo(nome: "Sogro", preco: 260))
            
            self.tableView.reloadData()
            
            break
            
        default:
            break
        }
    }
    
     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.consumos.count
    }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseCell")
        cell?.textLabel?.text = "Produto: " + self.consumos[indexPath.row].nome
        cell?.detailTextLabel?.text = "Valor: R$ \(self.consumos[indexPath.row].preco!)"

        return cell!
    }

     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

}



// MARK: - Operacoes de protocol sao realizadas nessa extension
extension ViewController {
    
    
    func usePercentValuesEnabled( _ value: Bool) {
        self.chartView.usePercentValuesEnabled = value
    }
    
    func drawSlicesUnderHoleEnabled( _ value: Bool) {
        self.chartView.drawSlicesUnderHoleEnabled = value
    }
    
    func holeRadiusPercent( _ value: Float) {
        self.chartView.holeRadiusPercent = CGFloat(value)
    }
    
    func transparentCircleRadiusPercent( _ value: Float) {
        self.chartView.transparentCircleRadiusPercent = CGFloat(value)
    }
    
    func chartDescription( _ value: Bool) {
        self.chartView.chartDescription?.enabled = value
    }
    
    func chartOfSet( _ ofSetLeft: Int, _ ofSetRight: Int, _ ofSetTop: Int, _ ofSetBottom: Int) {
        self.chartView.setExtraOffsets(left: CGFloat(ofSetLeft), top: CGFloat(ofSetTop), right: CGFloat(ofSetRight), bottom: CGFloat(ofSetBottom))
    }
    
    func drawCenterTextEnabled( _ value: Bool) {
        
        let paragraphStyle = NSParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
        paragraphStyle.lineBreakMode = .byTruncatingTail
        paragraphStyle.alignment = .center
        
        let centerText = NSMutableAttributedString(string: "Charts\nby Daniel Cohen Gindi")
        centerText.setAttributes([.font : UIFont(name: "HelveticaNeue-Light", size: 13)!,
                                  .paragraphStyle : paragraphStyle], range: NSRange(location: 0, length: centerText.length))
        centerText.addAttributes([.font : UIFont(name: "HelveticaNeue-Light", size: 11)!,
                                  .foregroundColor : UIColor.gray], range: NSRange(location: 10, length: centerText.length - 10))
        centerText.addAttributes([.font : UIFont(name: "HelveticaNeue-Light", size: 11)!,
                                  .foregroundColor : UIColor(red: 51/255, green: 181/255, blue: 229/255, alpha: 1)], range: NSRange(location: centerText.length - 19, length: 19))
        self.chartView.centerAttributedText = centerText;
        
        self.chartView.drawCenterTextEnabled = value
        
        
    }
    
    func drawHoleEnabled( _ value: Bool) {
        self.chartView.drawHoleEnabled = value
    }
    
    func rotationAngle( _ value: Int) {
        self.chartView.rotationAngle = CGFloat(value)
    }
    
    func rotationEnabled( _ value: Bool) {
        self.chartView.rotationEnabled = value
    }
    
    func highlightPerTapEnabled( _ value: Bool) {
        self.chartView.highlightPerTapEnabled = value
    }
    
    func chartAnimation(_ timeInterval: TimeInterval, _ animation: ChartEasingOption) {
        self.chartView.animate(xAxisDuration: timeInterval, easingOption: animation)
    }
    
}

