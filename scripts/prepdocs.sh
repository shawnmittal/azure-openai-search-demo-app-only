#!/bin/sh
echo 'Running "prepdocs.py"'
python prepdocs.py './data/*' \
    --storageaccount 'https://mystorageaccount.blob.core.windows.net/' \
    --container data \
    --searchservice 'https://mysearchservice.search.windows.net' \
    --index usmc-index \
    --formrecognizerservice 'https://myformrecognizer.cognitiveservices.azure.com/' \
    --searchkey mysearchkey \
    --storagekey mystoragekey \
    --formrecognizerkey myformrecognizerkey \
    -v
