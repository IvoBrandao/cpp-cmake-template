cd build/bin

for ut in ut_*; do
    echo "Running $ut"
    ./$ut
done

cd ../..