class Pair { 
    List<double> data = [];
    List<double> expected_output = [];
   
    Pair(this.data, this.expected_output);

    // @override
    int length() { // Lenght of the data
        return data.length;
    }
}

class Dataset { 
    List<Pair> pairs = [];
    
    Dataset(this.pairs);
}