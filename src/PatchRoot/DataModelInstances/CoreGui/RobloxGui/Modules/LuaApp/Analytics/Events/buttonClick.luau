return function(v0, v1, v2, v3)
    assert(type(v1) == "string", "Expected eventContext to be a string");
    assert(type(v2) == "string", "Expected buttonName to be a string");
    local v4 = {
        btn = v2
    };
    if v3 ~= nil then
        assert(type(v3) == "string", "Expected extraData to be a string");
        v4.cstm = v3;
    end;
    v0:setRBXEventStream(v1, "buttonClick", v4);
end;
