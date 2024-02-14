# To run/install

Make sure you have postgres on your machine / environment

- `bundle install`
- `rails db:create`
- `rails active_storage:install`
- `rails db:migrate`
- `rails s`


Docker container creation
- `docker build -t r7_social`

Run the docker container
- `docker run -p 3000:3000 r7_social`

Notes on running container locally
- You might encounter certificate errors, in which case you might need to run openssl and generate your own certs and declare them in your local .env file