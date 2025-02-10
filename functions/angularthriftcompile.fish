function angularthriftcompile
    cd ~/freelancer-dev/thrift-compiler/
    yarn && yarn generate-thrift --thriftPath ../thrift/thrift-service/ --outputDir ../fl-gaf/webapp/node_modules/api-typings/
    cd -
end
