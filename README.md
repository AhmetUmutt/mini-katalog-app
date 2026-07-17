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

---

## 🛠️ Sistem Gereksinimleri ve Sürümler

Uygulamanın geliştirildiği ve kararlı çalıştığı ortam bilgileri aşağıdadır:

*   **Flutter SDK:** `3.x.x` (Stable Channel)
*   **Dart SDK:** `3.x.x`
*   **Platformlar:** Android (API 21 ve üzeri) / iOS (iOS 12 ve üzeri) / Web
*   **Geliştirme Editörü:** VS Code / Android Studio

---

## 🚀 Detaylı Yerel Bilgisayarda Çalıştırma Adımları

Projeyi kendi yerel geliştirme ortamınızda sıfır hata ile ayağa kaldırmak için lütfen aşağıdaki adımları sırasıyla, eksiksiz bir şekilde takip edin:

### Adım 1: Kaynak Kodları Bilgisayarınıza İndirin
Öncelikle GitHub üzerindeki bu kaynak kodları yerel diskinize çekmeniz gerekir. Bilgisayarınızda terminali (veya Komut İstemi/PowerShell) açın, projeyi kaydetmek istediğiniz klasöre gidin ve şu komutu yürütün:
```bash
git clone [https://github.com/AhmetUmutt/mini-katalog-app.git](https://github.com/AhmetUmutt/mini-katalog-app.git)

Eğer bilgisayarınızda Git kurulu değilse, bu GitHub sayfasının sağ üstünde yer alan yeşil "Code" butonuna tıklayıp "Download ZIP" seçeneğini kullanabilirsiniz. İndirdiğiniz ZIP dosyasını klasöre ayıklayarak bir sonraki adıma geçin.

📂 Adım 2: Proje Ana Dizinine Geçiş Yapın
İndirme veya klonlama işlemi bittikten sonra, terminalinizin odağını projenin kaynak kodlarının bulunduğu ana klasöre kaydırmanız gerekir. Bunun için terminale şu komutu yazıp Enter'a basın:

Bash
cd mini-katalog-app
VS Code kullanıyorsanız, doğrudan File -> Open Folder adımlarını takip ederek mini-katalog-app klasörünü editör ile açıp entegre terminali (`Ctrl + ``) de kullanabilirsiniz.

📦 Adım 3: Bağımlılıkları ve Kütüphaneleri Yükleyin
Projenin internetten veri çekebilmesi ve çalışabilmesi için kullanılan paketlerin (http kütüphanesi vb.) bilgisayarınıza indirilmesi gerekir. pubspec.yaml dosyasındaki tüm gereksinimleri otomatik olarak çözmek için şu komutu çalıştırın:

Bash
flutter pub get
Bu işlemin internet hızınıza bağlı olarak birkaç saniye sürmesi normaldir. Komut satırında herhangi bir hata kodu görmediyseniz paketler başarıyla yüklenmiştir.

🤖 Adım 4: Hedef Cihazı veya Emülatörü Hazırlayın
Uygulamayı çalıştırmadan önce kodun derleneceği bir cihazın hazır olması gerekir.

Android Studio üzerinden sanal bir Android cihazı (AVD) başlatın veya fiziksel telefonunuzu bilgisayara USB ile bağlayıp "USB Hata Ayıklama" modunu açın.

Terminale şu komutu yazarak bilgisayarınızın hedef cihazı başarıyla tanıyıp tanımadığını doğrulayın:

Bash
flutter devices
Listede en az bir adet çalışan cihaz (Android Emulator, iOS Simulator, Chrome veya macOS/Windows) görünmelidir.

⚡ Adım 5: Uygulamayı Derleyin ve Sınayın
Her şey eksiksiz olarak hazırlandığına göre artık projeyi derleme aşamasına geçebilirsiniz. Terminale şu komutu yazarak uygulamayı debug modunda başlatın:

Bash
flutter run