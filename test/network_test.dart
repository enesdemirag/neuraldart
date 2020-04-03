import '../lib/src/neuralnetwork.dart';
import '../lib/src/dataset.dart';
import '../lib/src/layer.dart';

void main() {
  NeuralNetwork nn = new NeuralNetwork(5);
  nn.layers[1] = Layer.namedConst(6,2);
  nn.layers[2] = Layer.namedConst(12,6); 
  nn.layers[3] = Layer.namedConst(6,12); 
  nn.layers[4] = Layer.namedConst(1,6); 
  
  Dataset dataset = new Dataset();
}