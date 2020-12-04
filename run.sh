if command -v python3 > /dev/null; then
  rm plots/*
  echo "Removed plots/*"
  rm csvs/*
  echo "Removed csvs/*"
  src/main
  python3 plot.py
fi
