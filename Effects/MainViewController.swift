//
//  MainViewController.swift
//  Effects
//
//  Created by Denes Csizmadia on 2015. 09. 15..
//  Copyright (c) 2015. Denes Csizmadia. All rights reserved.
//

import UIKit


class MainViewController: UIViewController {

    @IBOutlet weak var MainContainer: UIView!
    
     let mainStoryboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
         var popViewController : PopUpViewControllerSwift!
    
        let audioProcessor = AudioProcessor()
    
        var factoryNumber = 1
    
        var effectNumber = 1
    
        let viewControllerFactory1 = ViewControllerFactory1.sharedFactory1
        let viewControllerFactory2 = ViewControllerFactory2.sharedFactory2
        let viewControllerFactory3 = ViewControllerFactory3.sharedFactory3
    
    
    @IBOutlet weak var SelectorContainer: UIView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        freshEffect()
        audioProcessor.start()
        
       NSNotificationCenter.defaultCenter().addObserver(self, selector: "switchEffect:", name:mySpecialNotificationKey, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "preset1ButtonPressed", name:Preset1ButtonKey, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "preset2ButtonPressed", name:Preset2ButtonKey, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "preset3ButtonPressed", name:Preset3ButtonKey, object: nil)

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "PopUp", name: "PopUp", object: nil)

        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func selectViewController (VC: String) {
        let vc = mainStoryboard.instantiateViewControllerWithIdentifier(VC)
        
        self.addChildViewController(vc)
        vc.view.frame = self.MainContainer.bounds
        self.MainContainer.addSubview(vc.view)
        vc.didMoveToParentViewController(self)
        
        
   
    }
    
    func switchEffect(notification:NSNotification){
    //    print(notification.userInfo)
        self.effectNumber = notification.userInfo!["VC"] as! Int
        freshEffect()
        }
    
    
    
    
    func freshEffect(){
        switch self.effectNumber {
        case 1:                                     //Effect1
            switch self.factoryNumber{
            case 1: let vc = self.viewControllerFactory1.effect1ViewController
                    addChild(vc)
            case 2: let vc = self.viewControllerFactory2.effect1ViewController
                    addChild(vc)
            case 3: let vc = self.viewControllerFactory3.effect1ViewController
            addChild(vc)
            default: break
            }
        case 2:                                     //Effect2
            switch self.factoryNumber{
            case 1: let vc = self.viewControllerFactory1.effect2ViewController
            addChild(vc)
            case 2: let vc = self.viewControllerFactory2.effect2ViewController
            addChild(vc)
            case 3: let vc = self.viewControllerFactory3.effect2ViewController
            addChild(vc)
            default: break
            }
        case 3:                                     //Effect2
            switch self.factoryNumber{
            case 1: let vc = self.viewControllerFactory1.effect3ViewController
            addChild(vc)
            case 2: let vc = self.viewControllerFactory2.effect3ViewController
            addChild(vc)
            case 3: let vc = self.viewControllerFactory3.effect3ViewController
            addChild(vc)
            default: break
            }
        case 4:                                     //Effect2
            switch self.factoryNumber{
            case 1: let vc = self.viewControllerFactory1.effect4ViewController
            addChild(vc)
            case 2: let vc = self.viewControllerFactory2.effect4ViewController
            addChild(vc)
            case 3: let vc = self.viewControllerFactory3.effect4ViewController
            addChild(vc)
            default: break
            }
        case 5:                                     //Effect2
            switch self.factoryNumber{
            case 1: let vc = self.viewControllerFactory1.effect5ViewController
            addChild(vc)
            case 2: let vc = self.viewControllerFactory2.effect5ViewController
            addChild(vc)
            case 3: let vc = self.viewControllerFactory3.effect5ViewController
            addChild(vc)
            default: break
            }
        case 6:                                     //Effect2
            switch self.factoryNumber{
            case 1: let vc = self.viewControllerFactory1.effect6ViewController
            addChild(vc)
            case 2: let vc = self.viewControllerFactory2.effect6ViewController
            addChild(vc)
            case 3: let vc = self.viewControllerFactory3.effect6ViewController
            addChild(vc)
            default: break
            }
        case 7:                                     //Effect2
           let vc = self.viewControllerFactory1.effect7ViewController
           addChild(vc)
        default: break
        }
    }
    
        
    
    
    
    
    
    
    
    // selectViewController(notification.userInfo!["VC"] as! String)
    
  
    
    
    
    func preset1ButtonPressed(){
        self.factoryNumber = 1
        freshEffect()
     //   print("preset1ButtonPressed")
    }

    
    func preset2ButtonPressed(){
        self.factoryNumber = 2
        freshEffect()
     //   print("preset2ButtonPressed")
    }
    
    func preset3ButtonPressed(){
        self.factoryNumber = 3
        freshEffect()
     //   print("preset3ButtonPressed")
    }
    
    
    func addChild(vc: UIViewController) {
        self.addChildViewController(vc)
        vc.view.frame = self.MainContainer.bounds
        self.MainContainer.addSubview(vc.view)
        vc.didMoveToParentViewController(self)
    }
    
    
    func PopUp() {
        self.popViewController = PopUpViewControllerSwift(nibName: "PopUpViewController_iPad", bundle: nil)
        self.popViewController.showInView(self.view, animated: true)
    }
    
}

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

