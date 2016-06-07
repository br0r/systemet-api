FROM haskell:7.10

WORKDIR /opt/server

COPY ./systemetapi.cabal /opt/server/systemetapi.cabal
COPY ./stack.yaml /opt/server/stack.yaml

RUN stack setup
RUN stack build --only-dependencies

COPY . /opt/server
RUN stack build

ENTRYPOINT ["stack", "exec"]

CMD ["systemetapi"]
