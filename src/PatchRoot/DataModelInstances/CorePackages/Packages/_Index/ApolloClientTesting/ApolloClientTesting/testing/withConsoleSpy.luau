local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Promise);
local v3 = require(l_Parent_0.JestGlobals);
local l_expect_0 = v3.expect;
local l_jest_0 = v3.jest;
local l_console_0 = require(l_Parent_0.LuauPolyfill).console;
local function _(v7, v8)
    return function(...)
        local v9 = table.pack(...);
        local v10 = l_console_0[v8];
        local v11 = l_jest_0.fn(function()
        end);
        l_console_0[v8] = v11;
        return v2.new(function(v12)
            v12(if not v7 then nil else v7(table.unpack(v9)));
        end):andThen(function()
            l_expect_0(v11).toMatchSnapshot();
            v11:mockClear();
            l_console_0[v8] = v10;
        end):catch(function(v13)
            l_expect_0(v11).toMatchSnapshot();
            v11:mockClear();
            l_console_0[v8] = v10;
            error(v13);
        end);
    end;
end;
v0.withErrorSpy = function(v15, ...)
    local v16 = {
        ...
    };
    local v17 = v16[2];
    local v18 = "error";
    v16[2] = function(...)
        local v19 = table.pack(...);
        local v20 = l_console_0[v18];
        local v21 = l_jest_0.fn(function()
        end);
        l_console_0[v18] = v21;
        return v2.new(function(v22)
            v22(if not v17 then nil else v17(table.unpack(v19)));
        end):andThen(function()
            l_expect_0(v21).toMatchSnapshot();
            v21:mockClear();
            l_console_0[v18] = v20;
        end):catch(function(v23)
            l_expect_0(v21).toMatchSnapshot();
            v21:mockClear();
            l_console_0[v18] = v20;
            error(v23);
        end);
    end;
    return v15(table.unpack(v16));
end;
v0.withWarningSpy = function(v24, ...)
    local v25 = {
        ...
    };
    local v26 = v25[2];
    local v27 = "warn";
    v25[2] = function(...)
        local v28 = table.pack(...);
        local v29 = l_console_0[v27];
        local v30 = l_jest_0.fn(function()
        end);
        l_console_0[v27] = v30;
        return v2.new(function(v31)
            v31(if not v26 then nil else v26(table.unpack(v28)));
        end):andThen(function()
            l_expect_0(v30).toMatchSnapshot();
            v30:mockClear();
            l_console_0[v27] = v29;
        end):catch(function(v32)
            l_expect_0(v30).toMatchSnapshot();
            v30:mockClear();
            l_console_0[v27] = v29;
            error(v32);
        end);
    end;
    return v24(table.unpack(v25));
end;
v0.withLogSpy = function(v33, ...)
    local v34 = {
        ...
    };
    local v35 = v34[2];
    local v36 = "log";
    v34[2] = function(...)
        local v37 = table.pack(...);
        local v38 = l_console_0[v36];
        local v39 = l_jest_0.fn(function()
        end);
        l_console_0[v36] = v39;
        return v2.new(function(v40)
            v40(if not v35 then nil else v35(table.unpack(v37)));
        end):andThen(function()
            l_expect_0(v39).toMatchSnapshot();
            v39:mockClear();
            l_console_0[v36] = v38;
        end):catch(function(v41)
            l_expect_0(v39).toMatchSnapshot();
            v39:mockClear();
            l_console_0[v36] = v38;
            error(v41);
        end);
    end;
    return v33(table.unpack(v34));
end;
return v0;
