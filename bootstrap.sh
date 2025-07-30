#!/bin/bash
# Bootstrap script to create all files inside Codespaces

mkdir -p SovereignAI-Cloud/scripts SovereignAI-Cloud/rag-api

# docker-compose.yml
cat > SovereignAI-Cloud/docker-compose.yml <<'EOF'
version: "3.8"
services:
  openwebui:
    image: ghcr.io/open-webui/open-webui:latest
    ports:
      - "8080:8080"
    environment:
      - WEBUI_ADMIN_EMAIL=admin@example.com
      - WEBUI_ADMIN_PASSWORD=changeme
    volumes:
      - openwebui-data:/data
volumes:
  openwebui-data:
EOF

# .env.example
cat > SovereignAI-Cloud/.env.example <<'EOF'
WEBUI_ADMIN_EMAIL=admin@example.com
WEBUI_ADMIN_PASSWORD=changeme
EOF

# scripts/install.sh
cat > SovereignAI-Cloud/scripts/install.sh <<'EOF'
#!/bin/bash
sudo apt update && sudo apt install -y docker.io docker-compose
sudo docker compose up -d
EOF
chmod +x SovereignAI-Cloud/scripts/install.sh

echo "✅ Files created! You can now run this bootstrap in Codespaces."
