FROM ruby:3-slim-bullseye

RUN gem install cfn-nag

ENTRYPOINT [ "cfn_nag_scan", "--input-path" ]