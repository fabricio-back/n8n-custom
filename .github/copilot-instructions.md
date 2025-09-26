<!-- Use this file to provide workspace-specific custom instructions to Copilot. For more details, visit https://code.visualstudio.com/docs/copilot/copilot-customization#_use-a-githubcopilotinstructionsmd-file -->

# n8n Custom Docker Project

This project creates a custom n8n Docker image with Chromium browser support for enhanced automation capabilities.

## Project Structure
- `Dockerfile` - Main Docker configuration extending n8n official image
- `README.md` - Project documentation and usage instructions
- `.github/` - GitHub configuration and Copilot instructions

## Development Guidelines
- The Dockerfile extends the official n8n:latest image
- Adds Chromium browser for browser automation workflows
- Maintains security by switching back to node user after package installation
- Keep the image lightweight and secure

## Build Instructions
- Use `docker build -t n8n-custom .` to build the image
- Run with appropriate environment variables for n8n configuration

## Completed Tasks
- [x] Project structure created
- [x] Dockerfile created with Chromium support
- [x] README.md documentation added
- [x] GitHub repository structure prepared