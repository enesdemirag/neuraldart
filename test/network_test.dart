import 'dart:io';
import 'package:test/test.dart';
import '../lib/src/neuralnetwork.dart';
import '../lib/src/dataset.dart';
import '../lib/src/layer.dart';

void main() {
  test('Checks for object initialization',(){
    NeuralNetwork nn = new NeuralNetwork(5);
    expect(nn.getSize(), 5);
  });
}