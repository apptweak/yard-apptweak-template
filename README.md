# AppTweak Ruby YARD Template

This is the customized YARD template that the AppTweak team can use to generate YARD documentation for their Ruby codebase. It is made available for easy re-use.

## Features

- Custom styling aligned with AppTweak branding
- Optimized layout for Ruby documentation
- Improved navigation and searchability

## Installation

Make sure YARD and yard-apptweak-template are installed:

```bash
gem install yard
gem install yard-apptweak-template
```

## Development Scripts

The repository includes several utility scripts in the `bin` directory:

### bin/setup
Sets up the development environment by installing dependencies and configuring development hooks:
```bash
bin/setup
```

### bin/console
Launches an interactive Ruby console with the gem already loaded:
```bash
bin/console
```

### bin/new_release
Manages the release process for the gem, including version bumping, commit creation, and tagging:
```bash
bin/new_release
```

## Configuration

Example `.yardopts` configuration file:

```
--title "AppTweak Ruby Documentation"
--no-api
--no-private
--plugin yard-apptweak-template
**/*.rb
-
docs/*.md
```

## Usage

### Generate Documentation
```bash
yardoc --plugin apptweak-template
```

### Exclude a Specific Version
```bash
yardoc --query '@version.text != "AppTweak 2018"'
```

### Generate Stubs
```bash
yardoc -t stubs -f text
```

### Generate Coverage Manifest
```bash
yardoc -t coverage -f text
```

## Contributing

Contributions to improve this template are welcome. Please submit a pull request to discuss/challenge the proposed changes.


## License

Copyright (c) 2025 AppTweak. All rights reserved.

## Contact

This project is maintained by the AppTweak Developer Experience team.
For questions or support, please contact the AppTweak DevEx team on Slack.

Made with ❤️ by the AppTweak DevEx team