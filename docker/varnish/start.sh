#!/bin/bash

set -e

exec bash -c \
  "exec varnishd -F -u varnish \
   -a :80 \
   -T localhost:6082 \
  -f $VCL_CONFIG \
  -s ${VARNISH_STORAGE} \
  -p http_resp_hdr_len=65536 \
  -p http_resp_size=98304 \
  -p http_req_hdr_len=64k  \
  -p workspace_backend=256k \
  -p workspace_client=256k \
  -p http_max_hdr=256 \
  -p thread_pools=4 \
  -p thread_pool_max=1500 \
  -p connect_timeout=300 \
  -S /etc/varnish/secret \
  ${VARNISH_DAEMON_OPTS}"