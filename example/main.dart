import '../lib/src/neuralnetwork.dart';
import '../lib/src/dataset.dart';

Dataset loadDataset() {
  // TODO: Make this more generic and create a get from yaml function inside library.
  // XOR Example
  double input1 = [0, 0];
  double input2 = [0, 1];
  double input3 = [1, 0];
  double input4 = [1, 1];
  
  double expected_output1 = 0;
  double expected_output2 = 1;
  double expected_output3 = 1;
  double expected_output4 = 0;
  
  dataset = new Dataset[4];
  dataset.pairs[0] = new Pair(input1, expectedOutput1);
  dataset.pairs[1] = new Pair(input2, expectedOutput2);
  dataset.pairs[2] = new Pair(input3, expectedOutput3);
  dataset.pairs[3] = new Pair(input4, expectedOutput4);
  
  return dataset;  
}

// Main Method
void main() {
  // Set Min and Max weight value for all neurons
  Neuron.setRange(-1, 1);
  
  // Create the layers
  List<Layer> layers = new List(3);       // 1 input + 1 hidden + 1 output
  // No need to add input layer, it will be added from dataset automatically
  layers.add(Layer.namedConst(6,2));       // Hidden layer / 6 neurons each have 2 weights (connections)
  layers.add(Layer.namedConst(1,6));       // Output layer / 1 neuron with 6 weights (connections) 
  
  // Create the training data
  dataset = loadDataset(); // Hard-coded for now.
  
  print("============");
  print("Output before training");
  print("============");
  for(var i in dataset.pairs) {
    forward(i.data);
    print('inputs: ' + layers[0].neuron[0].value.toString() + ', ' + layers[0].neuron[1].value.toString())
    print('output: ' + layers[2].neurons[0].value.toString());
  }
  
  train(100000, 0.05);

  print("============");
  print("Output after training");
  print("============");
  for(var i in dataset.pairs) {
    forward(i.data);
    print('inputs: ' + layers[0].neuron[0].value.toString() + ', ' + layers[0].neuron[1].value.toString())
    print('output: ' + layers[2].neurons[0].value.toString());
  }
}