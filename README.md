# 🍫 Chocolatine

## 🤖 Improve Integration and Testing with GitHub Actions

### ✨ Project Overview

**Chocolatine** is a GitHub Actions-based project designed to enhance integration and testing within your repositories. The idea is to automate and streamline development workflows, ensuring that best practices are followed without manual intervention. Chocolatine helps you focus on what matters by automating checks like code style, compilation, and testing directly within your GitHub repositories.

### ⚙️ Technical Details

- **File Name**: `chocolatine.yml`
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

- `MIRROR_URL`: The URL of the Epitech repository to act as a mirror.
- `EXECUTABLES`: A comma-separated list of paths to the executables that should be generated after the build.

### 🚀 Best Practices

- Use meaningful names for your jobs and steps.
- Leverage GitHub Actions' built-in features as much as possible.
- Only fetch necessary data when checking out the repository.
- Use the latest versions of actions.

### 🎁 Bonus

Want to take it further? Here are some ideas:
- Check for banned functions.
- Add a `LIBRARIES` variable to check for the presence of libraries after compilation (especially useful for projects that generate libraries instead of executables).

---

Happy coding! 🎉
