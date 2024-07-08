local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local _ = require(l_Parent_1.HttpServiceMock);
local l_LineWriter_0 = require(l_Parent_1.SharedUtils).LineWriter;
local v4 = require(l_Parent_0.Matcher);
local v5 = {};
local v6 = {
    __index = v5
};
v5.new = function()
    return (setmetatable({
        _processors = {}
    }, v6));
end;
v5.appendOptionalProcessor = function(v7, v8)
    table.insert(v7._processors, {
        matcher = nil, 
        mapper = v8
    });
    return v7;
end;
v5.appendProcessor = function(v9, v10, v11)
    table.insert(v9._processors, {
        matcher = if typeof(v10) == "function" then v4.fromFilter(v10) else v10, 
        mapper = v11
    });
    return v9;
end;
v5.process = function(v12, v13)
    local v14 = {};
    if #v12._processors == 0 then
        error("RequestPipeline does not contain any processor. Make sure to " .. "insert one with `appendProcessor` or `appendOptionalProcessor`", 2);
    end;
    for _, v16 in ipairs(v12._processors) do
        if not v16.matcher then
            local v17, v18 = v16.mapper(v13);
            if not v17 then
                table.insert(v14, v18 or "unspecified");
            else
                return v17;
            end;
        else
            local v19 = v16.matcher:matches(v13);
            if not v19.success then
                table.insert(v14, v19.reason or "unspecified");
            else
                return v16.mapper(v13);
            end;
        end;
    end;
    local v20 = l_LineWriter_0.new():write("The request pipeline was unable to process a request because " .. "it did not match with any matcher. Here is why each matcher failed:"):write("");
    for v21, v22 in ipairs(v12._processors) do
        local v23 = v14[v21];
        local v24 = v23:find("\n") ~= nil;
        v20:write("%4d. %s%s%s%s", v21, not v22.matcher and "" or v22.matcher.name .. ":", (not not v24 and v22.matcher) and "\n" or " ", v23, not v24 and "" or "\n");
    end;
    return {
        type = "internal-error", 
        error = v20:toString()
    };
end;
return v5;
