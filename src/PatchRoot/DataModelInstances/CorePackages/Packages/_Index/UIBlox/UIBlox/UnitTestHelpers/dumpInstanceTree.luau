local function v0(v1, v2)
    v2 = v2 or "";
    assert(v2 ~= nil, "indent must be a string");
    if v1 == nil then
        print(v2 .. "[nil Instance]");
        return ;
    else
        assert(v1 ~= nil, "instance must be non-nil");
        print(v2 .. v1.Name);
        v2 = v2 .. "  ";
        for _, v4 in ipairs(v1:GetChildren()) do
            v0(v4, v2);
        end;
        return ;
    end;
end;
return v0;
