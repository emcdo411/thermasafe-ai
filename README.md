# 🔥 ThermaSafeAI: Smart Stove Safety via AI & IoT

![Python](https://img.shields.io/badge/Python-3.10-blue?logo=python)
![TensorFlow](https://img.shields.io/badge/TensorFlow-2.14-orange?logo=tensorflow)
![OpenCV](https://img.shields.io/badge/OpenCV-4.8-green?logo=opencv)
![Azure IoT](https://img.shields.io/badge/Azure%20IoT-Cloud-blue?logo=microsoft-azure)
![Airflow](https://img.shields.io/badge/Airflow-Orchestration-blue?logo=apache-airflow)
![GitHub Actions](https://img.shields.io/badge/GitHub%20Actions-CI%2FCD-lightblue?logo=githubactions)
![Streamlit](https://img.shields.io/badge/Streamlit-UI-red?logo=streamlit)

---

## 🧭 Project Overview

**ThermaSafeAI** is an AI-powered stovetop safety system designed to protect sensitive cookware like Pyrex from shattering due to thermal shock. By integrating IoT sensors, AI-driven heat control algorithms, and real-time monitoring, this solution helps ensure safe and efficient cooking for all households.

---

## 🗺️ System Architecture

```mermaid
graph TD
    A[Smart Stove Sensors] --> B[Edge Device (Raspberry Pi + IR Sensor + Camera)]
    B --> C[Cookware Detection (CV Model)]
    B --> D[Temperature Logging (via MQTT)]
    C --> E[ML Model - Material-Aware Thermal Ramp Logic]
    D --> E
    E --> F[Microcontroller Feedback Control (PID/RL)]
    F --> G[Heat Application Logic]
    D --> H[ETL Pipeline (Airflow + DBT)]
    H --> I[Azure SQL / RDS]
    H --> J[Blob / S3 Storage]
    I --> K[Monitoring + Dashboard (Grafana)]
    J --> K
    G --> L[User Interface (Web/LED Feedback)]
```

---

## 📦 Tech Stack

- **Backend & Infra**: Azure IoT Hub, Azure SQL / AWS RDS, Blob/S3 Storage
- **AI/ML**: TensorFlow, PyTorch, Stable-Baselines3, scikit-learn
- **Sensors**: IR Temperature Sensor, Raspberry Pi + Camera
- **Data Orchestration**: Apache Airflow, DBT
- **UI**: Streamlit or React + FastAPI
- **DevOps**: GitHub Actions, Docker, Terraform

---

## 🗃️ Folder Structure

```bash
ThermaSafeAI/
├── data/                  # Raw and processed sensor data
├── scripts/               # ML training, inference scripts
├── models/                # Trained AI models
├── notebooks/             # Jupyter exploration
├── infra/                 # Terraform scripts, Dockerfiles
├── etl/                   # Airflow/DBT ETL pipelines
├── dashboard/             # Streamlit dashboard code
└── .github/workflows/     # GitHub CI/CD YAML configs
```

---

## 🧠 Core Features

- 📸 **Cookware Detection**: Uses OpenCV to identify cookware and materials
- 🌡️ **Heat Prediction Model**: ML-based ramp rate logic to reduce thermal stress
- 🔄 **PID + RL Feedback Loop**: Smart control of burners based on cookware material
- 📊 **Real-time Monitoring**: Dashboards for thermal trends and heat anomalies
- ⚠️ **Risk Alerts**: Notifies user of unsafe heating patterns

---

## 🧪 Example SQL Tables

```sql
CREATE TABLE cookware_events (
    id SERIAL PRIMARY KEY,
    cookware_type VARCHAR(50),
    material VARCHAR(50),
    detection_confidence FLOAT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE temp_ramp_logs (
    id SERIAL PRIMARY KEY,
    cookware_id INT REFERENCES cookware_events(id),
    surface_temp FLOAT,
    ambient_temp FLOAT,
    heating_state VARCHAR(20),
    ramp_rate FLOAT,
    risk_flag BOOLEAN,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

---

## 🛠️ Local Setup

```bash
git clone https://github.com/yourusername/ThermaSafeAI.git
cd ThermaSafeAI
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

---

## 🚦 GitHub CI Workflow (./github/workflows/ci.yml)

```yaml
name: CI Pipeline

on: [push, pull_request]

jobs:
  build-and-test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Set up Python
        uses: actions/setup-python@v4
        with:
          python-version: 3.10
      - name: Install dependencies
        run: |
          pip install -r requirements.txt
      - name: Run Unit Tests
        run: |
          pytest tests/
```

---

## 📈 Dashboard Example (Mock)

- Thermographic heat maps from IR sensors
- Safe/Unsafe thresholds highlighted in red
- Streamlit widgets for burner control simulation

---

## 🤝 Contributors

**Erwin Maurice McDonald** – Project Lead, AI Strategist, Solutions Architect  
**Stakeholder Team** – Advisory and Industrial Safety Oversight

---

## 💡 Why This Matters

Each year, dozens of kitchen accidents occur due to thermal shock. Most are preventable. This project brings together AI, IoT, and real-time control systems to deliver **safer, smarter kitchens** with industrial-grade tech.

---

## 📬 Contact

For collaboration or inquiries, contact: [moe.mcdonald@gmail.com](mailto:moe.mcdonald@gmail.com)

---

*Built with ❤️ by a veteran innovator exploring the edge of AI, safety, and hardware.*

