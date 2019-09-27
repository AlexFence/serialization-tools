.Phony: default clean eval 

default: eval pretty

eval: bin/json-eval
pretty: bin/json-pretty

clean:
	rm -rfv bin

bin:
	mkdir -p bin

bin/json-eval: bin
	cp json-eval/json-eval.js bin/json-eval
	chmod +x bin/json-eval

bin/json-pretty: bin
	cp json-pretty/json-pretty.sh bin/json-pretty
	chmod +x bin/json-pretty


