# Contributing to GPS CLI

Thank you for considering contributing to GPS CLI! 🎉

## 🤝 How to Contribute

### Reporting Bugs 🐛

If you find a bug, please create an issue with:
- Clear description of the problem
- Steps to reproduce
- Expected vs actual behavior
- Your environment (OS, shell, versions)
- Relevant logs from `~/.config/gps-cli/gps.log`

### Suggesting Features 💡

We welcome feature suggestions! Please create an issue with:
- Clear description of the feature
- Use case / problem it solves
- Example usage or mockup
- Any relevant technical details

### Pull Requests 🔧

1. **Fork the repository**
   ```bash
   gh repo fork alexcolls/gps-cli --clone
   ```

2. **Create a feature branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

3. **Make your changes**
   - Follow existing code style
   - Add comments for complex logic
   - Update documentation if needed
   - Test on multiple platforms if possible

4. **Commit with emojis** (following project convention)
   ```bash
   git commit -m "✨ Add new feature description"
   ```

   Common emojis:
   - ✨ New feature
   - 🐛 Bug fix
   - 📖 Documentation
   - 🔧 Configuration
   - 🎨 UI/UX improvements
   - ⚡ Performance
   - 🔒 Security
   - 🧪 Tests

5. **Push and create PR**
   ```bash
   git push origin feature/your-feature-name
   gh pr create
   ```

## 📝 Code Guidelines

### Bash Script Style

- Use 4 spaces for indentation
- Use `snake_case` for function names
- Use `UPPER_CASE` for constants
- Add comments for non-obvious logic
- Use `shellcheck` to validate scripts

### Testing

Before submitting:
```bash
# Test syntax
bash -n gps
bash -n install.sh

# Test basic commands
./gps help
./gps providers

# Test installation
./install.sh
```

### Documentation

- Update README.md for new features
- Update CHANGELOG.md following semantic versioning
- Add usage examples
- Update command reference if adding new commands

## 🛠️ Development Setup

```bash
# Clone your fork
git clone https://github.com/YOUR_USERNAME/gps-cli.git
cd gps-cli

# Make changes
chmod +x gps
./gps help

# Test locally
./install.sh
gps help
```

## 🎯 Project Structure

```
gps-cli/
├── gps              # Main CLI script
├── install.sh       # Installation script
├── README.md        # Main documentation
├── CHANGELOG.md     # Version history
├── .env.sample      # Configuration template
├── providers/       # Provider implementations
└── utils/           # Utility scripts
```

## 🌟 Areas to Contribute

### High Priority
- [ ] Enhanced GPS hardware support
- [ ] Additional tracking providers
- [ ] Battery optimization modes
- [ ] Geofencing alerts
- [ ] Export location data (CSV, KML)

### Medium Priority
- [ ] Web dashboard interface
- [ ] Multiple device tracking
- [ ] Encryption for all providers
- [ ] Wi-Fi positioning support
- [ ] Bluetooth beacon support

### Documentation
- [ ] Video tutorials
- [ ] Provider-specific guides
- [ ] Troubleshooting examples
- [ ] Translation to other languages

## 🔍 Code Review Process

1. Automated tests must pass
2. Code reviewed by maintainer
3. Documentation updated
4. CHANGELOG.md updated
5. Merged to main branch

## 📜 Commit Message Format

Use conventional commits with emojis:

```
<emoji> <type>: <description>

[optional body]

[optional footer]
```

Examples:
```
✨ feat: Add OwnTracks MQTT support
🐛 fix: Resolve IP geolocation fallback issue
📖 docs: Update Traccar setup instructions
🔧 config: Add new environment variables
```

## 🙏 Recognition

Contributors will be:
- Listed in README.md contributors section
- Mentioned in release notes
- Given credit in documentation

## 📞 Questions?

- Open a discussion on GitHub
- Check existing issues
- Review documentation

Thank you for helping make GPS CLI better! 🛰️
