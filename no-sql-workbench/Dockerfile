FROM ubuntu

WORKDIR /app
RUN wget https://s3.amazonaws.com/nosql-workbench/NoSQL%20Workbench-linux-x86_64-2.2.0.AppImage --ouput-document nosql-workbench.AppImage && \
  chmod +x /app/nosql-workbench.AppImage

ENTRYPOINT /app/nosql-workbench.AppImage