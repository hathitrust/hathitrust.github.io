# HathiTrust on GitHub

## [git repositories](https://github.com/hathitrust)

Our publicly-available code.

## [Debian repository](debian)

Our publicly-available packages for Debian, used by some of our Docker images.

To use this repository:

```
sudo wget -O /usr/share/keyrings/hathitrust-archive-keyring.gpg https://hathitrust.github.io/debian/hathitrust-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hathitrust-archive-keyring.gpg] https://hathitrust.github.io/debian/ bullseye main" | sudo tee /etc/apt/sources.list.d/hathitrust.list
```

```
pub   rsa4096 2022-03-23 [SC]
      029248F1093351856A5C613EF77B6402E1A112E9
uid           [ultimate] HathiTrust Debian Packaging (Signing key for HathiTrust Debian Repository) <debian@hathitrust.org>
sub   rsa4096 2022-03-23 [E]
```
