#!/bin/bash
TMP_DIR=/tmp/brave-script-gatherer-run
test -d $TMP_DIR && rm -Rf $TMP_DIR && mkdir $TMP_DIR;

if [[ -f lambda.zip ]]; then
    rm lambda.zip;
fi;
npm run bundle;
unzip lambda.zip -d $TMP_DIR;
docker run -it -v $TMP_DIR:/var/task lambci/lambda:nodejs8.10 lambda.dispatch '{"url": "http://bisi.hk/", "domains": ["crypto-loot.com", "cryptoloot.pro", "coinimp.com", "www.hashing.win", "www.freecontent.bid", "webassembly.stream", "cnt.statistic.date", "cdn.static-cnt.bid", "ad.g-content.bid", "cdn.jquery-uim.download"], "terms": ["CryptoLoot.Anonymous", "deepMiner.Anonymous", "CoinHive.Anonymous"], "debug": true, "tags": ["docker-test"], "batch": "test-test-test-test-test-test-test-!"}';
