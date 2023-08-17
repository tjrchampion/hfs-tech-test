  #latest, but for production should be a specifed version...
FROM nginx:latest

#add our editable config to our container
ADD default.conf /etc/nginx/conf.d/default.conf