#  Ron Swanson Quotes App

<p align="center">
<img src="https://img.shields.io/badge/Swift-5.1-orange.svg" />
<img src="https://img.shields.io/badge/iOS-14.0+-brightgreen.svg" />
<a href="https://twitter.com/dankorkelia">
<img src="https://img.shields.io/badge/Twitter-@dankorkelia-blue.svg?style=flat" alt="Twitter: @dankorkelia" />
</a>
<a href="https://www.linkedin.com/in/ramdankorkelia/">
<img src="https://img.shields.io/badge/LinkedIn-DanKorkelia-blue.svg?style=flat" alt="LinkedIn: @DanKorkelia" />
</a>
</p>

## About the project
Ron Swansons Quotes is an iOS app that gets a random quote from public API. It also lets you save your favourite quotes and share them with your friends and/or on social media. App might be especially fun for fans of a TV show Parks and Recreations.

The app depends on [Ron Swanson Quotes API](https://github.com/jamesseanwright/ron-swanson-quotes#ron-swanson-quotes-api) which is a public api project on GitHub. The app is built in such a way that it is very easy to substitute an API for a different one as most of the code is structured in a way that separates concerns. And each layer UI, Data, Networking and Storage, can be interchanged without having to rework other layers. Promoting good coding practices.


### Highlights

- App code has good unit test coverage and attempts to unit test various business logic and networking code. 
- Using SwiftUI to manage UI there is very little boiler plate ui code that comes with UIKit, this means the app requires iOS 14 as minimum target. If you close this project it is still possible to replace UI layer with UIKit and drop minimum required version to older iOS release.
- Local storage currently uses UserDefaults to store your favourite quotes.
- UITests can run without network as there are default values present and UI always has valid state to allow us to test UI elements even on CI pipeline. We can also provide a mocked data by injecting it during app start specifically for test targets.


## Roadmap
- MacOS support
- Caching network requests
- Home screen Widgets
- Share screenshot
- Delete favorites
- Search for a quote


## License

Distributed under the MIT License. See LICENSE for more information.


## Contact
Twitter - [@dankorkelia](https://twitter.com/dankorkelia) 

Website: [https://ramdankorkelia.com](https://ramdankorkelia.com)

LinkedIn: [https://www.linkedin.com/in/ramdankorkelia/](https://www.linkedin.com/in/ramdankorkelia/)

Project Link: [https://github.com/DanKorkelia/RonSwansonQuotesApp](https://github.com/DanKorkelia/RonSwansonQuotesApp)


## Acknowledgements

- [Ron Swanson Quotes API](https://github.com/jamesseanwright/ron-swanson-quotes#ron-swanson-quotes-api)
- [Paul Hudson Hacking with Swift - How to test iOS networking code the easy way](https://www.hackingwithswift.com/articles/153/how-to-test-ios-networking-code-the-easy-way)
