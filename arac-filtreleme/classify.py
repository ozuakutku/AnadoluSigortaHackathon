from flask import Flask, request, jsonify
from ultralytics import YOLO

app = Flask(__name__)

def predict_with_yolo(file_path):
    model = YOLO('best.pt')
    result = model.predict(file_path)
    return result[0].probs.top1

@app.route('/')
def home():
    return 'Flask API is running!'

@app.route('/predict', methods=['POST'])
def predict():
    try:
        # Get the file from the request
        file = request.files['file']
        
        # Save the file temporarily
        file_path = "./temp_image.jpg"
        file.save(file_path)

        # Make predictions
        predictions = predict_with_yolo(file_path)

        # Return predictions as JSON
        return jsonify(predictions)
    except Exception as e:
        return jsonify({'error': str(e)})

if __name__ == "__main__":
    app.run(debug=True)
