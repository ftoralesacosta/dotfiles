import numpy as np

class Classifier:
    """
    A classifier for data with shape [20, 4, 2000].
    
    Attributes:
        data_shape (tuple): The expected shape of the input data.
    """
    
    def __init__(self):
        self.data_shape = (20, 4, 2000)
    
    def classify(self, data):
        """
        Classifies the input data.
        
        Args:
            data (ndarray): The input data with shape [20, 4, 2000].
        
        Returns:
            ndarray: The classification results.
        """
        assert data.shape == self.data_shape, f"Invalid data shape. Expected {self.data_shape}, got {data.shape}."
        
        # Perform classification here
        # ...
        
        # Example: Random classification for demonstration purposes
        classifications = np.random.randint(low=0, high=2, size=(self.data_shape[0],))
        
        return classifications

# Example usage
data = np.random.random(size=(20, 4, 2000))
classifier = Classifier()
classifications = classifier.classify(data)
print(classifications)
