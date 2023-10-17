# react-vite-nginx

example for packing a dist folder built with nginx and serving it via nginx

this examples also setup up proxy from vite to the backend running on localhost:5000.

vite proxy is used while development and nginx proxy-pass is used in production.

## running

```bash
pnpm run docker-build
pnpm run docker-run
```