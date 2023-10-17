# react-vite-nginx

example for packing a dist folder built with nginx and serving it via nginx

these examples also setup up proxy from vite to the backend running on localhost:5000.

vite proxy is used while development and nginx proxy-pass is used in production.

## running client

```bash
pnpm run docker-build
pnpm run docker-run
```

## running both client and backend

```bash
pnpm run docker-compose-start
```

## explanation

The important part is in [/nginx/nginx.conf](/nginx/nginx.conf)
```nginx configuration
    server {
            listen 8080;

            # each request to /api/ will be proxied to http://backend:5000/ 
             location /api/ {
                    proxy_pass http://backend:5000/;
            }

            # all other requests will be served from /usr/share/nginx/html, which copied from dist folder built from vite
            location / {
                root /usr/share/nginx/html;
                index index.html;
            }
    }
```

in development, we tell vite to proxy all requests to /api to localhost:5000, which is the backend server.
```javascript
export default defineConfig({
    plugins: [react()],
    server: {
        proxy: {
            "/api": {
                target: "http://localhost:5000",
                changeOrigin: true,
                rewrite: (path) => path.replace(/^\/api/, ""),
            },
        },
    },
});
```


