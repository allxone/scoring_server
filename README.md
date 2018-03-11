[![License](http://img.shields.io/:license-apache%202.0-brightgreen.svg)](http://www.apache.org/licenses/LICENSE-2.0.html)

# scoring_server
Tensorflow Serving docker-based scoring server based on tensorflow_model_server dockerfiles

Licensed under the [Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0).

## Usage
```
git clone https://github.com/allxone/scoring_server.git
cd scoring_server

# CPU
docker build -t allxone/tensorflow_serving -f Dockerfile .
docker run --rm -p 9000:9000 -v model:/model allxone/tensorflow_serving

# GPU
docker build -t allxone/tensorflow_serving_gpu -f Dockerfile.gpu .
nvidia-docker run --rm -p 9000:9000 -v /home/allxone/scoring_server/model:/model allxone/tensorflow_serving_gpu
```

## Credits
https://github.com/tensorflow/serving
https://github.com/tensorflow/serving/tree/master/tensorflow_serving/tools/docker
