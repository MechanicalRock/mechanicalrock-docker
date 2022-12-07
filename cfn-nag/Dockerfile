FROM ruby:3.1.3-slim

RUN gem install cfn-nag

ENTRYPOINT [ "cfn_nag_scan", "--input-path" ]