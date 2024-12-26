# 🚀 System Maintenance Scripts

A collection of Bash and Python scripts designed to automate and simplify routine system maintenance tasks. These scripts handle package upgrades, removals, and system checks, providing detailed feedback through visual indicators and logs.

## 📋 Overview

Maintaining a Linux system often requires repetitive tasks such as updating packages, cleaning up unnecessary files, and ensuring system health. These scripts streamline those processes, saving time and reducing manual errors.

## 🛠️ Core Functions:

### Languages Used:
- **Bash**
- **Python**

### Tasks Performed:
- 🔄 **System updates and upgrades**
- 🧹 **Package removal (autoremove)**
- 🛠️ **Fix broken packages**
- 🧼 **Clean up system cache**
- 🖥️ **Display detailed system information**

### Visual Feedback:
- **Progress bars, spinners, and color-coded logs**

## 🌟 Features

### ⚙️ General
- **Cross-Language Support:** Scripts available in both Bash and Python.
- **Automated System Maintenance:** Perform essential maintenance tasks seamlessly.
- **Detailed Logs:** Logs with timestamps and color-coded messages for better readability.
- **Visual Enhancements:** Progress bars and spinners for a more interactive experience.
- **Reports:** Summary reports at the end of each script execution.

### 🐚 Bash Script (`maintenance.sh`)
- **Direct System Access:** Leverages `apt` for system maintenance.
- **Nordic Color Theme:** Enhanced readability through soft, visually pleasing colors.
- **Error Handling:** Stops execution on failure, logs errors clearly.
- **System Info Display:** Prints kernel, OS, architecture, and hostname at runtime.

### 🐍 Python Script (`system_management.py`)
- **Modular and Extensible:** Easy to add new features or modify tasks.
- **Uses Psutil:** Provides in-depth system statistics and health checks.
- **Interactive Animations:** Spinners, loading animations, and progress indicators.

## 🧩 Requirements

### Bash Script
- **Bash Shell**
- **Root or sudo privileges**

### Python Script
- **Python 3.x**
- **Install dependencies:**

```bash
pip install -r requirements.txt
```

- **Create a virtual environment for better isolation:**

```bash
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

## 🛠️ Installation

1. **Clone the Repository:**

```bash
git clone https://github.com/your-username/system-maintenance-scripts.git
cd system-maintenance-scripts
```

2. **Bash Script:**

```bash
cd bash
chmod +x maintenance.sh
sudo ./maintenance.sh
```

3. **Python Script:**

```bash
cd python
python3 -m venv venv
source venv/bin/activate
sudo $(which python) system_management.py
```

## 📂 Folder Structure

```bash
/system-maintenance-scripts
│
├── bash
│   └── maintenance.sh
│
├── python
│   ├── system_management.py
│   ├── requirements.txt
│
└── README.md
```

## 📊 Example Output

### 🐚 Bash Script Example:

```bash
System Maintenance Script
=========================
[INFO] Starting system maintenance.
[INFO] Updating package lists... ✔
[INFO] Upgrading packages... ✔
[INFO] Cleaning up unnecessary packages... ✔
[INFO] All tasks completed successfully.
```

### 🐍 Python Script Example:

```bash
System Maintenance Script
=========================
CPU Usage: 15%
Memory Usage: 45%

Performing updates...
[██████████████████████████████████████] 100%

Performing autoremove...
[██████████████████████████████████████] 100%

✔ All tasks completed successfully!
```

## 🎨 Customization

- **Bash Script:** Modify color themes and log formats by editing the `COLORS` array in `maintenance.sh`.
- **Python Script:** Extend functionality by adding new modules or updating existing ones in `system_management.py`.

## 🤝 Contribution

Contributions are welcome! To contribute:

1. Fork the repository.
2. Create a new branch (`feature-xyz`).
3. Make your changes.
4. Submit a pull request.

## 📜 License

This project is licensed under the MIT License. See the LICENSE file for details.
