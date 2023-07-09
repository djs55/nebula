FROM golang:alpine AS build

RUN apk add alpine-sdk
COPY . /nebula
WORKDIR /nebula
RUN make

FROM scratch
COPY --from=build /nebula/nebula /bin/nebula
COPY --from=build /nebula/nebula-cert /bin/nebula-cert
VOLUME [ "/nebula" ]
WORKDIR /nebula