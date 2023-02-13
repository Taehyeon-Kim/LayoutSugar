# LayoutSugar

![Swift](https://img.shields.io/badge/swift-5.7-orange)

## Getting Started

- **Adapt `Layoutable` protocol on `ViewController`**
    ```swift
    extension ViewController: Layoutable {}
    ```

- **Write layout informations of views by using layoutItems**
    ```swift
    /// view means self.view
    var layoutItems: [LayoutItem] {
        return [
            LayoutItem(redButton, top: (view, .same, 100), side: (view, 20), height: 130),
            LayoutItem(greenButton, top: (redButton, .bottom, 5), side: (view, 20), height: 50),
            LayoutItem(yellowView, top: (view, .same, 130), side: (redButton, 20), height: 70),
            LayoutItem(blueView, side: (greenButton, 10), height: 25, center: (greenButton, .same))
        ]
    }
    ```

- **Call buildLayout methods. (Remember add subviews process. You can use setupHierarchy method.)**
    ```swift
    override func viewDidLoad() {
        super.viewDidLoad()

        setupHierarchy()
        buildLayout()
    }
    ```

## Example

```swift
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHierarchy()
        buildLayout()
    }

    private let redButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        return button
    }()
    
    private let greenButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        return button
    }()
    
    private let yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    private let blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
}

extension ViewController: Layoutable {

    /// view means self.view
    var layoutItems: [LayoutItem] {
        return [
            LayoutItem(redButton, top: (view, .same, 100), side: (view, 20), height: 130),
            LayoutItem(greenButton, top: (redButton, .bottom, 5), side: (view, 20), height: 50),
            LayoutItem(yellowView, top: (view, .same, 130), side: (redButton, 20), height: 70),
            LayoutItem(blueView, side: (greenButton, 10), height: 25, center: (greenButton, .same))
        ]
    }
}
```

## Installation
- Using swift package manager

    ```
    dependencies: [
        .package(url: "https://github.com/Taehyeon-Kim/LayoutSugar.git", from: "main")
    ]
    ```

## License
**LayoutSugar** is under MIT license. See the [LICENSE](LICENSE) file for more info.
