//
//  TigreBusRutaContaduriaBiologicas.swift
//  Proyecto IOS Lab - Tigre Bus
//
//  Created by iOSLabMini05 on 19/05/22.
//

import UIKit
import FirebaseDatabase

class TigreBusRutaContaduriaBiologicas: UIViewController {
    
    var ref: DatabaseReference! = Database.database().reference().child("Rutas").child("Ruta 2")
    
    var contadorParada: Int = 0

    @IBOutlet weak var botonParada1: UIButton!
    @IBOutlet weak var botonParada2: UIButton!
    @IBOutlet weak var botonParada3: UIButton!
    @IBOutlet weak var botonParada4: UIButton!
    @IBOutlet weak var botonParada5: UIButton!
    @IBOutlet weak var botonParada6: UIButton!
    
    var ruta1: Bool = false
    var ruta2: Bool = false
    var ruta3: Bool = false
    var ruta4: Bool = false
    var ruta5: Bool = false
    var ruta6: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        botonParada1.backgroundColor = UIColor.red
        botonParada2.backgroundColor = UIColor.red
        botonParada3.backgroundColor = UIColor.red
        botonParada4.backgroundColor = UIColor.red
        botonParada5.backgroundColor = UIColor.red
        botonParada6.backgroundColor = UIColor.red
        
        
        
        ref.observe(.value, with: {(snapshot) in
            if let diccionario = snapshot.value as? [String: Any]{
                let firabaseRuta1 = diccionario["Parada 1"] as! Bool
                let firebaseRuta2 = diccionario["Parada 2"] as! Bool
                let firebaseRuta3 = diccionario["Parada 3"] as! Bool
                let firebaseRuta4 = diccionario["Parada 4"] as! Bool
                let firebaseRuta5 = diccionario["Parada 5"] as! Bool
                let firebaseRuta6 = diccionario["Parada 6"] as! Bool
                let firebaseNumeroParada = diccionario["Numero Parada"] as! Int
                print("Firebase ruta \(firabaseRuta1)")
                self.contadorParada = firebaseNumeroParada
                self.ruta1 = firabaseRuta1
                self.ruta2 = firebaseRuta2
                self.ruta3 = firebaseRuta3
                self.ruta4 = firebaseRuta4
                self.ruta5 = firebaseRuta5
                self.ruta6 = firebaseRuta6
                if self.ruta1 == true {
                    self.botonParada1.backgroundColor =  UIColor.green
                }else{
                    if (self.contadorParada == 0){
                        self.botonParada1.backgroundColor = UIColor(red: 234/255.0, green: 226/255.0, blue: 2/255.0, alpha: 1)
                    }else{
                        self.botonParada1.backgroundColor = UIColor.red
                    }
                }
                if self.ruta2 == true{
                    self.botonParada2.backgroundColor = UIColor.green
                }else{
                    if (self.contadorParada+1) == 2 {
                        self.botonParada2.backgroundColor = UIColor(red: 234/255.0, green: 226/255.0, blue: 2/255.0, alpha: 1)
                    }else{
                        self.botonParada2.backgroundColor = UIColor.red
                    }
                }
                if self.ruta3 == true{
                    self.botonParada3.backgroundColor = UIColor.green
                }else{
                    if (self.contadorParada+1) == 3 {
                        self.botonParada3.backgroundColor = UIColor(red: 234/255.0, green: 226/255.0, blue: 2/255.0, alpha: 1)
                    }else{
                        self.botonParada3.backgroundColor = UIColor.red
                    }
                }
                if self.ruta4 == true{
                    self.botonParada4.backgroundColor = UIColor.green
                }else{
                    if (self.contadorParada+1) == 4 {
                        self.botonParada4.backgroundColor = UIColor(red: 234/255.0, green: 226/255.0, blue: 2/255.0, alpha: 1)
                    }else{
                        self.botonParada4.backgroundColor = UIColor.red
                    }
                }
                if self.ruta5 == true{
                    self.botonParada5.backgroundColor = UIColor.green
                }else{
                    if (self.contadorParada+1) == 5 {
                        self.botonParada5.backgroundColor = UIColor(red: 234/255.0, green: 226/255.0, blue: 2/255.0, alpha: 1)
                    }else{
                        self.botonParada5.backgroundColor = UIColor.red
                    }
                }
                if self.ruta6 == true{
                    self.botonParada6.backgroundColor = UIColor.green
                }else{
                    if (self.contadorParada+1) == 6 {
                        self.botonParada6.backgroundColor = UIColor(red: 234/255.0, green: 226/255.0, blue: 2/255.0, alpha: 1)
                    }else{
                        self.botonParada6.backgroundColor = UIColor.red
                    }
                }
                
            }
        
        // Do any additional setup after loading the view.
        })
                
                
        // Do any additional setup after loading the view.
    }
    
    func alerta(){
        let dialogMessage = UIAlertController(title: "Aviso", message: "El Tigre Bus se encuentra en esta parada o acaba de pasar por esta parada", preferredStyle: .alert)
         
         // Create OK button with action handler
         let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
             print("Ok button tapped")
          })
         
         //Add OK button to a dialog message
         dialogMessage.addAction(ok)
         // Present Alert to
         self.present(dialogMessage, animated: true, completion: nil)
        
    }
    
    func alerta2(){
        let dialogMessage = UIAlertController(title: "Aviso", message: "Esta es la siguiente parada del Tigre Bus", preferredStyle: .alert)
         
         // Create OK button with action handler
         let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
             print("Ok button tapped")
          })
         
         //Add OK button to a dialog message
         dialogMessage.addAction(ok)
         // Present Alert to
         self.present(dialogMessage, animated: true, completion: nil)
        
    }
    
    func alerta3(){
        let dialogMessage = UIAlertController(title: "Aviso", message: "El Tigre Bus no se encuentra en esta parada", preferredStyle: .alert)
         
         // Create OK button with action handler
         let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
             print("Ok button tapped")
          })
         
         //Add OK button to a dialog message
         dialogMessage.addAction(ok)
         // Present Alert to
         self.present(dialogMessage, animated: true, completion: nil)
        
    }
    
    func alerta4(){
        let dialogMessage = UIAlertController(title: "Información", message: "Significado de colores:\n1. Rojo: El Tigre Bus no esta ahi.\n2. Amarillo: Ruta siguiente del Tigre Bus.\n3. Verde: El Tigre Bus se encuentra ahi o acaba de pasar.", preferredStyle: .alert)
         
         // Create OK button with action handler
         let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
             print("Ok button tapped")
          })
         
         //Add OK button to a dialog message
         dialogMessage.addAction(ok)
         // Present Alert to
         self.present(dialogMessage, animated: true, completion: nil)
        
    }
    
    
    @IBAction func botonInfo(_ sender: UIButton) {
        alerta4()
    }
    
    @IBAction func mensajeParada1(_ sender: UIButton) {
        if self.ruta1 == true{
            alerta()
        }else{
            if contadorParada == 0 {
                alerta2()
            }else{
                alerta3()
            }
        }
    }
    
    @IBAction func mensajeParada2(_ sender: UIButton) {
        if self.ruta2 == true{
            alerta()
        }else{
            if (contadorParada+1) == 2{
                alerta2()
            }else{
                alerta3()
            }
        }
    }
    
    @IBAction func mensajeParada3(_ sender: UIButton) {
        if self.ruta3 == true{
            alerta()
        }else{
            if (contadorParada+1) == 3{
                alerta2()
            }else{
                alerta3()
            }
        }
    }
    
    @IBAction func mensajeParada4(_ sender: UIButton) {
        if self.ruta4 == true{
            alerta()
        }else{
            if (contadorParada+1) == 4{
                alerta2()
            }else{
                alerta3()
            }
        }
    }
    
    @IBAction func mensajeParada5(_ sender: UIButton) {
        if self.ruta5 == true{
            alerta()
        }else{
            if (contadorParada+1) == 5{
                alerta2()
            }else{
                alerta3()
            }
        }
    }
    
    @IBAction func mensajeParada6(_ sender: UIButton) {
        if self.ruta6 == true{
            alerta()
        }else{
            if (contadorParada+1) == 6{
                alerta2()
            }else{
                alerta3()
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
