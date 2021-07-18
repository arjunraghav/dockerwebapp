FROM 1.20.1-alpine
RUN rm usr/share/nginx/html/index.html
COPY index.html usr/share/nginx/html/
CMD ["nginx", "-g", "daemon off;"]
