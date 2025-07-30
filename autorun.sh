#!/bin/bash

echo "🔥 بدء التثبيت الكامل لـ SovereignAI-Cloud ..."

# تحديث النظام وتثبيت الأدوات الأساسية
sudo apt update && sudo apt install -y unzip docker.io docker-compose git curl

# تحميل النسخة السيادية وتجهيزها
mkdir -p SovereignAI-Cloud && cd SovereignAI-Cloud

# تحميل الحزمة (ستحمل كل الملفات تلقائيًا)
curl -L -o kit.zip https://sandbox.chat.openai.com/mnt/data/SovereignAI-Cloud_kit.zip
unzip kit.zip

# تشغيل الخدمات
sudo docker compose pull
sudo docker compose up -d

echo "✅ النسخة السيادية أصبحت جاهزة! افتح المنفذ 8080 ثم اختر Open in Browser"
