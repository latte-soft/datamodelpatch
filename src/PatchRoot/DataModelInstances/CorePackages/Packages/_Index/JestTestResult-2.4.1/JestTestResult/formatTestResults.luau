local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Parent.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Object_0 = v1.Object;
local _ = require(l_Parent_0.types);
local v6 = nil;
local function v12(v7, v8, v9)
    local v10 = l_Array_0.map(v7.testResults, v6);
    if v7.testExecError ~= nil then
        local l_UnixTimestampMillis_0 = DateTime.now().UnixTimestampMillis;
        return {
            assertionResults = v10, 
            coverage = {}, 
            endTime = l_UnixTimestampMillis_0, 
            message = if v7.failureMessage ~= nil then v7.failureMessage else v7.testExecError.message, 
            name = v7.testFilePath, 
            startTime = l_UnixTimestampMillis_0, 
            status = "failed", 
            summary = ""
        };
    else
        return {
            assertionResults = v10, 
            coverage = if v8 ~= nil then v8(v7.coverage, v9) else v7.coverage, 
            endTime = v7.perfStats.end_, 
            message = if v7.failureMessage ~= nil then v7.failureMessage else "", 
            name = v7.testFilePath, 
            startTime = v7.perfStats.start, 
            status = not l_Boolean_0.toJSBoolean(v7.numFailingTests == 0) and "failed" or "passed", 
            summary = ""
        };
    end;
end;
v6 = function(v13)
    local v14 = {
        ancestorTitles = v13.ancestorTitles, 
        failureMessages = nil, 
        fullName = v13.fullName, 
        location = v13.location, 
        status = v13.status, 
        title = v13.title
    };
    if v13.failureMessages then
        v14.failureMessages = v13.failureMessages;
    end;
    return v14;
end;
return {
    default = function(v15, v16, v17)
        return l_Object_0.assign({}, v15, {
            testResults = l_Array_0.map(v15.testResults, function(v18)
                return (v12(v18, v16, v17));
            end)
        });
    end
};
