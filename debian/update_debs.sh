#!/bin/bash

# Run this script to regenerate the Packages/Release file when you add or
# update debs in the repository (/var/www/html/debs)

RELEASE=$1
# SIGN_KEY=$(SIGN_KEY|-"~/.gnupg/deb-signing.key")
DEBHOME=$(dirname $(realpath $0))

if [[ -z "$RELEASE" ]];
then echo "Usage: $0 release (e.g. bullseye)";
          exit 1;
fi

# echo "Importing key (if necessary) and signing."

# gpg --import $SIGN_KEY

CONFIG=$(cat <<EOT
APT {
  FTPArchive {
    Release {
      Origin "HathiTrust";
      Label "HathiTrust";
      Codename "$RELEASE";
      Components "main";
    };
  };
};
EOT
)

cd $DEBHOME
dpkg-scanpackages --multiversion dists/$RELEASE/main/binary-amd64 > dists/$RELEASE/main/binary-amd64/Packages
dpkg-scanpackages --multiversion dists/$RELEASE/main/binary-arm64 > dists/$RELEASE/main/binary-arm64/Packages
dpkg-scanpackages --multiversion dists/$RELEASE/main/binary-all > dists/$RELEASE/main/binary-all/Packages
apt-ftparchive -c <(echo "$CONFIG") release dists/$RELEASE > dists/$RELEASE/Release

cd dists/$RELEASE
gpg -abs -o Release.gpg Release
gpg --clearsign --output  InRelease Release

