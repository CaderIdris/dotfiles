#!/bin/bash

while read extension; do
    vscodium --install-extension $extension
done < data/extensions.pkg