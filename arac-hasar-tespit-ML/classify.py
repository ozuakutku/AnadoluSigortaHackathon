from ultralytics import YOLO
import sys

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
