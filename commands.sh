# build docker image
docker build -t "vite-nginx" .

# run docker image
docker run --rm -it -p 8080:80 --name vite-nginx vite-nginx