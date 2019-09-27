.Phony: default clean bin bson

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

