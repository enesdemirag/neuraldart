class Neuron {
    // Static Neuron Attributes 
    static double max_weight;
    static double min_weight;

    // Attributes
    double[] weights;               // Updated weights after back propagation
    double[] weights_old;           // Weights before back propagation (1 version older)
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
    Neuron(double[] weights, double bias) {
        this.weights = weights;
        this.bias = bias;
        this.weights_old = this.weights;
        this.gradient = 0.0;
    }

    // Update method (to be used after the backpropagation for updating weights) 
    void updateWeights() {
        this.weights = this.weights_old;
    }
}