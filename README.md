# 🚀 System Maintenance Scripts

A collection of Bash and Python scripts designed to automate and simplify routine system maintenance tasks. These scripts handle package upgrades, removals, and system checks, providing detailed feedback through visual indicators and logs.

---

## 📋 Overview

Maintaining a Linux system often requires repetitive tasks such as updating packages, cleaning up unnecessary files, and ensuring system health. These scripts streamline those processes, saving time and reducing manual errors.

---

## 🛠️ Core Functions:

- **Languages Used**: Bash and Python
- **Tasks Performed**:
  - 🔄 System updates and upgrades
  - 🧹 Package removal (autoremove)
  - 🛠️ Fix broken packages
  - 🧼 Clean up system cache
  - 🖥️ Display detailed system information
- **Visual Feedback**: Progress bars, spinners, and color-coded logs

---

## 🌟 Features

### ⚙️ General

- **Cross-Language Support**: Scripts available in both Bash and Python.
- **Automated System Maintenance**: Perform essential maintenance tasks seamlessly.
- **Detailed Logs**: Logs with timestamps and color-coded messages for better readability.
- **Visual Enhancements**: Progress bars and spinners for a more interactive experience.
- **Reports**: Summary reports at the end of each script execution.

### 🐚 Bash Script (`maintenance.sh`)

- **Direct System Access**: Leverages `apt` for system maintenance.
- **Nordic Color Theme**: Enhanced readability through soft, visually pleasing colors.
- **Error Handling**: Stops execution on failure, logs errors clearly.
- **System Info Display**: Prints kernel, OS, architecture, and hostname at runtime.

### 🐍 Python Script (`system_management.py`)

- **Modular and Extensible**: Easy to add new features or modify tasks.
- **Uses Psutil**: Provides in-depth system statistics and health checks.
- **Interactive Animations**: Spinners, loading animations, and progress indicators.

---

## 🧩 Requirements

### Bash Script

- Bash Shell
- Root or `sudo` privileges

### Python Script

- Python 3.x
- Install dependencies:
  ```bash
  pip install -r requirements.txt
  ```
- Create a virtual environment for better isolation:
  ```bash
  python3 -m venv venv
  source venv/bin/activate
  pip install -r requirements.txt
  ```
  **Note**: A virtual environment is necessary to ensure dependency isolation.

---

## 🛠️ Installation

### Clone the Repository:

```bash
git clone https://github.com/your-username/system-maintenance-scripts.git
cd system-maintenance-scripts
```

### Bash Script:

```bash
cd bash
chmod +x maintenance.sh
sudo ./maintenance.sh
```

### Python Script:

```bash
cd python
python3 -m venv venv
source venv/bin/activate
sudo $(which python) system_management.py
```

---

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

---

## 📊 Example Output

### 🐚 Bash Script Example:

```plaintext
System Maintenance Script
=========================
[2024-12-26 15:20:09] System Information:
  OS:           GNU/Linux
  Kernel:       5.15.0-130-generic
  Architecture: x86_64
  Hostname:     Linux-Desktop

[2024-12-26 15:20:09] Step 1: Updating package list
[2024-12-26 15:20:30]   ✔ Updating package list

[2024-12-26 15:20:30] Step 2: Upgrading packages
[2024-12-26 15:20:36]   ✔ Upgrading packages

[2024-12-26 15:20:36] Step 3: Fixing broken installations
[2024-12-26 15:20:41]   ✔ Fixing broken installations

[2024-12-26 15:20:41] Step 4: Removing unnecessary packages
[2024-12-26 15:20:47]   ✔ Removing unnecessary packages

[2024-12-26 15:20:47] Step 5: Cleaning up package cache
[2024-12-26 15:20:52]   ✔ Cleaning up package cache

=========================
  Maintenance Summary Report
=========================
  Packages Upgraded: 0
  Packages Removed:  0
  Packages Fixed:    0

  Disk Space Changes:
  Filesystem      Used    Available
  /dev/sda2       36G     409G
  /dev/sda1       6.1M    505M

=========================
Maintenance Completed Successfully!
```

### 🐍 Python Script Example:

```plaintext
System Manager
=========================
Automating your system tasks

Initializing...
Starting System Management Script

  System Usage
  -------------------------
  Metric        Usage
  CPU Usage     0.3%
  Memory Usage  14.3%

No actions required at this time!

-------------------------
Final System Status:

  System Usage
  -------------------------
  Metric        Usage
  CPU Usage     0.7%
  Memory Usage  14.3%

System Management Complete!
```

---

## 🎨 Customization

### Bash Script:

Modify color themes and log formats by editing the `COLORS` array in `maintenance.sh`.

### Python Script:

Update the `system_management.py` file to add or customize maintenance tasks and visual animations.

---

## 🤝 Contribution

Contributions are welcome! Please follow the guidelines below:

1. Fork the repository.
2. Create a feature branch (`git checkout -b feature-name`).
3. Commit your changes (`git commit -m 'Add feature'`).
4. Push to the branch (`git push origin feature-name`).
5. Create a pull request.

---

## 📝 License

This project is licensed under the MIT License. See the LICENSE file for details.

---

## 💬 Feedback

If you have any suggestions or find any issues, please open an issue on the repository or contact us directly. Happy maintaining!

