# Preylien/docker-sameboy

This repo has a container used to build [SameBoy](https://github.com/LIJI32/SameBoy) without installing any build dependencies on your system.
In the process it will also download, build, and install [rgbds](https://github.com/rednex/rgbds) as it is a required dependency if it is not found in the debian repo

### Usage

```
chmod +x ./build.sh
./build.sh
```

or

```
chmod +x ./build.sh
./build.sh --keep-image
```
This is used if you would like the script to keep your built image around, not sure why you would want it but hey why not.

The build script spins up a container, executes the `Dockerfile` which performs the actual build from source. The script then copies the build file out onto your local system.

If the version is out of date, please submit a Pull Request or open an issue.