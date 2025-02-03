function pystubs
    cd ~/freelancer-dev/thrift/thrift-service/
    echo -e "===Deleting current thrift stubs==="
    sudo rm -rf ~/freelancer-dev/api/gaf_thrift-stubs/ && \
        echo -e "===Generating new stubs; Will take around 4 minutes===" && \
        EXPORT=~/freelancer-dev/api/ ./run.sh generate-stubs
    cd -
end
