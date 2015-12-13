//
//  ViewController.swift
//  pizza
//
//  Created by Angel Agustín Martínez on 11/12/15.
//  Copyright © 2015 Angel Agustín Martínez. All rights reserved.
//

import UIKit

class ViewController: UIViewController,
    UIPickerViewDataSource,
    UIPickerViewDelegate,
    UIPickerViewAccessibilityDelegate {

    enum ComponentesEnPicker: Int {
        case tamaños = 0
        
        static var count: Int {
            return ComponentesEnPicker.tamaños.rawValue + 1
        }
    }
    
    enum Tamaño: Int {
        case Chica = 0, Mediana, Grande
        
        init() {
            self = .Chica
        }
        
        static var count: Int {
            return Tamaño.Grande.rawValue + 1
        }
        
        func getEtiqueta() -> String{
            var etiqueta = ""
            
            switch(self){
            case .Chica:
                etiqueta = "Chica"
            case .Mediana:
                etiqueta = "Mediana"
            case .Grande:
                etiqueta = "Grande"
            }
            
            return etiqueta
        }
        
        func getValor() -> Int {
            return self.rawValue
        }
    }
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var imagenPizza: UIImageView!
    
    lazy var numeroDeValoresPorComponente: Int = Tamaño.count
    var tamañoElegido : Tamaño = .Chica
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configurePickerView()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func configurePickerView() {
        // Show that a given row is selected. This is off by default.
        pickerView.showsSelectionIndicator = true
        
        // Set the default selected rows.
        let filas: [ComponentesEnPicker: Int] = [.tamaños: 1]
        
        for (scrollTamaños, filaSeleccionada) in filas {
            /*
            Note that the delegate method on `UIPickerViewDelegate` is not triggered
            when manually calling `selectRow(_:inComponent:animated:)`. To do
            this, we fire off delegate method manually.
            */
            pickerView.selectRow(filaSeleccionada, inComponent: scrollTamaños.rawValue, animated: true)
        }
    }

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return ComponentesEnPicker.count
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numeroDeValoresPorComponente
    }
    
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        
        var title = NSMutableAttributedString(string: "")
        switch (row ) {
        case 0:
            tamañoElegido = .Chica
            imagenPizza.image = UIImage(named: "pizzaChica")            
            break
        case 1:
            tamañoElegido = .Mediana
            imagenPizza.image = UIImage(named: "pizzaMediana")
            break
        default:
            tamañoElegido = .Grande
            imagenPizza.image = UIImage(named: "pizzaGrande")
        }
        
        title = NSMutableAttributedString(string: tamañoElegido.getEtiqueta() )
        
        return title
    }
    
    func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage {
        
        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        UIGraphicsBeginImageContext(CGSizeMake(newWidth, newHeight))
        image.drawInRect(CGRectMake(0, 0, newWidth, newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let siguienteVista = segue.destinationViewController as! VistaMasa
        siguienteVista.tamañoElegido = self.tamañoElegido.getEtiqueta()
    }
}

