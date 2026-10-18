# هریس‌گرد — Android WebView

پروژهٔ Android Studio با Java برای نمایش نسخهٔ محلی وب‌اپ هریس‌گرد.

## مشخصات
- Application ID: `ir.harisgard.app`
- Java 17، minSdk 24، targetSdk 34، compileSdk 34
- Android Gradle Plugin 8.2.2 و Gradle 8.6
- فایل وب: `app/src/main/assets/index.html`
- GitHub Actions: ساخت خودکار APK و انتشار آن به‌صورت Artifact

## ساخت در Android Studio
1. ZIP را استخراج و پوشهٔ `HarisgardAndroid` را در Android Studio باز کنید.
2. با JDK 17 و Android SDK Platform 34 همگام‌سازی Gradle را انجام دهید.
3. از مسیر **Build > Build Bundle(s) / APK(s) > Build APK(s)** خروجی بگیرید.

## ساخت در GitHub
1. تمام محتوای این پوشه را در ریشهٔ مخزن GitHub آپلود کنید.
2. به تب **Actions** بروید و workflow با نام **Build Harisgard APK** را اجرا کنید یا یک commit به شاخهٔ `main`/`master` بفرستید.
3. پس از پایان موفق، فایل `harisgard-debug-apk` را از بخش Artifacts دانلود کنید.

## نکته دربارهٔ Gradle Wrapper
به‌علت اینکه فایل باینری رسمی `gradle-wrapper.jar` در این محیط قابل دریافت نبود، اسکریپت‌های `gradlew` و `gradlew.bat` یک bootstrap سبک برای دانلود و اجرای Gradle 8.6 هستند؛ آن‌ها Wrapper رسمیِ مبتنی بر JAR نیستند. در GitHub Actions ساخت با Gradle 8.6 نصب‌شده توسط action انجام می‌شود.

## امنیت و محدودیت‌ها
- JavaScript و DOM Storage برای وب‌اپ فعال‌اند.
- دسترسی فایل محلی در WebView غیرفعال است؛ دارایی‌ها با `WebViewAssetLoader` ارائه می‌شوند.
- مجوز `INTERNET` برای قابلیت‌های آنلاین احتمالی وب‌اپ فعال است؛ ترافیک HTTP بدون رمزنگاری به‌طور پیش‌فرض مسدود است (`usesCleartextTraffic=false`).
- این پروژه در این محیط روی Android SDK/Gradle اجرا و build نشده است؛ بنابراین تولید APK و اجرای واقعی روی دستگاه هنوز تأیید نشده‌اند.
- این APK از نوع debug است و برای انتشار در فروشگاه باید نسخهٔ release امضاشده و الزامات فروشگاه جداگانه آماده شوند.
