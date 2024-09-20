FROM rockylinux:9.3-minimal

# Any python libraries that require system libraries to be installed will likely
# need the following packages in order to build
RUN microdnf update -y && \
    microdnf install -y libpq python3.11 python3.11-pip curl git wget tar nodejs

WORKDIR /code

ENV HOME=/home/neo

RUN useradd -u 1001 -r -g 100 -m -d ${HOME} -s /sbin/nologin \
    -c "Default Neo User" neo && \
    chown -R 1001:100 /code && \
    chmod g+rwx ${HOME} 

COPY ./requirements.txt /code/requirements.txt

RUN pip3.11 install --no-cache-dir -r /code/requirements.txt

USER neo

RUN calrissian --help
