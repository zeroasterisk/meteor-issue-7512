Test case for [meteor#7512](https://github.com/meteor/meteor/issues/7512)

## How to Use

```
cd <here>
./build2docker.sh
docker-compose up
```
### Status: Fresh Install - No Problems, works fine

> Welcome to Meteor!

### Want to Use without `docker-compose` or with a public mongodb server?

Edit the `docker-compose.yml` file and
**make sure** you are linking to a `MONGO_URL`
which is **publicly available** outside of your docker machine.

(On a virtual machine - OSX - it can't route to the host's localhost)


