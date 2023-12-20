from ultralytics import YOLO
import sys
from flask import Flask, request, jsonify
from werkzeug.utils import secure_filename
import os

app = Flask(__name__)

UPLOAD_FOLDER = 'uploads'
ALLOWED_EXTENSIONS = {'jpg', 'jpeg', 'png', 'gif'}

app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

@app.route('/process_image', methods=['POST'])
def process_image():
    try:
        # Gelen dosyayı al
        file = request.files['image']
        if file and allowed_file(file.filename):
            # Dosyayı güvenli bir şekilde kaydet
            filename = secure_filename(file.filename)
            filepath = os.path.join(app.config['UPLOAD_FOLDER'], filename)
            file.save(filepath)

            # Burada işleme fonksiyonunu çağırabilir ve sonucu döndürebilirsiniz
            result = predict_with_yolo(filepath)

            # Sonucu JSON formatında döndür
            return jsonify({'result': result})

    except Exception as e:
        print(f"Error processing image: {e}")

    return jsonify({'error': 'Invalid file'}), 400

if __name__ == '__main__':
    if not os.path.exists(UPLOAD_FOLDER):
        os.makedirs(UPLOAD_FOLDER)
    app.run(host='localhost', port=5000)

def predict_with_yolo(file_path):
    
    model = YOLO('best.pt')

    # Predict using the provided file path
    result = model.predict(file_path)
    
    return result[0].probs.top1

if __name__ == "__main__":
    # Komut satırı argümanlarını kontrol et
    if len(sys.argv) == 1:
        
        file_path = "C:\\Users\\alios\\Desktop\\Desktop\\AutoHack\\arabakaza.jpg"
    elif len(sys.argv) == 2:
        file_path = sys.argv[1]
    else:
        print("Kullanım: python predict_with_yolo.py [dosya_yolu]")
        sys.exit(1)

    predictions = predict_with_yolo(file_path)
    print(predictions)
