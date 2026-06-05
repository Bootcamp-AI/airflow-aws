#!/bin/bash
set -e

export AIRFLOW_HOME=~/airflow
AIRFLOW_VERSION=2.9.0
PYTHON_VERSION="$(python --version | cut -d ' ' -f 2 | cut -d '.' -f 1-2)"
CONSTRAINT_URL="https://raw.githubusercontent.com/apache/airflow/constraints-${AIRFLOW_VERSION}/constraints-${PYTHON_VERSION}.txt"

echo "📦 Instalando Airflow..."
pip install "apache-airflow==${AIRFLOW_VERSION}" --constraint "${CONSTRAINT_URL}" -q

echo "🗄️ Inicializando DB..."
airflow db migrate

echo "⚙️ Configurando webserver..."
cat > ~/airflow/webserver_config.py << 'EOF'
WTF_CSRF_ENABLED = False
EOF

echo "👤 Creando usuario admin..."
airflow users create \
  --username admin \
  --password admin123 \
  --firstname Admin \
  --lastname User \
  --role Admin \
  --email admin@example.com

echo "✅ Setup completo."