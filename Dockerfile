ARG GO_VERSION=1.20
ARG BUILD_TYPE=
FROM golang:$GO_VERSION
WORKDIR /build
RUN apt-get update && apt-get install -y cmake libgomp1 libopenblas-dev libopenblas-base libopencv-dev libopencv-core-dev libopencv-core4.5 
COPY . .
RUN ln -s /usr/include/opencv4/opencv2/ /usr/include/opencv2
RUN make prepare-sources
EXPOSE 8080
ENTRYPOINT [ "/build/entrypoint.sh" ]
