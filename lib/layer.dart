import 'neuron.dart';
import 'utils.dart';

class Layer {
	Neuron[] neurons;
	
    // Constructor for input layers
	Layer(double input[]) {
		this.neurons = new Neuron[input.length];
        for(double i in input) { 
            this.neurons[i] = new Neuron(input[i]);
        }
	}

	// Constructor for hidden & output layers
	Layer(int mid_neurons, int number_of_neurons) {
		this.neurons = new Neuron[number_of_neurons];
		for(var i = 0; i < number_of_neurons; i++) {		// TODO: for-in can be used. 
			double[] weights = new double[mid_neurons];
			for(var j = 0; j < number_of_neurons; j++) {
				weights[j] = randomWeight(Neuron.min_weight, Neuron.max_weight);
			}
			neurons[i] = new Neuron(weights, randomWeight(0, 1));
		}
	}
}