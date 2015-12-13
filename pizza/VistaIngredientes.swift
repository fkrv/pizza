//
//  VistaIngredientes.swift
//  pizza
//
//  Created by Angel Agustín Martínez on 12/12/15.
//  Copyright © 2015 Angel Agustín Martínez. All rights reserved.
//

import UIKit

class VistaIngredientes: UIViewController {

    @IBOutlet weak var jamon: UISwitch!
    @IBOutlet weak var pepperoni: UISwitch!
    @IBOutlet weak var salchicha: UISwitch!
    @IBOutlet weak var aceituna: UISwitch!
    @IBOutlet weak var cebolla: UISwitch!
    @IBOutlet weak var pimiento: UISwitch!
    @IBOutlet weak var piña: UISwitch!
    @IBOutlet weak var anchoa: UISwitch!
    @IBOutlet weak var confirmar: UIBarButtonItem!
    
    var tamañoElegido = "";
    var masaElegida = ""
    var quesoElegido = ""
    var ingredientesElegidos = ""
    
    enum EstadoSwitch {
        case on
        case off
    }
    
    var numeroDeIngredientes : Int = 0
    var switchJamon : EstadoSwitch = .off
    var switchPepperoni : EstadoSwitch = .off
    var switchSalchicha : EstadoSwitch = .off
    var switchAceituna : EstadoSwitch = .off
    var switchCebolla : EstadoSwitch = .off
    var switchPimiento : EstadoSwitch = .off
    var switchPiña : EstadoSwitch = .off
    var switchAnchoa : EstadoSwitch = .off
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureDefaultSwitch()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func configureDefaultSwitch() {
        /*jamon.setOn(false, animated: true)
        pepperoni.setOn(false, animated: true)
        salchicha.setOn(false, animated: true)
        aceituna.setOn(false, animated: true)
        cebolla.setOn(false, animated: true)
        pimiento.setOn(false, animated: true)
        piña.setOn(false, animated: true)
        anchoa.setOn(false, animated: true)*/
        
        jamon.addTarget(self, action: "jamonValueDidChange:", forControlEvents: .ValueChanged)
        pepperoni.addTarget(self, action: "pepperoniValueDidChange:", forControlEvents: .ValueChanged)
        salchicha.addTarget(self, action: "salchichaValueDidChange:", forControlEvents: .ValueChanged)
        aceituna.addTarget(self, action: "aceitunaValueDidChange:", forControlEvents: .ValueChanged)
        cebolla.addTarget(self, action: "cebollaValueDidChange:", forControlEvents: .ValueChanged)
        pimiento.addTarget(self, action: "pimientoValueDidChange:", forControlEvents: .ValueChanged)
        piña.addTarget(self, action: "piñaValueDidChange:", forControlEvents: .ValueChanged)
        anchoa.addTarget(self, action: "anchoaValueDidChange:", forControlEvents: .ValueChanged)
    }
    
    func jamonValueDidChange(aSwitch: UISwitch) {
        switch(switchJamon) {
        case .on:
            numeroDeIngredientes--
            switchJamon = .off
        case .off:
            numeroDeIngredientes++
            switchJamon = .on
        }
        habilitaOdeshabilitaConfirmar()
    }
    
    func pepperoniValueDidChange(aSwitch: UISwitch) {
        switch(switchPepperoni) {
        case .on:
            numeroDeIngredientes--
            switchPepperoni = .off
        case .off:
            numeroDeIngredientes++
            switchPepperoni = .on
        }
        habilitaOdeshabilitaConfirmar()
    }
    
    func salchichaValueDidChange(aSwitch: UISwitch) {
        switch(switchSalchicha) {
        case .on:
            numeroDeIngredientes--
            switchSalchicha = .off
        case .off:
            numeroDeIngredientes++
            switchSalchicha = .on
        }
        habilitaOdeshabilitaConfirmar()
    }
    
    func aceitunaValueDidChange(aSwitch: UISwitch) {
        switch(switchAceituna) {
        case .on:
            numeroDeIngredientes--
            switchAceituna = .off
        case .off:
            numeroDeIngredientes++
            switchAceituna = .on
        }
        habilitaOdeshabilitaConfirmar()
    }
    
    func cebollaValueDidChange(aSwitch: UISwitch) {
        switch(switchCebolla) {
        case .on:
            numeroDeIngredientes--
            switchCebolla = .off
        case .off:
            numeroDeIngredientes++
            switchCebolla = .on
        }
        habilitaOdeshabilitaConfirmar()
    }
    
    func pimientoValueDidChange(aSwitch: UISwitch) {
        switch(switchPimiento) {
        case .on:
            numeroDeIngredientes--
            switchPimiento = .off
        case .off:
            numeroDeIngredientes++
            switchPimiento = .on
        }
        habilitaOdeshabilitaConfirmar()
    }
    
    func piñaValueDidChange(aSwitch: UISwitch) {
        switch(switchPiña) {
        case .on:
            numeroDeIngredientes--
            switchPiña = .off
        case .off:
            numeroDeIngredientes++
            switchPiña = .on
        }
        habilitaOdeshabilitaConfirmar()
    }
    
    func anchoaValueDidChange(aSwitch: UISwitch) {
        switch(switchAnchoa) {
        case .on:
            numeroDeIngredientes--
            switchAnchoa = .off
        case .off:
            numeroDeIngredientes++
            switchAnchoa = .on
        }
        habilitaOdeshabilitaConfirmar()
    }
    
    func habilitaOdeshabilitaConfirmar() {
        if(numeroDeIngredientes > 0 && numeroDeIngredientes < 6) {
            confirmar.enabled = true
        } else {
            confirmar.enabled = false
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let siguienteVista = segue.destinationViewController as! VistaConfirmacion
        siguienteVista.tamañoElegido = self.tamañoElegido
        siguienteVista.masaElegida = self.masaElegida
        siguienteVista.quesoElegido = self.quesoElegido
        
        var ingredientesFinales = ""
        if(switchJamon == .on){
            ingredientesFinales += " -Jamón"
        }
        if(switchPepperoni == .on){
            ingredientesFinales += " -Pepperoni"
        }
        if(switchSalchicha == .on){
            ingredientesFinales += " -Salchicha"
        }
        if(switchAceituna == .on){
            ingredientesFinales += " -Aceituna"
        }
        if(switchCebolla == .on){
            ingredientesFinales += " -Cebolla"
        }
        if(switchPimiento == .on){
            ingredientesFinales += " -Pimiento"
        }
        if(switchPiña == .on){
            ingredientesFinales += " -Piña"
        }
        if(switchAnchoa == .on){
            ingredientesFinales += " -Anchoa"
        }
        ingredientesElegidos = ingredientesFinales
        
        siguienteVista.ingredientesElegidos = self.ingredientesElegidos
    }
    
    
}
