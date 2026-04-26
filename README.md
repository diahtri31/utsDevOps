# 🛒 UTS DevOps - Analisis Penjualan Produk

## 📋 Deskripsi Proyek
Aplikasi Data Science sederhana untuk **analisis penjualan toko**. Menggunakan **Pandas** menghitung:
- Total penjualan dari data produk (harga × qty)
- Produk terlaris berdasarkan revenue tertinggi

**Tech Stack:** Python 3.9 + Pandas + Docker + GitHub Actions CI

## 🏗️ Arsitektur Sistem
Base Image python:3.9-slim dipilih karena ukurannya hanya ~150MB dibandingkan python:3.9 full (~900MB). Image slim sudah include Python interpreter + pip tapi tanpa tools compile yang jarang dipakai Data Science app. Hasilnya: build cepat, deployment ringan, cocok produksi startup yang hemat storage & network.

Alur komunikasi app ↔ "DB": Kontainer app (uts.py + Pandas) share volume ./data dengan kontainer checker (alpine). Meski aplikasi pure memory (no DB write), volume tetap ada untuk future persistence kalau nanti butuh simpan hasil analisis. depends_on pastikan app selesai → checker baru start (healthcheck compliant). Data flow: app tulis → volume persist → checker verifikasi.
- **Base Image `python:3.9-slim`**: Ukuran kecil (150MB vs 900MB full), aman produksi, cukup untuk Pandas [Docker Best Practices].
- **Volume `./data`**: Data persistent antar container restart. `app` tulis → `checker` baca.
- **depends_on**: `checker` tunggu `app` siap (healthcheck compliant).

## 🚀 Cara Menjalankan

### Local
```bash
pip install pandas
python uts.py
```

### Docker
```bash
docker-compose up
```

**Output:**
Total Penjualan: 2750000
Produk Terlaris: Jam


### CI/CD
Push ke `main` → **GitHub Actions** auto-lint `flake8 uts.py`

## 🛠️ File Structure
├── uts.py # Analisis penjualan
├── requirements.txt # pandas
├── Dockerfile # python:3.9-slim
├── docker-compose.yml # 2 services + volume
└── .github/workflows/ # CI Lint
└── main.yml


**Status:** ✅ Dockerized ✅ Persistent Volume ✅ CI/CD Ready

PUSH FINAL:
git add README.md
git commit -m "Add README"
git push
