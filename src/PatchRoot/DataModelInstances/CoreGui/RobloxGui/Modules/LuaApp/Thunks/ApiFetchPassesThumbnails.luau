local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Promise);
local l_ApiFetchThumbnails_0 = require(l_CorePackages_0.Workspace.Packages.Http).Utils.ApiFetchThumbnails;
local v4 = require(l_Modules_0.LuaApp.Http.Requests.PassesGetThumbnails);
local v5 = require(l_Modules_0.LuaApp.Actions.SetPassesThumbnails);
return function(v6, v7)
    return function(v8)
        local l_PassesThumbnails_0 = v8:getState().PassesThumbnails;
        local v10 = {};
        if not l_PassesThumbnails_0 then
            v10 = v7;
        else
            for _, v12 in ipairs(v7) do
                if l_PassesThumbnails_0[tostring(v12)] == nil then
                    table.insert(v10, v12);
                end;
            end;
        end;
        if #v10 == 0 then
            return v2.resolve();
        else
            return l_ApiFetchThumbnails_0.Fetch(v6, v10, "150x150", "Pass", v4, v5, v8);
        end;
    end;
end;
