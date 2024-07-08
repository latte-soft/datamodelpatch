local l_Parent_0 = script.Parent.Parent;
local v1 = nil;
local v2 = {};
local _ = require(l_Parent_0.JestTypes);
local l_bind_0 = require(l_Parent_0.JestEach).bind;
local v5 = require(l_Parent_0.JestUtil);
local l_ErrorWithStack_0 = v5.ErrorWithStack;
local l_convertDescriptorToString_0 = v5.convertDescriptorToString;
local l_isPromise_0 = v5.isPromise;
local l_dispatchSync_0 = require(script.state).dispatchSync;
local v10 = require(script.state);
v2.setState = v10.setState;
v2.getState = v10.getState;
v2.resetState = v10.resetState;
v2.run = require(script.run).default;
local _ = require(l_Parent_0.LuauPolyfill);
local v24 = (function()
    local v12 = nil;
    v12 = setmetatable({}, {
        __call = function(_, v14, v15)
            return v1(v15, v14, v12);
        end
    });
    local v16 = nil;
    v16 = setmetatable({}, {
        __call = function(_, v18, v19)
            return v1(v19, v18, v16, "only");
        end
    });
    local v20 = nil;
    v20 = setmetatable({}, {
        __call = function(_, v22, v23)
            return v1(v23, v22, v20, "skip");
        end
    });
    v12.each = l_bind_0(v12, false);
    v16.each = l_bind_0(v16, false);
    v20.each = l_bind_0(v20, false);
    v12.only = v16;
    v12.skip = v20;
    return v12;
end)();
v1 = function(v25, v26, v27, v28)
    local v29 = l_ErrorWithStack_0.new(nil, v27);
    if v25 == nil then
        v29.message = "Missing second argument. It must be a callback function.";
        error(v29);
    end;
    if typeof(v25) ~= "function" then
        v29.message = ("Invalid second argument, %s. It must be a callback function."):format(v25);
        error(v29);
    end;
    local v31, v32, v33 = xpcall(function()
        v26 = l_convertDescriptorToString_0(v26);
    end, function(v30)
        v29.message = v30.message;
        error(v29);
    end);
    if not v33 then
        l_dispatchSync_0({
            asyncError = v29, 
            blockName = v26, 
            mode = v28, 
            name = "start_describe_definition"
        });
        v31 = v25();
        if not l_isPromise_0(v31) then
            if v31 ~= nil then
                error(l_ErrorWithStack_0.new("A \"describe\" callback must not return a value.", v27));
            end;
        else
            error(l_ErrorWithStack_0.new("Returning a Promise from \"describe\" is not supported. Tests must be defined synchronously.", v27));
        end;
        l_dispatchSync_0({
            blockName = v26, 
            mode = v28, 
            name = "finish_describe_definition"
        });
        return ;
    else
        return v32;
    end;
end;
local function v39(v34, v35, v36, v37)
    local v38 = l_ErrorWithStack_0.new(nil, v36);
    if typeof(v34) ~= "function" then
        v38.message = "Invalid first argument. It must be a callback function.";
        error(v38);
    end;
    l_dispatchSync_0({
        asyncError = v38, 
        fn = v34, 
        hookType = v35, 
        name = "add_hook", 
        timeout = v37
    });
end;
local v40 = nil;
v40 = function(v41, v42)
    return v39(v41, "beforeEach", v40, v42);
end;
local v43 = nil;
v43 = function(v44, v45)
    return v39(v44, "beforeAll", v43, v45);
end;
local v46 = nil;
v46 = function(v47, v48)
    return v39(v47, "afterEach", v46, v48);
end;
local v49 = nil;
v49 = function(v50, v51)
    return v39(v50, "afterAll", v49, v51);
end;
local v80 = (function()
    local v52 = nil;
    local v53 = nil;
    v53 = setmetatable({}, {
        __call = function(_, v55, v56, v57)
            return v52(v55, nil, v56, v53, v57);
        end
    });
    local v58 = nil;
    v58 = setmetatable({}, {
        __call = function(_, v60, v61, v62)
            return v52(v60, "skip", v61, v58, v62);
        end
    });
    local v63 = nil;
    v63 = setmetatable({}, {
        __call = function(_, v65, v66, v67)
            return v52(v65, "only", v66, v53.only, v67);
        end
    });
    v53.todo = function(v68, ...)
        if not (#{
            ...
        } <= 0) or typeof(v68) ~= "string" then
            error(l_ErrorWithStack_0.new("Todo must be called with only a description.", v53.todo));
        end;
        return v52(v68, "todo", function()
        end, v53.todo);
    end;
    v52 = function(v69, v70, v71, v72, v73)
        local v74 = l_ErrorWithStack_0.new(nil, v72);
        local v75 = false;
        local _, v78, v79 = xpcall(function()
            v69 = l_convertDescriptorToString_0(v69);
        end, function(v76)
            v74.message = v76.message;
            v75 = true;
        end);
        if not v79 then
            if v75 then
                error(v74);
            end;
            if v71 == nil then
                v74.message = "Missing second argument. It must be a callback function. Perhaps you want to use `test.todo` for a test placeholder.";
                error(v74);
            end;
            if typeof(v71) ~= "function" then
                v74.message = ("Invalid second argument, %s. It must be a callback function."):format((tostring(v71)));
                error(v74);
            end;
            return l_dispatchSync_0({
                asyncError = v74, 
                fn = v71, 
                mode = v70, 
                name = "add_test", 
                testName = v69, 
                timeout = v73
            });
        else
            return v78;
        end;
    end;
    v53.each = l_bind_0(v53);
    v63.each = l_bind_0(v63);
    v58.each = l_bind_0(v58);
    v53.only = v63;
    v53.skip = v58;
    return v53;
end)();
v2.afterAll = v49;
v2.afterEach = v46;
v2.beforeAll = v43;
v2.beforeEach = v40;
v2.describe = v24;
v2.it = v80;
v2.test = v80;
v2.default = {
    afterAll = v49, 
    afterEach = v46, 
    beforeAll = v43, 
    beforeEach = v40, 
    describe = v24, 
    it = v80, 
    test = v80
};
return v2;
