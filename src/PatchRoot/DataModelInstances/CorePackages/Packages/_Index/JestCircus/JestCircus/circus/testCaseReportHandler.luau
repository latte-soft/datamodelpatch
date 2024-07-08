local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = {};
local _ = require(l_Parent_0.JestTestResult);
local _ = require(l_Parent_0.JestTypes);
local v4 = require(script.Parent.utils);
local l_makeSingleTestResult_0 = v4.makeSingleTestResult;
local l_parseSingleTestResult_0 = v4.parseSingleTestResult;
v1.default = function(v7, v8)
    return function(_, v10)
        if v10.name == "test_done" then
            v8("test-case-result", {
                v7, 
                (l_parseSingleTestResult_0((l_makeSingleTestResult_0(v10.test))))
            });
        end;
    end;
end;
return v1;
