# 📱 Mini Katalog Uygulaması

Bu proje, mobil uygulama geliştirme dersi kapsamında, modern yazılım mimarilerine ve kullanıcı deneyimi (UX/UI) pratiklerine sadık kalınarak Flutter ile geliştirilmiş bir **Mobil Ürün Katalog Uygulamasıdır**. 

Uygulama, **DummyJSON API** servisini arka planda asenkron olarak tüketerek dinamik bir veri akışı sağlar. Prototip tasarım kılavuzlarına tamamen sadık kalınarak; fiyatların vurgulanmasından, sepet görünümünün pürüzsüz state senkronizasyonuna kadar her detay milimetrik olarak işlenmiştir.

---

## 🎨 Ekran Görüntüleri (Screenshots)

> **Not:** Uygulamanın arayüz çıktılarını görmek için aşağıdaki alanlara kendi ekran görüntülerinizi ekleyebilirsiniz. `assets/` klasörüne veya GitHub üzerine görselleri yükleyip yollarını güncelleyin.

| Giriş Ekranı (Login) | Katalog Listesi (Discover) | Ürün Detay (Detail) | Sepetim (Cart) |
| :---: | :---: | :---: | :---: |
| <img src="EKRAN_GORUNTUSU_LINKI_1" width="200" alt="Login"/> | <img src="EKRAN_GORUNTUSU_LINKI_2" width="200" alt="Discover"/> | <img src="EKRAN_GORUNTUSU_LINKI_3" width="200" alt="Detail"/> | <img src="EKRAN_GORUNTUSU_LINKI_4" width="200" alt="Cart"/> |

---

## 💡 Öne Çıkan Özellikler ve Kazanımlar

*   **Güvenli ve Şık Giriş Arayüzü:** Kullanıcıyı karşılayan, modern input alanlarına sahip ve ana kataloğa yönlendirme yapan çalışan bir `LoginScreen`.
*   **Dinamik GridView Mimarisi:** Ürünlerin responsive (esnek) bir yapıda ikişerli sütunlar halinde pürüzsüz kart tasarımlarıyla listelenmesi.
*   **Anlık Arama Filtresi (Search Bar):** Kullanıcı yazı yazdığı anda tetiklenen ve DummyJSON'dan gelen verileri yerel olarak filtreleyen asenkron arama fonksiyonu.
*   **Gelişmiş State Yönetimi:** `setState` mekanizması kullanılarak dinamik sepet yönetimi. Sepete ürün eklendiğinde AppBar üzerindeki badge sayacının anlık artması, ürünü sepetten çıkarma ve sepet boş olsa dahi sabit kalan profesyonel "Checkout" alanı.
*   **Yedekli Asset ve Hata Yönetimi (Error Handling):** API'den gelen görsellerin kırılması veya yüklenememesi durumuna karşın `errorBuilder` ve `loadingBuilder` mimarileriyle kullanıcıya yedek ikon gösterimi.

---

## 📁 Proje Klasör Yapısı (Architecture)

Sektör standartlarına uygun, kodun sürdürülebilirliğini ve okunabilirliğini artıran temiz bir katmanlı mimari kullanılmıştır:

```text
lib/
├── components/
│   └── mini_card_tile.dart          # Sepet sayfasındaki tekrarlanan küçük ürün kartları (Clean Code)
├── models/
│   └── product.dart                 # API'den gelen verileri anlamlı nesnelere dönüştüren Veri Modeli
├── screens/
│   ├── cart_screen.dart             # Gelişmiş sepet yönetim ekranı
│   ├── discover_screen.dart         # GridView ve Arama çubuğunun yer aldığı ana katalog ekranı
│   ├── login_screen.dart            # Kullanıcı karşılama ve giriş ekranı
│   └── product_detail_screen.dart   # Teknik özelliklerin (Specifications) listelendiği detay ekranı
├── services/
│   ├── api_service.dart             # HTTP protokolü ile DummyJSON veri çekme servisi
│   └── local_storage_service.dart   # Cihaz hafızası kalıcı veri yönetimi şablon servisi
└── main.dart                        # Uygulamanın başlangıç noktası ve tema/renk şeması ayarları