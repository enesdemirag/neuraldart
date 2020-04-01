class Neuron {
    // Static Neuron Attributes 
    static double min_weight;
    static double max_weight;

    // Attributes
    double weights = <double>();               // Updated weights after backpropagation
    double weights_old = <double>();           // Weights before backpropagation (1 version older)
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

	static void setRange(double min, double max) {
    	min_weight = min;
    	max_weight = max;
    }
}