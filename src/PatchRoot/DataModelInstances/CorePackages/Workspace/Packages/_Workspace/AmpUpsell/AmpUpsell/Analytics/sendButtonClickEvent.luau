return function(v0, v1, v2, v3)
    v0.sendEventDeferred(v1, "buttonClick", {
        origin = v2, 
        btn = v3
    });
end;
