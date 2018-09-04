# Mechanical Rock Docker

Mono repo for Development environments used at Mechanical Rock

# Usage

Run the following to configure a set of aliases

```
source /path/to/setenv.sh
```

Add it to your `.bash_profile` to add the aliases automatically on shell start

# Contributing

## Minimising Image Size

* Prefer minimal base packages- `debian:*-slim` packages.  Or `-alpine`.
* When installing packages using `apt-get`, specify `--no-install-recommends` to prevent install of optional dependencies you probably don't need
* Remove APT caches once you're finished with them: `rm -rf /var/lib/apt/lists/*`
* Remove setup files/downloaded installer once install complete