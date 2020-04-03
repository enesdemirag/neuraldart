import '../lib/src/neuralnetwork.dart';
import '../lib/src/dataset.dart';

// Main Method
void main() {
  // Set Min and Max weight value for all neurons
  Neuron.setRange(-1, 1);
  
  // Create a Neural Network with 3 Layers
  NeuralNetwork nn = new NeuralNetwork(3);    // 1 input + 1 hidden + 1 output
  // No need to add input layer, it will be added from dataset automatically
  nn.layers[1] = Layer.namedConst(6,2);       // Hidden layer / 6 neurons each have 2 weights (connections)
  nn.layers[2] = Layer.namedConst(1,6);       // Output layer / 1 neuron with 6 weights (connections) 
  
  // Create the training data
  Dataset dataset = loadDataset(); // Hard-coded for now.
  
  print("============");
  print("Output before training");
  print("============");
  for(var i in dataset.pairs) {
    forward(nn, i.input_data);
    print('inputs: ' + nn.layers[0].neurons[0].value.toString() + ', ' + nn.layers[0].neurons[1].value.toString());
    print('output: ' + nn.layers[2].neurons[0].value.toString());
  }
  
  train(nn, dataset, 100000, 0.05);

  print("============");
  print("Output after training");
  print("============");
  for(var i in dataset.pairs) {
    forward(nn, i.input_data);
    print('inputs: ' + nn.layers[0].neurons[0].value.toString() + ', ' + nn.layers[0].neurons[1].value.toString());
    print('output: ' + nn.layers[2].neurons[0].value.toString());
  }
}