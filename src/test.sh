#!/bin/bash
#src/test.sh



EXPECTED= "Hello, Test!"
OUTPUT= $(node -e "console.log(require('./app')('Test'))")
if [ "$OUTPUT" == "$EXPECTED" ]; then

  echo " Test passedd"

exit 0
else

echo "X Test failed w! Expected '$EXPECTED'but got '$OUTPUT'"
exit 1

fi
