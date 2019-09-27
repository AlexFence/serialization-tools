#!/usr/bin/env node

const hasPrettyFlag = () => process.argv.filter(x => x === "-p").length > 0

function getStdIn() {
    const { stdin } = process;
    return new Promise(resolve => {
        let result = '';

        if (stdin.isTTY) {
            resolve(result);
            return;
        }

        stdin.setEncoding('utf8');

        stdin.on('readable', () => {
            let chunk;

            while ((chunk = stdin.read())) {
                result += chunk;
            }
        });

        stdin.on('end', () => {
            resolve(result);
        });
    });
}

function evalToJSON(input) {
    try {
        const object = eval('('+input+')');
        
        if (hasPrettyFlag()) {
            return JSON.stringify(object, null, 2);
        }

        return JSON.stringify(object);
    } catch {
        return null;
    }
}


(async ()  => {
    const input = await getStdIn();
    const json = evalToJSON(input);

    if (json !== null) {
        process.stdout.write(json);
    } else {
        process.exit(1);
    }
})();
