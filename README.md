# ritt – Redmine issue time tracker

**ritt** is a cross‑platform Flutter desktop app for tracking time on Redmine issues. Start timers directly from your issue list, keep everything stored locally, and post tracked time to Redmine as time entries.

> ⚠️ ritt is not affiliated with or endorsed by Redmine.

## Features

- Connects to Redmine via API key
- Track time with local timers, then post to Redmine as time entries
- Manual timers for work that isn’t tied to an issue
- Issues table with local filtering, grouping, sorting, and more
- Double‑click an issue row to create a timer for that issue
- Persistent storage (settings, timers, issues table layout)
- Responsive UI for desktops, tablets, and larger screens

## Pages

### Settings
![Settings page](https://github.com/bobby-bloom/redmine_issue_time_tracker/tree/main/assets/project/settings_page.png)
Configure Redmine connectivity and timer behavior:

- Base URL and API key
- Issue status filter; optional “only assigned to me”
- Allow multiple running timers
- Auto-delete timers after posting
- Rounding interval
- Default billable tracker name (Easy Redmine only)

### Timers
![Timers page](https://github.com/bobby-bloom/redmine_issue_time_tracker/tree/main/assets/project/timers_page.png)
Your timer workspace:

- Start/pause/reset timers, edit and delete
- Timers can be linked to a Redmine issue
- Post tracked time as a Redmine time entry
- Timers are stored locally and survive app restarts

### Issues
![Issues page](https://github.com/bobby-bloom/redmine_issue_time_tracker/tree/main/assets/project/issues_page.png)
Browse issues in a configurable table:

- Columns include status, timer state, ID, tracker, subject, priority, project, due date
- Local filtering/sorting and basic column configuration
- Status group counts
- Double‑click a row to create a timer for that issue

## Getting started (run & build)

### Prerequisites
- Flutter SDK installed (stable channel recommended)
- Desktop support enabled for your platform

Check your setup:
```bash
flutter doctor
```

Enable desktop (only needed once):
```bash
flutter config --enable-linux-desktop
flutter config --enable-windows-desktop
flutter config --enable-macos-desktop
```

### Run from source
Clone and run:
```bash
git clone https://github.com/bobby-bloom/redmine_issue_time_tracker.git ritt
cd ritt
flutter pub get
flutter run -d linux   # or: windows / macos
```

### Build a release binary
Linux:
```bash
flutter build linux --release
# Output: build/linux/*/release/bundle/
```

Windows:
```bash
flutter build windows --release
# Output: build/windows/x64/runner/Release/
```

macOS:
```bash
flutter build macos --release
# Output: build/macos/Build/Products/Release/
```
