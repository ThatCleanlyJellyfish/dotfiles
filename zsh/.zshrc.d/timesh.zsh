# Calculate the median of an array.
function median() {
    arr=("$@")
    sorted=($(for item in ${arr[@]}; do echo $item; done | sort -n))
    length=${#sorted[@]}
    if (( $length % 2 == 1 )); then
        # Odd length, return middle element
        echo "${sorted[$((length / 2 + 1))]}"
    else
        # Even length, return average of two middle elements
        mid=$((length / 2))
        echo "scale=2; (${sorted[mid]} + ${sorted[mid+1]}) / 2" | bc
    fi
}
function timesh() {
  shell=${1:-$SHELL}
  runs=10
  # Initialise arrays to store time results.
  real_times=()
  user_times=()
  sys_times=()
  echo "Starting up $shell $runs times..."
  for i in {1..$runs}; do
    output=$( { /usr/bin/time -p $shell -i -c exit > /dev/null } 2>&1 )
    real=$(echo "$output" | grep real | awk '{print $2}')
    user=$(echo "$output" | grep user | awk '{print $2}')
    sys=$(echo "$output" | grep sys | awk '{print $2}')
    real_times+=($real)
    user_times+=($user)
    sys_times+=($sys)
  done
  echo $real_times
  echo "Median wall time: $(median $real_times) seconds"
}
