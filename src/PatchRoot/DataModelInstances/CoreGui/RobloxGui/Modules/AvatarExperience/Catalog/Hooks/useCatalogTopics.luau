local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_dependencyArray_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.dependencyArray;
local v7 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchTopics);
local v9 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v10 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local _ = require(l_CorePackages_0.Workspace.Packages.Http);
local v12 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXFixTopicNoResultsShimmer);
local v13 = game:DefineFastInt("AXGetTopicsExpirationSeconds", 600);
local v14 = {
    "____", 
    "______", 
    "_____", 
    "___", 
    "_________"
};
local function v20(v15, v16, v17)
    local v18 = v7.getTopicRequestKey(v15, v16, v17);
    return l_useSelector_0((v3.useCallback(function(v19)
        if (v19.AvatarExperience.Catalog.TopicsFetchTimes[v18] or 0) + v13 <= tick() then
            return nil;
        else
            return v19.AvatarExperience.Catalog.Topics[v18];
        end;
    end, {
        v18
    })));
end;
local function _(v21)
    return v21 and #v21 > 0;
end;
return function(v23, v24, v25)
    local v26 = v9(v10);
    local v27 = l_useDispatch_0();
    local v28, v29 = v3.useState(v14);
    local v30 = v20(v23, v24, v25);
    local v31 = v30 == nil;
    if v30 ~= nil and v30 ~= v28 then
        v29(v30);
    end;
    v3.useEffect(function()
        local v32 = false;
        if v30 == nil then
            local l_v23_0 = v23;
            v32 = l_v23_0 and #l_v23_0 > 0;
            if not v32 then
                l_v23_0 = v24;
                v32 = l_v23_0 and #l_v23_0 > 0;
            end;
        end;
        if v12() then
            v32 = v30 == nil;
        end;
        if v32 then
            v27(v8(v26, v23, v24, v25));
        end;
    end, l_dependencyArray_0(v30, v23, v24, v25));
    return v30 or v28, v31;
end;
