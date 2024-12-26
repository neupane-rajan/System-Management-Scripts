🚀 System Maintenance Scripts
A collection of Bash and Python scripts designed to simplify and automate routine system maintenance tasks on Linux systems, specifically Debian-based distributions like Ubuntu and Linux Mint.

📋 Overview
Maintaining a Linux system often involves repetitive tasks such as updating packages, cleaning up unnecessary files, and ensuring overall system health. These scripts streamline these processes, saving time and reducing manual errors.

🛠️ Core Functions:
Languages Used: Bash and Python
Tasks Performed:
🔄 System Updates and Upgrades
🧹 Package Removal (autoremove)
🛠️ Fix Broken Packages
🧼 Clean Up System Cache
🖥️ Display Detailed System Information
Visual Feedback: Interactive progress bars, spinners, and color-coded logs for a better user experience.
🌟 Features
⚙️ General
Debian-Based Linux Only: Designed exclusively for Debian-based distributions (e.g., Ubuntu, Linux Mint).
Automated Maintenance: Perform essential system maintenance tasks effortlessly.
Detailed Logs: Logs with timestamps and color-coded messages for better readability.
Visual Enhancements: Progress bars, spinners, and animated feedback.
Reports: Summary reports at the end of the script execution.
🐚 Bash Script (maintenance.sh)
Direct System Access: Uses native apt commands for system maintenance.
Custom Colors: Nordic-inspired color themes for better readability.
Error Handling: Stops execution on failure and logs errors clearly.
System Info Display: Prints kernel, OS, architecture, and hostname.
🐍 Python Script (system_management.py)
Interactive UI: Enhanced with the rich library for detailed, visually pleasing outputs.
System Monitoring: Displays live CPU, memory, and disk usage statistics.
Modular Design: Easy to add new features or modify existing functionality.
Dependency Management: Ensures necessary Python packages are installed.
🧩 Requirements
Bash Script
Bash Shell
Root or sudo privileges
Python Script
Python 3.6+
Virtual Environment (Recommended)
Required Python Packages:
bash
Copy code
pip install psutil rich
Root or sudo privileges
🛠️ Installation
1️⃣ Clone the Repository
bash
Copy code
git clone https://github.com/your-username/system-maintenance-scripts.git
cd system-maintenance-scripts
2️⃣ Set Up Virtual Environment (For Python Script)
bash
Copy code
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
3️⃣ Running the Scripts
Bash Script (maintenance.sh):
bash
Copy code
cd bash
chmod +x maintenance.sh
sudo ./maintenance.sh
Python Script (system_management.py):
bash
Copy code
cd python
sudo $(which python3) system_management.py
📂 Folder Structure
bash
Copy code
/system-maintenance-scripts
│
├── bash
│   └── maintenance.sh
│
├── python
│   └── system_management.py
│
├── requirements.txt
└── README.md
📊 Example Outputs
Bash Script (maintenance.sh)
plaintext
Copy code
+------------------------------+
|      System Maintenance      |
+------------------------------+

[INFO] Starting system maintenance...
[INFO] Checking for updates...
[INFO] Installing updates...
[INFO] Cleaning up unnecessary files...
[INFO] Removing orphaned packages...

[INFO] System maintenance completed successfully!
+------------------------------+
Python Script (system_management.py)
Initial System Info
plaintext
Copy code
╔══════════════════════════════════════╗
║      System Management Script        ║
╚══════════════════════════════════════╝

[INFO] Running on: Linux Mint 21.3 (Virginia)
[INFO] Kernel: 5.15.0-70-generic
[INFO] Architecture: x86_64
[INFO] Hostname: example-host
Progress Indicators
plaintext
Copy code
🔄 Checking for updates...
[█████████████████████████████] 100%  

🔧 Upgrading packages...
[█████████████████████████████] 100%

🧹 Cleaning up unnecessary files...
[█████████████████████████████] 100%
Summary Report
plaintext
Copy code
+----------------+------------+
| Metric         | Value      |
+----------------+------------+
| CPU Usage      | 15%        |
| Memory Usage   | 42%        |
| Disk Usage     | 65%        |
+----------------+------------+

[INFO] Maintenance completed successfully!
🔔 Warnings
🛑 Linux Only: These scripts are designed for Debian-based distributions (e.g., Ubuntu, Linux Mint).
⚠️ Root Privileges Required: Some tasks need elevated permissions.
🤝 Contributions
Contributions are welcome! If you have suggestions for improvement or want to add new features, feel free to fork this repository and submit a pull request.

Steps to Contribute:
Fork the repository.
Create a new branch (feature-xyz).
Commit your changes.
Push your branch and submit a pull request.
📜 License
This project is licensed under the MIT License. See the LICENSE file for more details.
