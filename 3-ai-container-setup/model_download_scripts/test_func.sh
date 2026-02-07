test_model() {
  model=$1
  bname=$(basename $model)

  echo ""
  echo "checking $model with Pico SDK"
  /usr/bin/time ollama run $model < prompt.pico-sdk > test_results/$bname.pico-sdk
  sleep 30

  echo "checking $model with ChucK"
  /usr/bin/time ollama run $model < prompt.ck > test_results/$bname.chuck
  sleep 30

  echo "checking $model with R"
  /usr/bin/time ollama run $model < prompt.R > test_results/$bname.data.table
  sleep 30
}
