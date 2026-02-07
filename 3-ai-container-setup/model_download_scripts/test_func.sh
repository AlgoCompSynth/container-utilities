test_model() {
  model=$1
  bname=$(basename $model)

  echo ""
  echo "checking $model with Pico SDK"
  /usr/bin/time ollama run $model < prompt.pico-sdk > $bname.pico-sdk

  echo "checking $model with ChucK"
  /usr/bin/time ollama run $model < prompt.ck > $bname.chuck

  echo "checking $model with R"
  /usr/bin/time ollama run $model < prompt.R > $bname.data.table
}
