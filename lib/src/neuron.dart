class Neuron {
  // Static Neuron Attributes
  static int min_weight;
  static int max_weight;

  // Attributes
  List<double> weights = [];          // Updated weights after backpropagation
  List<double> weights_old = [];      // Weights before backpropagation (1 version older)
  double gradient;
  double bias;
  double value;

  // Constructor for input neurons
  Neuron(double value) {
    this.weights = null;
    this.weights_old = this.weights;
    this.bias = -1.0;
    this.gradient = -1.0;
    this.value = value;
  }

  // Constructor for hidden & output neurons
  Neuron.namedConst(List weights, double bias) {
    this.weights = weights;
    this.weights_old = this.weights;
    this.bias = bias;
    this.gradient = 0.0;
  }

  // Update method (to be used after the backpropagation for updating weights)
  void updateWeights() {
    this.weights = this.weights_old;
  }

  static void setRange(int min, int max) {
    min_weight = min;
    max_weight = max;
  }
}