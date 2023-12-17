import json

def filtrele(veriler, anahtar, deger):
    """Verileri filtreler."""
    filtrelenmis_veriler = []
    for veri in veriler:
        if veri[anahtar] == deger:
            filtrelenmis_veriler.append(veri)
    return filtrelenmis_veriler

if __name__ == "__main__":
    # Kullanıcıdan girdi al
    anahtar = input("Hangi anahtara göre filtrelemek istiyorsunuz?: ")
    deger = input("Filtrelemek istediğiniz değeri girin: ")

    try:
        # Verileri yükle
        with open("C:/Users/LENOVO/Desktop/teknik_veri.json", encoding='utf-8') as file:
            veriler = json.load(file)

        # Verileri filtrele
        filtrelenmis_veriler = filtrele(veriler, anahtar, deger)

        # Filtrelenmiş verileri yazdır
        for veri in filtrelenmis_veriler:
            print(veri)
    
    except FileNotFoundError:
        print("Belirtilen dosya bulunamadı.")
    except json.JSONDecodeError:
        print("JSON formatında bir hata oluştu.")
    except Exception as e:
        print(f"Bir hata oluştu: {e}")
