# TensorFlow inception
mkdir -p model_repository/unet/1
cd model_repository/unet/1/
wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1nkYb6Bxi6HaSFz8esYchIqscJJx-E0z3' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1nkYb6Bxi6HaSFz8esYchIqscJJx-E0z3" -O file.zip && rm -rf /tmp/cookies.txt

unzip file.zip && rm file.zip
cd ..
cd ..
cd ..
