return function(v0, v1, v2)
    assert(type(v1) == "string", "Expected eventContext to be a string");
    assert(type(v2) == "string", "Expected appStage to be a string");
    v0:setRBXEventStream(v1, "appStageLoaded", {
        stage = v2
    });
end;
