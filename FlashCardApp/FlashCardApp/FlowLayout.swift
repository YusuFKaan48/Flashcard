//
//  FlowLayout.swift
//  FlashCardApp
//
//  Created by Yusuf Kaan USTA on 18.05.2023.
//

import UIKit

class MyHeaderClass: UICollectionReusableView {
    
    weak var textLabel: UILabel!
    private var dividerView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
        textLabel = label
        textLabel.textAlignment = .center
        textLabel.text = "Flashcards"
        textLabel.font = .preferredFont(forTextStyle: .title1)
        
        dividerView = UIView()
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(dividerView)
        NSLayoutConstraint.activate([
            dividerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            dividerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            dividerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: 1.0),
        ])
        dividerView.backgroundColor = .lightGray
        
        backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class MyFooterClass: UICollectionReusableView {
    
    private var dividerView: UIView!
    weak var textLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
        textLabel = label
        textLabel.textAlignment = .center
        textLabel.text = "Flashcards end..."
        
        dividerView = UIView()
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(dividerView)
        NSLayoutConstraint.activate([
            dividerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            dividerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            dividerView.topAnchor.constraint(equalTo: textLabel.topAnchor, constant: -8.0),
            dividerView.heightAnchor.constraint(equalToConstant: 1.0),
            
        ])
        dividerView.backgroundColor = .lightGray
        
        backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



class ViewController: UIViewController {
    
    let words = ["はい = hai", "いいえ = iie", "優しい = utsukushī", "今日 = kyō","年 = toshi", "水 = mizu", "コーヒー = kōhī", "医者 = isha", "寒い = samui", "眼鏡 = megane", "馬 = uma","警察 = keisatsu", "雪 = yuki", "うさぎ = usagi", "雨 = ame"]
    
    
    
    let translations = ["Yes", "No", "Beatiful", "Today","Year", "Water", "Coffee", "Doctor", "Cold", "Glasses", "Horse","Police", "Snow", "Rabbit", "Rain"]
    
    
    
    

    weak var collectionView: UICollectionView!
    
    // Define resuse identifiers
    let headerReuseIdentifier = "headerReuseIdentifier"
    let footerReuseIdentifier = "footerReuseIdentifier"
    
    override func loadView() {
        super.loadView()

        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cv)
        NSLayoutConstraint.activate([
            cv.topAnchor.constraint(equalTo: view.topAnchor),
            cv.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            cv.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cv.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        // Register headers & footer with resuse identifiers
        cv.register(MyHeaderClass.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerReuseIdentifier)

        cv.register(MyFooterClass.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerReuseIdentifier)

        self.collectionView = cv
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MyCell.self, forCellWithReuseIdentifier: "MyCell")
    }
}

extension ViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return words.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! MyCell
        let word = words[indexPath.row]
        let translation = translations[indexPath.row]
        cell.textLabel.text = word
        cell.backLabel.text = translation
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row + 1)
    let cell = collectionView.cellForItem(at: indexPath) as! MyCell
    cell.flip()
   }
}

extension ViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width - 16, height: 72)
    }

    //  If unspecified default value of 10 is used.
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }

    // Only top and bottom spaced if vertical scrolling (dependent on scroll direction)
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 20, left: -80, bottom: 20, right: -80)
    }

    // Support new header and footer in collection
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {

        switch kind {

        case UICollectionView.elementKindSectionHeader:
            let headerCell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerReuseIdentifier, for: indexPath) as! MyHeaderClass
            return headerCell

        case UICollectionView.elementKindSectionFooter:
            let footerCell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerReuseIdentifier, for: indexPath) as! MyFooterClass
            return footerCell

        default:
            assert(false, "Unexpected element kind")
        }
    }
    
    // Width doesn't matter because scroll is vertical. Only height used.
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
            return CGSize(width: 0, height: 72.0)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForFooterInSection section: Int) -> CGSize {
            return CGSize(width: 0, height: 32.0)
    }
}

class MyCell: UICollectionViewCell {
    private var frontView: UIView!
    private var backView: UIView!
    internal var textLabel: UILabel!
    internal var backLabel: UILabel!
    private var isShowingBack = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        frontView = UIView()
        frontView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(frontView)
        NSLayoutConstraint.activate([
            frontView.topAnchor.constraint(equalTo: contentView.topAnchor),
            frontView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            frontView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            frontView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        frontView.addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: frontView.topAnchor),
            label.bottomAnchor.constraint(equalTo: frontView.bottomAnchor),
            label.leadingAnchor.constraint(equalTo: frontView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: frontView.trailingAnchor),
        ])
        textLabel = label
        
        backView = UIView()
        backView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(backView)
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
        
        let backLabel = UILabel()
        backLabel.translatesAutoresizingMaskIntoConstraints = false
        backView.addSubview(backLabel)
        NSLayoutConstraint.activate([
            backLabel.topAnchor.constraint(equalTo: backView.topAnchor),
            backLabel.bottomAnchor.constraint(equalTo: backView.bottomAnchor),
            backLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor),
            backLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor),
        ])
        self.backLabel = backLabel
        
        contentView.layer.cornerRadius = 16.0
        contentView.layer.borderWidth = 1.0
        contentView.layer.borderColor = UIColor.systemIndigo.cgColor
        
        textLabel.textAlignment = .center
        textLabel.font = UIFont.systemFont(ofSize: 20.0)
        
        backLabel.textAlignment = .center
        backLabel.font = UIFont.systemFont(ofSize: 20.0)
        
        
        contentView.clipsToBounds = true
        frontView.clipsToBounds = true
        backView.clipsToBounds = true
        backView.isHidden = true
    }
    
    func flip() {
        isShowingBack.toggle()
        let transitionOptions: UIView.AnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]
        UIView.transition(with: contentView, duration: 0.5, options: transitionOptions, animations: {
            self.frontView.isHidden = self.isShowingBack
            self.backView.isHidden = !self.isShowingBack
        }, completion: nil)
    }
    
    func configure(with text: String) {
        frontView.isHidden = isShowingBack
        backView.isHidden = !isShowingBack
        textLabel.text = text
        backLabel.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

