# Run Francinette easily inside a container!

## Requirements
### ⚠️ Currently, only Podman has been officially tested ⚠️
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

## Todo

- [ ] Support for colorful output (limitations of current base image)
- [ ] MacOS/BSD-like environment inside the container (so tests won't give false positives/negatives), as francinette expects BSD libs and doesn't officially support Linux ones

