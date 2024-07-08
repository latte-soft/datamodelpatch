return function(v0, v1, v2, v3, v4, v5)
    assert(type(v1) == "string", "Expected eventContext to be a string");
    assert(type(v2) == "string", "Expected buttonName to be a string");
    local v6 = {
        btn = v2, 
        section = v4, 
        origin = v5
    };
    if v3 ~= nil then
        assert(type(v3) == "string", "Expected extraData to be a string");
        v6.cstm = v3;
    end;
    v0:setRBXEventStream(v1, "buttonClick", v6);
end;
