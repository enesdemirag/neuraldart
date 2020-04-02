import 'neuron.dart';
import 'layer.dart';
import 'utils.dart' as utils;
import 'dataset.dart';

class NeuralNetwork {
  List<Layer> layers = [];

  NeuralNetwork(int size) {
    this.layers.length = size;
  }
}

void forward(NeuralNetwork nn, List<double> inputs) {
  // Bring the inputs into the input layer
  nn.layers.insert(0, Layer(inputs));
  
  // Forward propagation
  for(int i = 1; i < nn.layers.length; i++) { // Starts from 1st hidden layer
    for(int j = 0; j < nn.layers[i].neurons.length; j++) {
      double sum = 0;
      for(int k = 0; k < nn.layers[i - 1].neurons.length; k++) {
        sum += nn.layers[i - 1].neurons[k].value * nn.layers[i].neurons[j].weights[k];
      }
      nn.layers[i].neurons[j].value = utils.sigmoid(sum);
    }
  } 	
}

void backward(NeuralNetwork nn, double learning_rate, Pair datas) {
  
  int number_layers = nn.layers.length;
  int output_layer_index = number_layers - 1;
  
  // Update the output layers 
  for(int i = 0; i < nn.layers[output_layer_index].neurons.length; i++) { // For each output
    double output = nn.layers[output_layer_index].neurons[i].value;
    double target = datas.output_data[i];
    double derivative = output - target;
    double delta = derivative * (output * (1 - output));
    nn.layers[output_layer_index].neurons[i].gradient = delta;
    
    for(int j = 0; j < nn.layers[output_layer_index].neurons[i].weights.length; j++) { // and for each of their weights
      double previous_output = nn.layers[output_layer_index - 1].neurons[j].value;
      double error = delta * previous_output;
      nn.layers[output_layer_index].neurons[i].weights_old[j] = nn.layers[output_layer_index].neurons[i].weights[j] - learning_rate * error;
    }
  }
  
  // Update all the subsequent hidden layers
  for(int i = output_layer_index - 1; i > 0; i--) { // Backward
    for(int j = 0; j < nn.layers[i].neurons.length; j++) { // For all neurons in that layers
      double output = nn.layers[i].neurons[j].value;
      double gradient_sum = sumGradient(nn, j, i + 1);
      double delta = (gradient_sum) * (output * (1 - output));
      nn.layers[i].neurons[j].gradient = delta;
      
      for(int k = 0; k < nn.layers[i].neurons[j].weights.length; k++) { // And for all their weights
        double previous_output = nn.layers[i - 1].neurons[k].value;
        double error = delta * previous_output;
        nn.layers[i].neurons[j].weights_old[k] = nn.layers[i].neurons[j].weights[k] - learning_rate * error;
      }
    }
  }
  
  // Update all the weights
  for(int i = 0; i < nn.layers.length; i++) {
    for(int j = 0; j < nn.layers[i].neurons.length; j++) {
      nn.layers[i].neurons[j].updateWeights();
    }
  }
}

// This function sums up all the gradient connecting a given neuron in a given layer
double sumGradient(NeuralNetwork nn, int n_index, int l_index) {
  double gradient_sum = 0;
  Layer current_layer = nn.layers[l_index];
  for(int i = 0; i < current_layer.neurons.length; i++) {
    Neuron current_neuron = current_layer.neurons[i];
    gradient_sum += current_neuron.weights[n_index] * current_neuron.gradient;
  }
  return gradient_sum;
}

// This function is used to train
void train(NeuralNetwork nn, Dataset dt, int iteration, double learning_rate) {
  for(int i = 0; i < iteration; i++) {
    for(int j = 0; j < dt.getLength(); j++) {
      forward(nn, dt.pairs[j].input_data);
      backward(nn, learning_rate, dt.pairs[j]);
    }
  }
}