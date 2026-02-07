test_model() {
  model=$1
  bname=$(basename $model)

  echo ""

  for suffix in pico-sdk ck R
  do
    echo "checking $model with $suffix"
    /usr/bin/time ollama run $model \
      < prompt.$suffix \
      > test_results/$bname.$suffix 2>&1
    sleep 30

  done

}
