//
//  ViewController.swift
//  onbarding
//
//  Created by Beqa Tabunidze on 05.07.21.
//

import UIKit
import Kingfisher

class OnboardingViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var slides = [Onboarding]()
    var currentPage = 0 {
        
        didSet {
            
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                
                nextButton.setTitle("DONE", for: .normal)
                
            } else {
                
                nextButton.setTitle("NEXT", for: .normal)
                
            }
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        jsonParser {
            
            self.collectionView.reloadData()
        }
        
    }
    
    func jsonParser(completed: @escaping () -> ()) {
        
        let url = URL(string: "https://run.mocky.io/v3/3c597760-1ebc-4136-a10f-d285c3343efb")
        URLSession.shared.dataTask(with: url!) { data, response, error in
            
            if error == nil {
                
                do {
                    
                    self.slides = try JSONDecoder().decode([Onboarding].self, from: data!)
                    DispatchQueue.main.async {
                        
                        completed()
                        
                    }
                
                } catch {
                    
                    print("error with code: \(error.localizedDescription)")
                    
                }
            }
            
        }.resume()
        
    }

    @IBAction func onTapSkip(_ sender: Any) {
        
//        აქ უნდა დაიწეროს შემდეგ გვერდზე გადასასვლელი კოდი როცა მომხმარებელი დააჭერს SKIP
        
    }
    
    @IBAction func onTapNext(_ sender: Any) {
        
        if currentPage == slides.count - 1 {
            
//            აქ უნდა დაიწეროს შემდეგ გვერდზე გადასასვლელი კოდი როცა ონბორდინგი დასრულდება
            
            print("next")
            
            
        } else {
            
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }

        
    }

    
}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCollectionViewCell", for: indexPath) as! OnboardingCollectionViewCell
        cell.titleLabel.text = slides[indexPath.row].text
        let imageUrl = slides[indexPath.row].image
        cell.backgroundImage.kf.setImage(with: URL(string: imageUrl))
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        
    }

    
}

