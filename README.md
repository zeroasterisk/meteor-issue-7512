Test case for [meteor#7512](https://github.com/meteor/meteor/issues/7512)

## How to Use

```
cd <here>
./build2docker.sh
docker-compose up
```
### Status: Fresh Install - No Problems, works fine

> Welcome to Meteor!

### Status: Added accounts-password - Broken, Module did not self-register.

> meteorapp_1 | /opt/node_modules/fibers/future.js:280
> meteorapp_1 | 						throw(ex);
> meteorapp_1 | 						^
> meteorapp_1 |
> meteorapp_1 | Error: Module did not self-register.
> meteorapp_1 |     at Error (native)
> meteorapp_1 |     at Object.Module._extensions..node (module.js:434:18)
> meteorapp_1 |     at Module.load (module.js:343:32)
> meteorapp_1 |     at Module.Mp.load (/opt/app/programs/server/npm/node_modules/meteor/babel-compiler/node_modules/reify/node/runtime.js:16:23)
> meteorapp_1 |     at Function.Module._load (module.js:300:12)
> meteorapp_1 |     at Module.require (module.js:353:17)
> meteorapp_1 |     at require (internal/module.js:12:17)
> meteorapp_1 |     at bindings (/opt/app/programs/server/npm/node_modules/meteor/npm-bcrypt/node_modules/bindings/bindings.js:76:44)
> meteorapp_1 |     at Object.<anonymous> (/opt/app/programs/server/npm/node_modules/meteor/npm-bcrypt/node_modules/bcrypt/bcrypt.js:3:35)
> meteorapp_1 |     at Module._compile (module.js:409:26)
> devz_meteorapp_1 exited with code 1

### Want to Use without `docker-compose` or with a public mongodb server?

Edit the `docker-compose.yml` file and
**make sure** you are linking to a `MONGO_URL`
which is **publicly available** outside of your docker machine.

(On a virtual machine - OSX - it can't route to the host's localhost)


