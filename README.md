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
    A["Smart Stove Sensors"] --> B["Edge Device (Raspberry Pi + IR Sensor + Camera)"]
    B --> C["Cookware Detection (CV Model)"]
    B --> D["Temperature Logging (via MQTT)"]
    C --> E["ML Model - Material-Aware Thermal Ramp Logic"]
    D --> E
    E --> F["Microcontroller Feedback Control (PID/RL)"]
    F --> G["Heat Application Logic"]
    D --> H["ETL Pipeline (Airflow + DBT)"]
    H --> I["Azure SQL / RDS"]
    H --> J["Blob / S3 Storage"]
    I --> K["Monitoring + Dashboard (Grafana)"]
    J --> K
    G --> L["User Interface (Web/LED Feedback)"]
```

---

## 🧰 Tech Stack

### 🔧 Backend & Infrastructure  
![Azure IoT Hub](https://img.shields.io/badge/Azure-IoT%20Hub-0078D4?logo=microsoftazure&logoColor=white&style=for-the-badge)  
![Azure SQL](https://img.shields.io/badge/Azure-SQL-0078D4?logo=microsoftazure&logoColor=white&style=for-the-badge)  
![AWS RDS](https://img.shields.io/badge/AWS-RDS-232F3E?logo=amazonaws&logoColor=white&style=for-the-badge)  
![Blob Storage](https://img.shields.io/badge/Azure-Blob%20Storage-0078D4?logo=microsoftazure&logoColor=white&style=for-the-badge)  
![S3](https://img.shields.io/badge/AWS-S3-FF9900?logo=amazonaws&logoColor=white&style=for-the-badge)

---

### 🤖 AI / Machine Learning  
![TensorFlow](https://img.shields.io/badge/TensorFlow-FF6F00?logo=tensorflow&logoColor=white&style=for-the-badge)  
![PyTorch](https://img.shields.io/badge/PyTorch-EE4C2C?logo=pytorch&logoColor=white&style=for-the-badge)  
![Stable Baselines3](https://img.shields.io/badge/Stable--Baselines3-00599C?style=for-the-badge)  
![scikit-learn](https://img.shields.io/badge/scikit--learn-F7931E?logo=scikit-learn&logoColor=white&style=for-the-badge)

---

### 🌡️ Sensors & Edge  
![Raspberry Pi](https://img.shields.io/badge/Raspberry%20Pi-CA2C92?logo=raspberrypi&logoColor=white&style=for-the-badge)  
![IR Temp Sensor](https://img.shields.io/badge/IR%20Temperature%20Sensor-Hardware-informational?style=for-the-badge)

---

### 📊 Data Orchestration  
![Apache Airflow](https://img.shields.io/badge/Apache%20Airflow-017CEE?logo=apacheairflow&logoColor=white&style=for-the-badge)  
![dbt](https://img.shields.io/badge/dbt-FF694B?logo=dbt&logoColor=white&style=for-the-badge)

---

### 🎨 User Interface  
![Streamlit](https://img.shields.io/badge/Streamlit-FF4B4B?logo=streamlit&logoColor=white&style=for-the-badge)  
![React](https://img.shields.io/badge/React-61DAFB?logo=react&logoColor=black&style=for-the-badge)  
![FastAPI](https://img.shields.io/badge/FastAPI-009688?logo=fastapi&logoColor=white&style=for-the-badge)

---

### 🚀 DevOps  
![GitHub Actions](https://img.shields.io/badge/GitHub%20Actions-2088FF?logo=githubactions&logoColor=white&style=for-the-badge)  
![Docker](https://img.shields.io/badge/Docker-2496ED?logo=docker&logoColor=white&style=for-the-badge)  
![Terraform](https://img.shields.io/badge/Terraform-623CE4?logo=terraform&logoColor=white&style=for-the-badge)


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
Absolutely! Below is a **GitHub README section** written in a clean and professional tone — tailored as if you're a **Product Manager** giving Git instructions and push guidelines to team members. It includes common push commands, how to trigger CI/CD GitHub Actions, and how to handle pull requests responsibly.

---

### 🚀 Git Push & GitHub Actions (PM Guidelines)
![CI](https://github.com/emcdo411/thermasafe-ai/actions/workflows/test-ci.yml/badge.svg)

To maintain project integrity and enable automated workflows for **ThermaSafeAI**, follow these steps when making contributions.

#### 🔄 1. Sync Your Local Branch

```bash
git checkout main
git pull origin main
```

✅ *Ensure your branch is up to date before making changes.*

#### 🛠️ 2. Stage and Commit Changes

```bash
git add .
git commit -m "Brief, clear message about what was changed"
```

📝 *Use commit messages that clearly explain **what** and **why** the change was made.*

#### 📤 3. Push and Trigger CI/CD Workflow

```bash
git push origin main
```

📡 *This automatically triggers GitHub Actions to run our `test-ci.yml` workflow.*

#### 🔀 4. Working with Feature Branches

```bash
git checkout -b feature/your-branch-name
# Make changes...
git add .
git commit -m "Add new feature XYZ"
git push origin feature/your-branch-name
```

Then, go to [Pull Requests](https://github.com/emcdo411/thermasafe-ai/pulls) and **open a new PR**.

🧪 *CI will auto-test your branch. Only merge to `main` if tests pass.*

---

### ✅ PR Approval Checklist (for Maintainers)

Before approving or merging any pull request:

* [ ] CI/CD pipeline passes (✅ green check)
* [ ] Code is modular and matches directory structure
* [ ] Naming conventions are consistent
* [ ] Sensitive credentials/secrets are not exposed
* [ ] SQL logic is safe and well-commented
* [ ] Streamlit/UI code renders correctly (if applicable)

---

Let me know if you want a badge at the top that shows build status (e.g., "Build: Passing ✅") or want to add a deployment workflow next!

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


