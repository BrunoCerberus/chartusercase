////
////  SpiderWebViewController.swift
////  ChartUserCase
////
////  Created by Bruno Lopes de Mello on 24/01/18.
////  Copyright © 2018 Bruno Lopes de Mello. All rights reserved.
////
//
//import UIKit
//import Charts
//
//class SpiderWebViewController: UIViewController, PieChartProtocol, ChartViewDelegate, UITableViewDelegate, UITableViewDataSource {
//    
//    func setup(pieChartView chartView: PieChartView) {
//        //
//    }
//    
//
//    
//    @IBOutlet weak var chartView: PieChartView!
//    @IBOutlet weak var tableView: UITableView!
//    
//    var consumos: [Consumo] = []
//    var eletronicos = PieChartDataEntry()
//    var alimentacao = PieChartDataEntry()
//    var transferencias = PieChartDataEntry()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//         self.tableView.isHidden = true
//        
//        chartView.delegate = self
//        
//        chartView.holeColor = .white
//        chartView.transparentCircleColor = NSUIColor.white.withAlphaComponent(0.43)
//        chartView.holeRadiusPercent = 0.58
//        chartView.rotationEnabled = false
//        chartView.highlightPerTapEnabled = true
//        
//        chartView.maxAngle = 180 // Half chart
//        chartView.rotationAngle = 180 // Rotate to make the half on the upper side
//        chartView.centerTextOffset = CGPoint(x: 0, y: -20)
//        
//        // entry label styling
//        chartView.entryLabelColor = .white
//        chartView.entryLabelFont = UIFont(name:"HelveticaNeue-Light", size:12)!
//        
//        
//        chartView.animate(xAxisDuration: 1.4, easingOption: .easeOutElastic)
//        self.setDataCount()
//    }
//    
//    
//    func setDataCount() {
//        
//        // define entries
//        self.eletronicos = PieChartDataEntry(value: 2500.00, label: Categories.Eletronicos.rawValue)
//        self.alimentacao = PieChartDataEntry(value: 350, label: Categories.Alimentacao.rawValue)
//        self.transferencias = PieChartDataEntry(value: 500, label: Categories.Transferencias.rawValue)
//        let operacoes: [PieChartDataEntry] = [eletronicos,alimentacao,transferencias]
//        
//        // define DataSet
//        let set = PieChartDataSet(values: operacoes, label: "teste")
//        
//        set.sliceSpace = 3
//        set.selectionShift = 5
//        set.colors = ChartColorTemplates.material()
//        
//        let data = PieChartData(dataSet: set)
//        
//        let pFormatter = NumberFormatter()
//        pFormatter.numberStyle = .percent
//        pFormatter.maximumFractionDigits = 1
//        pFormatter.multiplier = 1
//        pFormatter.percentSymbol = " %"
//        data.setValueFormatter(DefaultValueFormatter(formatter: pFormatter))
//        
//        data.setValueFont(UIFont(name: "Corbert-Bold", size: 11))
//        data.setValueTextColor(UIColor.black)
//        
//        chartView.data = data
//        
//        chartView.setNeedsDisplay()
//    }
//    
//     func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
//        
//        switch highlight.y {
//            
//        case alimentacao.value:
//            print(Categories.Alimentacao.rawValue)
//            self.tableView.isHidden = false
//            
//            self.consumos.removeAll()
//            
//            let c1 = Consumo(nome: "Nescal", preco: 8.50)
//            let c2 = Consumo(nome: "Carne", preco: 27.57)
//            let c3 = Consumo(nome: "feijao", preco: 12.00)
//            self.consumos.append(c1)
//            self.consumos.append(c2)
//            self.consumos.append(c3)
//            
//            self.tableView.reloadData()
//            
//            break
//            
//        case eletronicos.value:
//            print(Categories.Eletronicos.rawValue)
//            self.tableView.isHidden = false
//            
//            self.consumos.removeAll()
//            
//            self.consumos.append(Consumo(nome: "Controle", preco: 300))
//            self.consumos.append(Consumo(nome: "NoteBook", preco: 800))
//            
//            self.tableView.reloadData()
//            
//            
//            break
//            
//        case transferencias.value:
//            print(Categories.Transferencias.rawValue)
//            self.tableView.isHidden = false
//            
//            self.consumos.removeAll()
//            
//            self.consumos.append(Consumo(nome: "Pai", preco: 300))
//            self.consumos.append(Consumo(nome: "Sogro", preco: 260))
//            
//            self.tableView.reloadData()
//            
//            break
//            
//        default:
//            break
//        }
//    }
//    
//     func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.consumos.count
//    }
//
//     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseCell")
//        cell?.textLabel?.text = "Produto: " + self.consumos[indexPath.row].nome
//        cell?.detailTextLabel?.text = "Valor: R$ \(self.consumos[indexPath.row].preco!)"
//
//        return cell!
//    }
//
//     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 80
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//
//}

