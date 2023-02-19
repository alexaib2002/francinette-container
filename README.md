# Run Francinette easily inside a container!

## Requirements
### ⚠️ Currently, only Podman has been officially tested as container engine ⚠️
Still, buidling and running in Docker should work fine (you may have to rename some files though).

Install the following packages. You may want to take a look on your distro's recommendations for properly configuring them:

- **podman**
- **podman-compose** (for using the compose file)

Next, you'll need the container image. You may want to pull it directly from a registry, or build it locally yourself.

## Building the container image

### 🐋 This step shouldn't be required once the image is available on a remote registry. 🐋

Clone this repository and head up to the root directory of it with any terminal of your preference. Trigger the build via `podman build -t francinette:latest .`

```
git clone https://github.com/alexaib2002/francinette-container paco-container
cd paco-container
podman build -t francinette:latest .
```

## Basic usage

### ‼️ Before any of this, ensure you have a build of the container image available in your system ‼️

* For just running Francinette tests directly and destroy the container afterwards:

```
MY_42PROJECT=/path/to/your/project && podman run --rm -v $MY_42PROJECT:/project localhost/francinette:1.0
```

* You can also pass any arguments to the Francinette executable!

```
MY_42PROJECT=/path/to/your/project && podman run --rm -v $MY_42PROJECT:/project localhost/francinette:1.0 <YOUR_ARGUMENTS_HERE>
```

Example:

```
# If the project being tested if libft, this will only test the 'strlcat' function
MY_42PROJECT=/path/to/your/project && podman run --rm -v $MY_42PROJECT:/project localhost/francinette:1.0 strlcat
```

## FAQ

### 1. What's the purpose of this project?

Despite being a very useful tool, Francinette requires doing some dirty things on the host filesystem for working as expected. This includes creating untracked dependencies on the host (ie: you need to manually install some packages, so the package manager won't ever know Francinette requires them, potentially bloating your system), creating aliases on the .bashrc of the user and temporary files (breaking the XDG specifications), among other ones. 
While this isn't much of a problem for a common user, in the long run it will make harder to mantain your system.

Thankfully, containers do exist, so we can let Francinette do whatever it wants in a controlled environment, without exposing any of our files 😋! This also brought other useful improvements over the original way of running Francinette, which takes me to the next question:

### 2. Why would I want to run Francinette on a container?

- **Multiple instances of Francinette**: The original way of running Francinette only allows one instance of Francinette running. As containers have their own filesystem, you can run multiple containers with different tests at the same time!
- **Easier file management**: As every file Francinette creates will be containerized, it only takes a container removal to clean up all the temporary files. Such a breeze!
- **Portable environment**: You don't need to install Francinette everytime you use a new computer. Just pull the image and you are all set!

## Todo

- [ ] Support for colorful output (limitations of current base image)
- [ ] MacOS/BSD-like environment inside the container (so tests won't give false positives/negatives), as francinette expects BSD libs and doesn't officially support Linux ones

