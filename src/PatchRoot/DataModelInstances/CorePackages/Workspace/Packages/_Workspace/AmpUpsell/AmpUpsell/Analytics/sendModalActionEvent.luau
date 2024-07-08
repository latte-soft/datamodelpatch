return function(v0, v1, v2, v3)
    v0.sendEventDeferred(v1, "modalAction", {
        aType = v3, 
        origin = v2
    });
end;
