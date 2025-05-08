# ⚙️ ActionForge: GitHub Workflow Automation

## 🤖 Improve Integration and Testing with GitHub Actions

### ✨ Project Overview

**ActionForge** is a GitHub Actions-based project designed to enhance integration and testing within your repositories. Its purpose is to automate and streamline development workflows, ensuring that best practices are consistently applied without manual effort. ActionForge helps you focus on meaningful development by automating checks like code style, compilation, and testing directly within your GitHub repositories.

### ⚙️ Technical Details

- **File Name**: `actionforge.yml`
- **Location**: Place it either at the root of your repository or in the `.github/workflows` folder.
- **External Actions**: Only `actions/checkout` and `pixta-dev/repository-mirroring-action` are allowed. Other external actions are strictly prohibited.
- **Secrets**: All sensitive data must be stored as secrets in GitHub. Hardcoding sensitive values will cause the project to fail.

### 🔧 Workflow Features

The GitHub Actions workflow is triggered on every push and pull request, except in the following cases:
- If the branch name starts with `ga-ignore-`
- If the current repository is the mirror repository

If either condition is met, none of the jobs will be executed.

### 💼 Jobs in the Workflow

1. **Check Coding Style**  
   Runs the coding style checker inside a Docker container. If any issues are found, they are displayed as error annotations in the commit.

2. **Check Program Compilation**  
   Runs `make` to compile the project, checks if all executables specified in the `EXECUTABLES` environment variable are present and executable, and runs `make clean`.

3. **Run Tests**  
   Executes `make tests_run` to run your tests inside a Docker container.

4. **Push to Mirror Repository**  
   Pushes changes to a mirror repository, using the secret `GIT_SSH_PRIVATE_KEY` for SSH authentication.

### 🛠️ Environment Variables
