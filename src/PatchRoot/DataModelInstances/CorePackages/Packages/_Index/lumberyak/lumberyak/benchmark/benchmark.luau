local v0 = require(game.LoadedCode.Packages.Lumberyak.Logger);
local function v6(v1, v2)
    local v3 = v1();
    local v4 = tick();
    for _ = 1, 2000000 do
        v2(v3);
    end;
    return (tick() - v4) / 2000000;
end;
local function v8(v7)
    v7:info("foo");
end;
local function v10(v9)
    v9:info("foo {}", 2);
end;
local function v17()
    local v11 = 0;
    local v15 = {
        maxLevel = v0.Levels.Info, 
        log = function(_, _, v14)
            v11 = v11 + v14.number;
        end
    };
    local v16 = v0.new();
    v16:setContext({
        number = 1
    });
    v16:addSink(v15);
    return v16;
end;
local function v18()
    return {
        info = function()
        end
    };
end;
local function v25()
    local v19 = 0;
    local v23 = {
        maxLevel = v0.Levels.Error, 
        log = function(_, _, v22)
            v19 = v19 + v22.number;
        end
    };
    local v24 = v0.new();
    v24:setContext({
        number = 1
    });
    v24:addSink(v23);
    return v24;
end;
local function v33()
    local v26 = 0;
    local v30 = {
        maxLevel = v0.Levels.Info, 
        log = function(_, _, v29)
            v26 = v26 + v29.number;
        end
    };
    local v31 = v0.new();
    local v32 = v31:new();
    v31:setContext({
        number = 1
    });
    v31:addSink(v30);
    return v32;
end;
local function v40()
    local v34 = 0;
    local v38 = {
        maxLevel = v0.Levels.Info, 
        log = function(_, _, v37)
            v34 = v34 + v37.number;
        end
    };
    local v39 = v0.new();
    v39:setContext({
        number = 1
    });
    v39:addSink(v38);
    return (v39:new():new():new():new());
end;
local function v63()
    local v41 = 0;
    local v45 = {
        maxLevel = v0.Levels.Error, 
        log = function(_, _, v44)
            v41 = v41 + v44.number;
        end
    };
    local v49 = {
        maxLevel = v0.Levels.Warning, 
        log = function(_, _, v48)
            v41 = v41 + v48.number;
        end
    };
    local v53 = {
        maxLevel = v0.Levels.Info, 
        log = function(_, _, v52)
            v41 = v41 + v52.number;
        end
    };
    local v57 = {
        maxLevel = v0.Levels.Debug, 
        log = function(_, _, v56)
            v41 = v41 + v56.number;
        end
    };
    local v61 = {
        maxLevel = v0.Levels.Trace, 
        log = function(_, _, v60)
            v41 = v41 + v60.number;
        end
    };
    local v62 = v0.new();
    v62:setContext({
        number = 1
    });
    v62:addSink(v45);
    v62:addSink(v49);
    v62:addSink(v53);
    v62:addSink(v57);
    v62:addSink(v61);
    return v62;
end;
local v64 = v6(v18, v8);
local v65 = v6(v18, v10);
local v66 = {
    ["Log level off"] = v25, 
    ["Simple logger"] = v17, 
    ["Short chain"] = v33, 
    ["Long chain"] = v40, 
    ["Many sinks"] = v63
};
local function _(v67, v68, v69)
    print(string.format("%-40s %0.3e [%0.4fx]", v67 .. " - " .. v68, v69, v69 / v64));
end;
print(string.format("%-40s %0.3e [%0.4fx]", "Empty function" .. " - " .. "Simple", v64, v64 / v64));
print(string.format("%-40s %0.3e [%0.4fx]", "Empty function" .. " - " .. "Interpolation", v65, v65 / v64));
for v71, v72 in pairs(v66) do
    local v73 = v6(v72, v8);
    print(string.format("%-40s %0.3e [%0.4fx]", v71 .. " - " .. "Simple", v73, v73 / v64));
    local v74 = v6(v72, v10);
    print(string.format("%-40s %0.3e [%0.4fx]", v71 .. " - " .. "Interpolation", v74, v74 / v64));
end;
