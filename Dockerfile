#Get the OS
FROM ubuntu:20.04

#Generic updates
RUN apt-get update && apt-get upgrade -y

#Install go
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get -y install --no-install-recommends apt-utils
RUN apt-get -y install tzdata
RUN apt-get install -y golang-go

#Get the source of the go app into the container
RUN mkdir /app
COPY src/. /app/

#Build the go app
RUN cd app && go build /app/main.go

#Run the go app
EXPOSE 3000
CMD ["./app/main"]


#COPY etc/go-app.service /lib/systemd/system/
#RUN chmod +x /app/main
#RUN systemctl enable go-app
#RUN systemctl start go-app
#RUN systemctl status go-app
