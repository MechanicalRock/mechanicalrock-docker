FROM ruby:slim

RUN gem install cfn-nag

ENTRYPOINT [ "cfn_nag_scan", "--input-path" ]