import UIKit
import FloatingPanel


class ViewController: UIViewController,FloatingPanelControllerDelegate, UIViewControllerTransitioningDelegate {
    var floatingPanelController: FloatingPanelController!
    var delegate: ViewControllerDelegate! = nil
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return PresentationController(presentedViewController: presented, presenting: presenting)
    }
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var preButton1: UIButton!
    @IBOutlet weak var preButton2: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        button.addTarget(self,action: #selector(self.tapButton(_ :)),for: .touchUpInside)
        button2.addTarget(self,action: #selector(self.tapButton2(_ :)),for: .touchUpInside)
        preButton1.addTarget(self, action: #selector(self.tapPreButton1(_ :)), for: .touchUpInside)
        preButton2.addTarget(self, action: #selector(self.tapPreButton2(_ :)), for: .touchUpInside)
        floatingPanelController = FloatingPanelController()
        self.delegate = SemiModalViewController()
    }
    
    @objc func tapButton(_ sender: UIButton){
        // セミモーダルビューとなるViewControllerを生成し、contentViewControllerとしてセットする
        let semiModalViewController = self.storyboard?.instantiateViewController(withIdentifier: "fpc") as? SemiModalViewController
        semiModalViewController?.textA = "ボタン１"
        floatingPanelController.set(contentViewController: semiModalViewController)
        // セミモーダルビューを表示する
        floatingPanelController.addPanel(toParent: self, belowView: nil, animated: false)
        floatingPanelController.delegate = self
        floatingPanelController.addPanel(toParent: self, belowView: nil, animated: false)
    }
    @objc func tapButton2(_ sender: UIButton){
        // セミモーダルビューとなるViewControllerを生成し、contentViewControllerとしてセットする
        let semiModalViewController = self.storyboard?.instantiateViewController(withIdentifier: "fpc") as? SemiModalViewController
        semiModalViewController?.textA = "ボタン２"
        floatingPanelController.set(contentViewController: semiModalViewController)
        // セミモーダルビューを表示する
        floatingPanelController.addPanel(toParent: self, belowView: nil, animated: false)
        floatingPanelController.delegate = self
//        self.delegate.modalWillBegin(sendText: "aaa")
        floatingPanelController.addPanel(toParent: self, belowView: nil, animated: false)
    }
    
    @objc func tapPreButton1(_ sender: UIButton){
        let presentedViewController = self.storyboard?.instantiateViewController(withIdentifier: "pvc") as? PresentedViewController
        presentedViewController?.modalPresentationStyle = .custom
        presentedViewController?.transitioningDelegate = self
        presentedViewController!.textP = "aaaaaaa"
        self.present(presentedViewController!, animated: true, completion: nil)
    }
    @objc func tapPreButton2(_ sender: UIButton){
        let presentedViewController = self.storyboard?.instantiateViewController(withIdentifier: "pvc") as? PresentedViewController
        presentedViewController?.modalPresentationStyle = .custom
        
        presentedViewController?.transitioningDelegate = self
        presentedViewController!.textP = "bbbbbbbbb"
        self.present(presentedViewController!, animated: true, completion: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // セミモーダルビューを非表示にする
        floatingPanelController.removePanelFromParent(animated: true)
    }
    
    // カスタマイズしたレイアウトに変更
    func floatingPanel(_ vc: FloatingPanelController, layoutFor newCollection: UITraitCollection) -> FloatingPanelLayout? {
        return CustomFloatingPanelLayout()
    }
    func floatingPanelDidEndDragging(_ vc: FloatingPanelController, withVelocity velocity: CGPoint, targetPosition: FloatingPanelPosition) {
        if targetPosition == .tip{
            vc.removePanelFromParent(animated: true)
        }
    }
    
}
