# Laporan UAS DevOps & MLOps - Otomatisasi Infrastruktur

Proyek ini dibuat untuk memenuhi tugas UAS Semester 6. Di sini, saya mendemonstrasikan otomatisasi penyediaan (*provisioning*) infrastruktur kontainer menggunakan **Terraform** dan pengonfigurasian *environment* Data Science menggunakan **Ansible**.

---

## 🛠️ Arsitektur Proyek
* **Infrastruktur:** 1x Docker Container (Ubuntu) bernama `server_uas_analitik` yang dibuat via Terraform.
* **Konfigurasi Sistem:** Instalasi Python3, Pip, dan pustaka Python `pandas` secara otomatis via Ansible Playbook.

---

## 🚀 Langkah Eksekusi Proyek

### 1. Tahap Penyediaan Infrastruktur (Terraform)
Perintah yang digunakan untuk menginisialisasi dan membuat kontainer Docker:
```bash
terraform init
terraform apply -auto-approve

### 2. Tahap Konfigurasi Server (Ansible)
ansible-playbook -i inventory.ini playbook.yml

---

### Langkah Terakhir (Kirim ke GitHub):

Jika file `README.md` di atas sudah disimpan (`Ctrl + S`) dan foto screenshot Anda sudah ditaruh di folder yang sama dengan nama `recap.png`, sekarang saatnya kita **push ke GitHub**. 