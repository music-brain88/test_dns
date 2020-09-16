FROM rust:latest

WORKDIR /opt/programs

COPY Cargo.toml /opt/programs/Cargo.toml
COPY ./src /opt/programs/src

RUN apt-get update -y
RUN apt-get upgrade -y

RUN cargo build --release
RUN cargo install --path .

CMD ["test_dns"]
