.Phony: default clean fromjson

default: fromjson

fromjson: bin/bson-fromjson

clean:
	rm -rfv bin

bin:
	mkdir -p bin

bin/bson-fromjson: bin
	cd bson-fromjson && dub build
