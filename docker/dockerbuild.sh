TAG=ocr-cli-py37
DOCKERIGNORE=docker/dockerignore
DOCKERFILE=docker/Dockerfile
wget https://lab.ndl.go.jp/dataset/ndlocr/text_recognition/mojilist_NDL.txt -P ./src/text_recognition/models
wget https://lab.ndl.go.jp/dataset/ndlocr/text_recognition/ndlenfixed64-mj0-synth1.pth -P ./src/text_recognition/models
wget https://lab.ndl.go.jp/dataset/ndlocr/ndl_layout/ndl_layout_config.py -P ./src/ndl_layout/models
wget https://lab.ndl.go.jp/dataset/ndlocr/ndl_layout/epoch_140_all_eql_bt.pth -P ./src/ndl_layout/models
wget https://lab.ndl.go.jp/dataset/ndlocr/separate_pages_ssd/weights.hdf5 -P ./src/separate_pages_ssd/ssd_tools

cp ${DOCKERIGNORE} .dockerignore
docker build --rm --pull $CACHE_FLAG -t ${TAG} -f ${DOCKERFILE} $BUILD_ARGS . 
rm .dockerignore
