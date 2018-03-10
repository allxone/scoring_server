FROM root/tensorflow-serving-devel

# Download TensorFlow Serving
RUN git clone --recurse-submodules https://github.com/tensorflow/serving && \
  cd serving && \
  git checkout

# Build TensorFlow Serving and Install it in /usr/local/bin
WORKDIR /serving
RUN bazel build -c opt  \
    tensorflow_serving/model_servers:tensorflow_model_server && \
    cp bazel-bin/tensorflow_serving/model_servers/tensorflow_model_server /usr/local/bin/ && \
    bazel clean --expunge

# Configure container to start serving the /model dir
RUN mkdir /model
VOLUME ["/model"]
EXPOSE 9000
CMD ["tensorflow_model_server","--port=9000","--model_name=model","--model_base_path=/model/"]
