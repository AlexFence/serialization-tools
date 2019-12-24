PREFIX=/usr/local

.Phony: default clean install json bson

default: json bson

json: bin
	cd json && $(MAKE) default
	cp json/bin/* ./bin


bson: bin
	cd bson && $(MAKE) default
	cp bson/bin/* ./bin

clean:
	rm -rfv bin
	cd bson && $(MAKE) clean
	cd json && $(MAKE) clean

bin:
	mkdir -p bin

install: bin
	cp -v ./bin/* $(PREFIX)/bin
