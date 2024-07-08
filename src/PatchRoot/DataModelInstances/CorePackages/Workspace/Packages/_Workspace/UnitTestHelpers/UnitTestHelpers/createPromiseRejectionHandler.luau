local l_RunService_0 = game:GetService("RunService");
local v1 = require(script.Parent.Parent.Promise);
local v2 = game:DefineFastFlag("DummyFFlagPromiseRejectionFlagState", false);
local function _(v3)
    return v3:match("^[%w%._%-]+:[%d]+.+") ~= nil;
end;
local function v6(v5)
    return ((((((v5:find("CorePackages.Packages.+%.TestEZ%.") or v5:find("CorePackages.Packages.+%.Promise%.")) or v5:find("CorePackages.Packages.+%.roblox_rodux%.")) or v5:find("CorePackages.Packages.+%.React%.")) or v5:find("CorePackages.Packages.+%.ReactReconciler%.")) or v5:find("CorePackages.Packages.+%.Scheduler%.")) or v5:find("CorePackages.Packages.+%.Shared%.")) ~= nil;
end;
local function v12(v7)
    local v8 = {};
    local v9 = false;
    for _, v11 in ipairs(v7:split("\n")) do
        if not (v11:match("^[%w%._%-]+:[%d]+.+") ~= nil) then
            v9 = false;
        elseif not v9 then
            v9 = true;
            table.insert(v8, v11);
            continue;
        end;
        if not v6(v11) then
            table.insert(v8, v11);
        elseif v8[#v8] ~= "..." then
            table.insert(v8, "...");
        end;
    end;
    return table.concat(v8, "\n");
end;
return function(v13)
    local v14 = {};
    local function v23(v15, ...)
        local v16 = v15._source:split("\n");
        local v17 = nil;
        for v18 = #v16, 1, -1 do
            if v16[v18]:find("%.([%a%d]+%.spec):(%d+)") then
                v17 = v16[v18];
                break;
            end;
        end;
        local v19 = nil;
        local v20 = nil;
        local v21 = nil;
        if select("#", ...) >= 1 then
            v20 = tostring(select(1, ...));
            v21 = if not v13 then v12(v20) else v20;
        end;
        local v22 = nil;
        if not (v20 ~= nil) or v20:find("Promise created at:") == nil then
            v22 = if not v13 then v12(v15._source) else v15._source;
        end;
        v19 = if not v17 then ("%*\nNo test file was found in promise creation stack. "):format("\n~~~ UNHANDLED PROMISE REJECTION ~~~") else ("%*\nPromise was created in test at:\n%*\n\n"):format("\n~~~ UNHANDLED PROMISE REJECTION ~~~", v17);
        if v21 ~= nil then
            v19 = v19 .. ("Error output:\n%*"):format(v21);
        end;
        if v22 ~= nil then
            v19 = v19 .. ("\n\nPromise created at:\n%*"):format(v22);
        end;
        table.insert(v14, v19);
    end;
    return {
        reportRejections = function(v24, v25, v26)
            l_RunService_0.Heartbeat:Wait();
            l_RunService_0.Heartbeat:Wait();
            local v27 = v26 or 1;
            local v28 = if not v2 then v24 else v25;
            local v29 = nil;
            local v30 = nil;
            if v28 == nil then
                v29 = 0;
                v30 = "0 (default)";
            else
                v29 = math.floor(v28 * v27);
                v30 = tostring(v29);
            end;
            if #v14 > 0 then
                local v31 = {};
                local v32 = v29 < #v14;
                table.insert(v31, "Caught unhandled promise rejections caught during test run. These may indicate\nerrors in tested code, or tests that were not cleaned up properly.\n\nIf you would like to see full stack traces without library internals redacted,\npass `true` as the first argument to `createPromiseRejectionHandler`.\n\nMore information about unhandled promise rejections in tests (and how to clean\nthem up) can be found at https://roblox.atlassian.net/wiki/spaces/HOW/pages/1556186613/Handling+Lua+Promises+in+Tests.\n");
                for _, v34 in ipairs(v14) do
                    table.insert(v31, v34);
                end;
                table.insert(v31, string.format("\nPromise rejection report:\n    unhandled rejections: %d", #v14));
                if v32 then
                    table.insert(v31, string.format("    allowed rejections threshold: %s\n\nThis test suite run has FAILED due to exceeding the threshold of unhandled\npromise rejections. For any functionality changed, try running the suite with\nrelevant tests focused (new or existing) to find which tests are producing\nunhandled promise rejections", v30));
                end;
                if v29 < #v14 then
                    error(table.concat(v31, "\n"), 0);
                    return ;
                else
                    warn(table.concat(v31, "\n"));
                end;
            end;
        end, 
        inject = function()
            v1.TEST = true;
            return v1.onUnhandledRejection(v23);
        end
    };
end;
