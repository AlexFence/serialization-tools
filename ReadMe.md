# Serialization-Tools

A set of small utilities that work with a couple of serialization formats. They mostly converts stuff around and all just take input via stdin.

Here is a little example what it can do:

```sh
echo "{name: 'akaza akari', hair_color: 'red'}" | json-eval | bson-fromjson | bsondump --quiet | json-pretty
```
it's a little dumb but ilustrates what you could do:
- jso-eval will convert the JavaScript object to proper json.
- bson-fromjson will then convert the json to bson
- bsondump (which comes form [mongodb-tools](https://github.com/mongodb/mongo-tools)) converts the bson back to json, because we can
- json-pretty then prints the json in a pretty way :3

## Building

You'll need:
- a D compiler
- dub
- a POSIX-compatible shell
- nodeJS (y-yes)
- optionally: jq or bat (for nice and colorful output from json-pretty)

Building is rather easy just:
```
make
```
that will result in a newly created bin directory with all the stuff in it.

You can then install it via:
```sh
# will install stuff to /usr/local
make install
```
or
```sh
PREFIX=/usr make install
```
depending on where you want to install it to.

