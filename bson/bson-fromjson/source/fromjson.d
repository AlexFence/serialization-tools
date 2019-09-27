import core.stdc.stdlib : exit;
import std.stdio;
import std.typecons : Nullable, nullable;
import std.json;
import vibe.data.json;
import vibe.data.bson;


string getStdIn() {
    string input = "";
    string line;
    while ((line = stdin.readln()) !is null)
        input ~= line;

    return input;
}

Nullable!JSONValue getJSONValueFromString(string str) {
    try {
        JSONValue json = parseJSON(str);
        return nullable(json);
    } catch(JSONException) {
        Nullable!JSONValue n = nullable(JSONValue());
        n.nullify();
        return n;
    }
}

void main() {
    string input = getStdIn();
    
    Nullable!JSONValue jsonValue = getJSONValueFromString(input);
    
    if (jsonValue.isNull) {
        exit(1);
    } else {
        Json json = Json(jsonValue.get());
        Bson bson = Bson(json);
        stdout.rawWrite(bson.data);
        exit(0);
    }

}
