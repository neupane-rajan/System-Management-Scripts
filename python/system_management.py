import os
import psutil
import subprocess
from rich.console import Console
from rich.table import Table
from rich.progress import Progress
from rich.text import Text
from rich.panel import Panel
from rich.live import Live
import time
import random

console = Console()

def run_command(command):
    """Run a shell command and capture its output."""
    result = subprocess.run(command, shell=True, text=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    return result.stdout, result.stderr

def show_system_info():
    """Display CPU and Memory usage."""
    cpu_usage = psutil.cpu_percent(interval=1)
    memory_info = psutil.virtual_memory()
    memory_usage = memory_info.percent

    table = Table(title="System Usage")
    table.add_column("Metric", justify="center", style="cyan", no_wrap=True)
    table.add_column("Usage", justify="center", style="magenta")

    table.add_row("CPU Usage", f"{cpu_usage}%")
    table.add_row("Memory Usage", f"{memory_usage}%")

    console.print(table)

def show_loading_animation(message, duration=3):
    """Display a more detailed loading animation."""
    frames = ["|", "/", "-", "\\"]
    with Live(console=console, refresh_per_second=10) as live:
        for _ in range(duration * 10):
            for frame in frames:
                live.update(Panel(f"[bold cyan]{message} [bold yellow]{frame}", border_style="bright_blue"))
                time.sleep(0.1)

def show_start_animation():
    """Display a starting animation with a large font title."""
    title = Text("System Manager", style="bold green", justify="center")
    subtitle = Text("Automating your system tasks", style="bold cyan", justify="center")

    console.print(Panel.fit(title, border_style="green"))
    console.print(Panel.fit(subtitle, border_style="cyan"))

    initializing_message = Text("Initializing...", style="bold green")
    for char in str(initializing_message):
        console.print(char, end="", style="bold green")
        time.sleep(0.05)
    console.print()  # Move to next line

def show_completion_animation():
    """Display a completion animation with enhanced effects."""
    effects = [
        "[bold green]✔[/bold green] Task Completed!",
        "[bold blue]✔✔[/bold blue] Task Completed!",
        "[bold yellow]✔✔✔[/bold yellow] Task Completed!",
        "[bold green]All Tasks Successfully Completed![/bold green]"
    ]
    for effect in effects:
        console.print(Panel(effect, border_style="bright_green"))
        time.sleep(0.5)

    final_message = Text("System Management Complete!", justify="center", style="bold magenta")
    console.print(Panel(final_message, border_style="bold magenta"))

def show_nothing_to_do_message():
    """Display a message when there is nothing to update or remove."""
    animations = [
        "[bold yellow]Nothing to do![/bold yellow]",
        "[bold green]System is already up to date![/bold green]",
        "[bold cyan]No actions required at this time![/bold cyan]",
    ]
    with Live(console=console, refresh_per_second=3) as live:
        for _ in range(3):
            for animation in animations:
                live.update(Panel(animation, border_style="bright_red"))
                time.sleep(0.7)

    final_message = Text("Ending Script Here.", style="bold magenta", justify="center")
    console.print(Panel(final_message, border_style="bright_magenta"))

def check_and_run_updates():
    """Check if updates/removals are needed, and execute accordingly."""
    stdout, stderr = run_command("apt list --upgradable 2>/dev/null | grep -v Listing")
    updates_available = bool(stdout.strip())

    stdout, stderr = run_command("sudo apt-get --dry-run autoremove | grep '^Remv'")
    removals_available = bool(stdout.strip())

    if not updates_available and not removals_available:
        show_nothing_to_do_message()
        return False

    if updates_available:
        console.print("[bold green]Updates are available![/bold green]")
    if removals_available:
        console.print("[bold yellow]Removals are available![/bold yellow]")
    return True

def update_and_upgrade():
    """Update and upgrade the system."""
    console.print("[bold green]Updating and Upgrading the system...[/bold green]")
    with Progress() as progress:
        task = progress.add_task("[cyan]Updating...", total=100)
        stdout, stderr = run_command("sudo apt-get update -y")
        progress.update(task, advance=50)
        time.sleep(1)
        stdout, stderr = run_command("sudo apt-get upgrade -y")
        progress.update(task, advance=50)

    console.print("[bold green]Update and Upgrade Completed![/bold green]")
    console.print(f"[blue]{stdout}[/blue]")

def autoremove():
    """Perform autoremove to clean up unnecessary packages."""
    console.print("[bold yellow]Running autoremove...[/bold yellow]")
    stdout, stderr = run_command("sudo apt-get autoremove -y")
    console.print("[bold yellow]Autoremove Completed! Removed Files:[/bold yellow]")
    console.print(f"[red]{stdout}[/red]")

def fix_broken_install():
    """Fix broken installations."""
    console.print("[bold cyan]Fixing broken installations...[/bold cyan]")
    stdout, stderr = run_command("sudo apt-get install -f -y")
    console.print("[bold cyan]Broken Installations Fixed![/bold cyan]")
    console.print(f"[blue]{stdout}[/blue]")

def main():
    """Main function to run the script."""
    show_start_animation()
    console.print("[bold green]Starting System Management Script[/bold green]", style="bold")

    show_system_info()

    if not check_and_run_updates():
        console.print("\n[bold green]Final System Status:[/bold green]")
        show_system_info()
        console.print("\n[bold magenta]System Management Complete![/bold magenta]")
        return

    show_loading_animation("Updating and upgrading...")
    update_and_upgrade()

    show_loading_animation("Fixing broken installations...")
    fix_broken_install()

    show_loading_animation("Running autoremove...")
    autoremove()

    console.print("\n[bold green]Final System Status:[/bold green]")
    show_system_info()

    show_completion_animation()

if __name__ == "__main__":
    main()
