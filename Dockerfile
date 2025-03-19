# Étape 1: Construire l'application
FROM node:18 AS build

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build

# Étape 2: Servir l'application avec Nginx
FROM nginx:alpine

# Copie les fichiers de build de l'étape précédente vers le dossier Nginx
COPY --from=build /app/dist /usr/share/nginx/html

# Expose le port 80
EXPOSE 80

# Lance Nginx en arrière-plan
CMD ["nginx", "-g", "daemon off;"]
