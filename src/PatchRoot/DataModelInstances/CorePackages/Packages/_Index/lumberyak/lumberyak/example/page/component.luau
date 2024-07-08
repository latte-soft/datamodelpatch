local v0 = require(script.Parent.pageLogger):new();
v0:setContext({
    bar = "bar"
});
return function()
    v0:info("calling {root} {foo} {bar}");
    return "done";
end;
