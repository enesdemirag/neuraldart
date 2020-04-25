[![Language](https://img.shields.io/badge/language-Dart-blue.svg)](https://dart.dev)

# neuraldart
A Dart library for Neural Networks

I created this repo as an exercise while learning Dart Programming. Writing this library was very fun. There are also other (maybe even better) implementations like [ai](https://github.com/YevhenKap/ai) and [Dartnet](https://github.com/richardjuan/dartnet).

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details. If you found mistake or have any advice, feel free to open an issue.

Thanks to [@yacineMahdid](https://github.com/yacineMahdid) for backpropagation algorithm.

## Usage
I wrote the [XOR Problem](example/main.dart) as an example. You can tweak it for your own dataset.

#### Result
```
============
Output before training
============
inputs: 0.0, 0.0
output: 0.46662168559996103
inputs: 0.0, 1.0
output: 0.48409641563876016
inputs: 1.0, 0.0
output: 0.43438123457124833
inputs: 1.0, 1.0
output: 0.4505847499026291

============
Output after training
============
inputs: 0.0, 0.0
output: 0.02568676661260416
inputs: 0.0, 1.0
output: 0.9758767143939321
inputs: 1.0, 0.0
output: 0.9794699040922308
inputs: 1.0, 1.0
output: 0.02227548086695073
```
