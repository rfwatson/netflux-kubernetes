if [ -d /data/repo ]; then
  cd /data/repo
  git pull
else
  git clone --depth 1 https://github.com/iv-org/invidious.git /data/repo
fi
