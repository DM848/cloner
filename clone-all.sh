#!/bin/sh

DIR="code"
if [[ -d ${DIR} ]]; then 
	rm -rf ${DIR}
fi
mkdir -p ${DIR}
cd ${DIR}

TOKEN="${GITHUB_ACCESS_TOKEN_DM848}"
URL="https://api.github.com/users/DM848/repos"
if [[ ! -z ${TOKEN} ]]; then
	URL="${URL}?token=${TOKEN}"
fi

curl -si "${URL}" | grep clone_url | cut -d '"' -f4 | xargs -i git clone {}

cd ..
echo "finished cloning the following repositories"
ls "${DIR}"
