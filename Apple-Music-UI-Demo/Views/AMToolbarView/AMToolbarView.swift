//
//  AMToolbarView.swift
//  Apple-Music-UI-Demo
//
//  Created by Seb Vidal on 28/04/2024.
//

import UIKit

class AMToolbarView: UIView {
    // MARK: - Private Properties
    private var shadowView: UIView!
    private var backgroundView: UIVisualEffectView!
    private var artworkView: UIImageView!
    private var titleLabeL: UILabel!
    private var buttonStackView: UIStackView!
    private var playButton: UIButton!
    private var forwardButton: UIButton!
    
    // MARK: - Public Properties
    var isArtworkViewHidden: Bool {
        get {
            return artworkView.isHidden
        } set {
            artworkView.isHidden = newValue
        }
    }
    
    var cornerRadius: CGFloat {
        get {
            return backgroundView.layer.cornerRadius
        } set {
            backgroundView.layer.cornerRadius = newValue
        }
    }
    
    var song: AMSong? = nil {
        didSet { updateUI(for: song) }
    }
    
    weak var delegate: AMToolbarViewDelegate? = nil
    
    // MARK: - init(frame:)
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupShadowView()
        setupBackgroundView()
        setupArtworkView()
        setupTitleLabel()
        setupButtonStackView()
        setupPlayButton()
        setupForwardButton()
        setupTapGestureRecogniser()
    }
    
    // MARK: - init(coder:)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupShadowView() {
        shadowView = UIView()
        shadowView.layer.shadowRadius = 10
        shadowView.layer.shadowOpacity = 0.2
        shadowView.layer.shadowOffset = CGSize.zero
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(shadowView)
        
        NSLayoutConstraint.activate([
            shadowView.topAnchor.constraint(equalTo: topAnchor, constant: -17),
            shadowView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -19),
            shadowView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 19),
            shadowView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 21)
        ])
    }
    
    private func setupBackgroundView() {
        backgroundView = UIVisualEffectView()
        backgroundView.clipsToBounds = true
        backgroundView.layer.cornerRadius = 14
        backgroundView.layer.cornerCurve = .continuous
        backgroundView.effect = UIBlurEffect(style: .systemThickMaterial)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        shadowView.addSubview(backgroundView)
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setupArtworkView() {
        artworkView = UIImageView()
        artworkView.clipsToBounds = true
        artworkView.layer.cornerRadius = 6
        artworkView.layer.cornerCurve = .continuous
        artworkView.backgroundColor = .tertiarySystemFill
        artworkView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(artworkView)
        
        NSLayoutConstraint.activate([
            artworkView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 8),
            artworkView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 8),
            artworkView.bottomAnchor.constraint(lessThanOrEqualTo: backgroundView.bottomAnchor, constant: -8),
            artworkView.widthAnchor.constraint(equalToConstant: 40),
            artworkView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setupTitleLabel() {
        titleLabeL = UILabel()
        titleLabeL.font = .systemFont(ofSize: 15, weight: .semibold)
        titleLabeL.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(titleLabeL)
        
        NSLayoutConstraint.activate([
            titleLabeL.leadingAnchor.constraint(equalTo: artworkView.trailingAnchor, constant: 8),
            titleLabeL.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func setupButtonStackView() {
        buttonStackView = UIStackView()
        buttonStackView.spacing = 0
        buttonStackView.axis = .horizontal
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(buttonStackView)
        
        NSLayoutConstraint.activate([
            buttonStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2.33),
            buttonStackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func setupPlayButton() {
        playButton = UIButton()
        playButton.configuration = .toolbar()
        playButton.configuration?.image = .play
        
        buttonStackView.addArrangedSubview(playButton)
    }
    
    private func setupForwardButton() {
        forwardButton = UIButton()
        forwardButton.configuration = .toolbar()
        forwardButton.configuration?.image = .forward
        
        buttonStackView.addArrangedSubview(forwardButton)
    }
    
    private func setupTapGestureRecogniser() {
        let tapGestureRecogniser = UITapGestureRecognizer()
        tapGestureRecogniser.addTarget(self, action: #selector(tapGestureRecognised))
        
        addGestureRecognizer(tapGestureRecogniser)
    }
    
    @objc private func tapGestureRecognised(_ sender: UITapGestureRecognizer) {
        delegate?.toolbarView(self, tapGestureRecognised: sender)
    }
    
    private func updateUI(for song: AMSong?) {
        artworkView.image = song?.artwork
        titleLabeL.text = song?.title
    }
}
