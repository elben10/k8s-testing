#! /usr/bin/env python
import subprocess
import yaml


def main():
    config_bytes = subprocess.run(
        ["docker-compose", "config"], capture_output=True
    ).stdout
    dc_config = yaml.load(config_bytes, Loader=yaml.FullLoader)
    images = [value["image"] for value in dc_config["services"].values()]

    subprocess.run(["kind", "load", "docker-image", *images])


if __name__ == "__main__":
    main()
