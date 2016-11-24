

import UIKit

class DetailViewController: UIViewController  {

   
    @IBOutlet var mainScrollView: UIScrollView!
 
       @IBOutlet var cityTextView: UITextView!
    
    
  
 var imageArray =  [UIImage]()

  var detailCity: City? {
    didSet {
      configureView()
    }
  }
  
  func configureView() {
       if let detailCity = detailCity {
    if  let _ =  cityTextView {
         title = detailCity.name
        self.cityTextView.text=detailCity.text
        
        }
       
       
    //   cityImageView.image = UIImage(named: detailCity.name)
        
       
       
       
      
      }
    }
    override func viewDidLoad() {
    super.viewDidLoad()
    imageArray = [UIImage(named:"Абзакво1")!,UIImage(named:"Абзакво2")!,UIImage(named:"Абзакво3")!]
         for i in 0..<imageArray.count
        {
            let imageView = UIImageView()
            imageView.image = imageArray[i]
          
            mainScrollView.addSubview(imageView)
        }
    configureView()
      
  }
   
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
}

