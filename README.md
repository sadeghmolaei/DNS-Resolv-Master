
# DNS Switcher Bash Script

🛠️ A simple and interactive bash script to **change your system DNS servers** from a predefined list of public/private resolvers.  
Ideal for Linux users who want to quickly test or switch between providers (e.g. Shecan, Cloudflare, Quad9, Google, etc.).

## 📦 Features

- Simple text menu interface
- Auto-backup of `/etc/resolv.conf`
- 18+ DNS profiles to choose from
- Supports local DNS like `127.0.0.53`, Radar, etc.
- Restores `search` and `options` lines if available

---

## 🚀 How to Use

```bash
git clone https://github.com/sadeghmolaei/DNS-Resolv-Master.git
cd dns-switcher
chmod +x dns-switcher.sh
sudo ./dns-switcher.sh
```

Then choose a provider number from the list. The script will:
1. Backup your `/etc/resolv.conf`
2. Replace it with selected DNS servers
3. Show current active DNS

---

## 🌐 DNS Providers Menu

| Provider         | Primary IP     | Secondary IP    |
|:-----------------|:---------------|:----------------|
| Shecan           | 178.22.122.100 | 185.51.200.2    |
| Radar            | 10.202.10.10   | 10.202.10.11    |
| Electro          | 78.157.42.100  | 78.157.42.101   |
| Begzar           | 185.55.226.26  | 185.55.226.25   |
| DNS Pro          | 87.107.110.109 | 87.107.110.110  |
| 403              | 10.202.10.202  | 10.202.10.102   |
| Google           | 8.8.8.8        | 8.8.4.4         |
| Cloudflare       | 1.1.1.1        | 1.0.0.1         |
| Quad9            | 9.9.9.9        | 149.112.112.112 |
| Ultra-DNS1       | 64.6.64.6      | 64.6.65.6       |
| Ultra-DNS2       | 156.154.70.2   | 165.154.71.2    |
| NTT              | 129.250.35.250 | 129.250.35.251  |
| DNS-XBOX         | 37.220.84.124  | -               |
| OpenDNS          | 208.67.222.222 | 208.67.220.220  |
| MCI              | 208.67.220.200 | 208.67.222.222  |
| MTN-Irancel      | 74.82.42.42    | -               |
| Rightel          | 91.239.100.100 | 89.223.43.71    |
| Reset to Default | 127.0.0.53     | -               |

---

## 📝 License

MIT License – feel free to copy, modify, and distribute this script.

---

# اسکریپت تغییر DNS در لینوکس

🔧 این اسکریپت Bash به شما اجازه می‌دهد تا به‌صورت **سریع و تعاملی DNS سیستم خود را تغییر دهید**.  
DNSهای رایج ایران و بین‌المللی (مثل گوگل، کلودفلر، شکن، اپن‌دی‌ان‌اس و...) پشتیبانی می‌شود.

## 🎯 امکانات

- رابط منویی ساده در ترمینال
- تهیه بکاپ از `/etc/resolv.conf` قبل از اعمال تغییر
- بیش از ۱۸ پروفایل DNS قابل انتخاب
- بازیابی تنظیمات `search` و `options` در فایل resolv.conf

---

## 📥 نحوه استفاده

```bash
git clone https://github.com/sadeghmolaei/DNS-Resolv-Master.git
cd dns-switcher
chmod +x dns-switcher.sh
sudo ./dns-switcher.sh
```

سپس عدد مربوط به DNS موردنظر را انتخاب کنید. اسکریپت:
1. از فایل فعلی بکاپ می‌گیرد
2. آدرس DNS جدید را وارد می‌کند
3. DNS فعال فعلی را نشان می‌دهد

---

## 📋 فهرست کامل منوی DNS

| Provider         | Primary IP     | Secondary IP    |
|:-----------------|:---------------|:----------------|
| Shecan           | 178.22.122.100 | 185.51.200.2    |
| Radar            | 10.202.10.10   | 10.202.10.11    |
| Electro          | 78.157.42.100  | 78.157.42.101   |
| Begzar           | 185.55.226.26  | 185.55.226.25   |
| DNS Pro          | 87.107.110.109 | 87.107.110.110  |
| 403              | 10.202.10.202  | 10.202.10.102   |
| Google           | 8.8.8.8        | 8.8.4.4         |
| Cloudflare       | 1.1.1.1        | 1.0.0.1         |
| Quad9            | 9.9.9.9        | 149.112.112.112 |
| Ultra-DNS1       | 64.6.64.6      | 64.6.65.6       |
| Ultra-DNS2       | 156.154.70.2   | 165.154.71.2    |
| NTT              | 129.250.35.250 | 129.250.35.251  |
| DNS-XBOX         | 37.220.84.124  | -               |
| OpenDNS          | 208.67.222.222 | 208.67.220.220  |
| MCI              | 208.67.220.200 | 208.67.222.222  |
| MTN-Irancel      | 74.82.42.42    | -               |
| Rightel          | 91.239.100.100 | 89.223.43.71    |
| Reset to Default | 127.0.0.53     | -               |

---

## 🔒 لایسنس

این پروژه تحت لایسنس MIT منتشر شده و استفاده، ویرایش و انتشار آن آزاد است ✅

---

## ✨ توسعه

پیشنهادات و pull requestهای شما برای افزودن DNSهای بیشتر یا قابلیت‌های جدید پذیرفته می‌شود.  
با ستاره ⭐ در گیت‌هاب حمایت کنید!
