# 🚀 System Maintenance Scripts

A collection of **Bash and Python** scripts designed to automate and simplify routine system maintenance tasks. These scripts handle package upgrades, removals, and system checks, providing detailed feedback through visual indicators and logs.

---

## 📋 Overview

Maintaining a Linux system often requires repetitive tasks such as updating packages, cleaning up unnecessary files, and ensuring system health. These scripts streamline those processes, saving time and reducing manual errors.

### 🛠️ Core Functions:
- **Languages Used:** Bash and Python
- **Tasks Performed:**
  - 🔄 System updates and upgrades
  - 🧹 Package removal (autoremove)
  - 🛠️ Fix broken packages
  - 🧼 Clean up system cache
  - 🖥️ Display detailed system information
- **Visual Feedback:** Progress bars, spinners, and color-coded logs

---

## 🌟 Features

### ⚙️ General
- **Cross-Language Support:** Scripts available in both Bash and Python.
- **Automated System Maintenance:** Perform essential maintenance tasks seamlessly.
- **Detailed Logs:** Logs with timestamps and color-coded messages for better readability.
- **Visual Enhancements:** Progress bars and spinners for a more interactive experience.
- **Reports:** Summary reports at the end of each script execution.

### 🐚 Bash Script (maintenance.sh)
- **Direct System Access:** Leverages `apt` for system maintenance.
- **Nordic Color Theme:** Enhanced readability through soft, visually pleasing colors.
- **Error Handling:** Stops execution on failure, logs errors clearly.
- **System Info Display:** Prints kernel, OS, architecture, and hostname at runtime.

### 🐍 Python Script (maintenance.py)
- **Modular and Extensible:** Easy to add new features or modify tasks.
- **Uses Psutil:** Provides in-depth system statistics and health checks.
- **Parallel Processing:** Potential for concurrent package operations.

---

## 🧩 Requirements

### Bash Script
- Bash Shell
- Root or sudo privileges

### Python Script
- Python 3.x
- `psutil` (Install via `pip install psutil`)
- Root or sudo privileges

---

## 🛠️ Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/your-username/system-maintenance-scripts.git
   cd system-maintenance-scripts
   ```

2. Navigate to the appropriate directory:
   - Bash script: `cd bash`
   - Python script: `cd python`

3. For Bash:
   ```bash
   chmod +x maintenance.sh
   sudo ./maintenance.sh
   ```

4. For Python:
   ```bash
   sudo python3 maintenance.py
   ```

---

## 📂 Folder Structure
```
/system-maintenance-scripts
│
├── bash
│   └── maintenance.sh
│
├── python
│   └── maintenance.py
│
└── README.md
```

---

## 🎨 Customization
- **Bash:** Modify color themes and log formats by updating the `COLORS` array.
- **Python:** Extend functionality by adding new modules or expanding existing functions.

---

## 📊 Example Output
```
╔══════════════════════════════════════╗
║      System Maintenance Script       ║
╚══════════════════════════════════════╝
[2024-12-26 12:00:00] System Information:
OS:          GNU/Linux
Kernel:      5.15.0-70-generic
Architecture: x86_64
Hostname:    example-host

[▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓] 100%
[2024-12-26 12:05:00] ✔ Upgrading packages
```

---

## 🤝 Contribution

Contributions are welcome! If you have ideas for new features or want to improve existing scripts, feel free to open an issue or submit a pull request.

1. Fork the repo
2. Create a new branch (`feature-xyz`)
3. Commit changes
4. Submit a pull request

---

## 📜 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

