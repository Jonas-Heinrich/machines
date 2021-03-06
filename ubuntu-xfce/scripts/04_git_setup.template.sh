#!/bin/bash
source "/vagrant/scripts/common.sh"

# For obvious reasons this is just a template

# Assumes that git is already installed
function cloneRepos {
    mkdir ~/projects

    echo "Cloning sample Github repo.."
    git clone https://github.com/YOUR_USER_ID/YOUR_PUBLIC_REPOSITORY.git ~/projects/YOUR_REPO_NAME
    echo "Cloning sample Gitlab repo.."
    git clone https://oauth2:YOUR_ACCESS_TOKEN@gitlab.com/YOUR_USER_ID/YOUR_PRIVATE_REPOSITORY.git ~/projects/YOUR_REPO_NAME
}

function setAuthor {
    echo "Setting git author.."
    git config --global user.name "Jonas Heinrich"
    git config --global user.email "Jonas@example.com"
}

cloneRepos
setAuthor