# URL_ORIGINAL
# https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2023-01.parquet

URL_PREFIX="https://d37ci6vzurychx.cloudfront.net/trip-data"
YEAR=2023
# 
TAXI_TYPE=("yellow" "green")
TYPE_COUNT=${#TAXI_TYPE[@]}
idx=0
# 
cd=$(date +"%m")
current_date=$((10#$cd)) 

for ((MONTH=1; MONTH<=current_date; MONTH++)) ; do
    idx=0  
    while [ $idx -lt $TYPE_COUNT ]
    do 
        # ext_file
        FMONTH=$(printf "%02d" $MONTH)
        FILE_SUFFIX="${TAXI_TYPE[$idx]}_tripdata_${YEAR}-${FMONTH}.parquet"
        URL="${URL_PREFIX}/${FILE_SUFFIX}"
        # echo "${URL}"

        # locate
        LOCAL_PATH="data/raw/${TAXI_TYPE[$idx]}/${YEAR}/${FMONTH}"
        LOCAL_SAVE="${LOCAL_PATH}/${FILE_SUFFIX}"
        
        mkdir -p ${LOCAL_PATH}
        wget ${URL} -O ${LOCAL_SAVE}

        idx=$((idx + 1))
    done
done


