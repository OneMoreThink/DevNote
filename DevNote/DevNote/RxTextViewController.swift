//
//  RxTextViewController.swift
//  DevNote
//
//  Created by 이종선 on 12/23/24.
//

import UIKit
import RxSwift
import RxCocoa

class RxTextViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    private let testLabel = UILabel()
    private let testButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupUI()
        
        // RxSwift
        /// Observable 생성 및 구독
        Observable.just("Hello RxSwift")
            .subscribe(onNext: { text in
                print(text)
            }
            )
            .disposed(by: disposeBag)
        
        // RxCocoa
        /// button 클릭 이벤트를 Observable로 반환
        /// 즉 버튼 이벤트를 구독한후 해당 이벤트 발생시 실행할 동작 정의
        testButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.testLabel.text = "RxSwift 작동 확인 "
            })
            .disposed(by: disposeBag)
    }
    
    private func setupUI() {
        // 레이블 설정
        testLabel.text = "테스트 레이블"
        testLabel.textAlignment = .center
        testLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(testLabel)
        
        // 버튼 설정
        testButton.setTitle("테스트 버튼", for: .normal)
        testButton.setTitleColor(.blue, for: .normal)
        testButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(testButton)
        
        // 오토레이아웃 설정
        NSLayoutConstraint.activate([
            testLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            testLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            testButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            testButton.topAnchor.constraint(equalTo: testLabel.bottomAnchor, constant: 20)
        ])
    }
}
