local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v3 = require(l_CorePackages_0.Logging);
local v4 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetWidgetInfo);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Actions.ClearWidgetInfo);
local v7 = require(l_Modules_0.LuaApp.SearchUuid);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v9 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXFixNoItemsFoundWidgetsResults);
local v10 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagRefreshWidgets);
local v11 = game:DefineFastFlag("AXIgnoreEmptyWidgets", false);
local v12 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXWidgetsByContext);
return function(v13, v14, v15)
    local v16 = "widgetKey";
    if v9() then
        v16 = v8.getFetchWidgetInfoFetchKey(v14);
    end;
    return l_PerformFetch_0.Single(v16, function(v17)
        if v10() then
            v17:dispatch(v6(v14, v15));
        end;
        local v18 = v7();
        if not v12() then
            v15 = nil;
        end;
        return (if not v14 then v4.FetchWidgets(v13, v18, v15) else v4.FetchWidgetsSearch(v13, v18, v14)):andThen(function(v19)
            local v20 = if not v19 then nil else v19.responseBody;
            local v21 = if not v20 then nil else v20.widgets;
            if v21 == nil then
                return ;
            else
                assert(v21, "");
                local v22 = {};
                for v23, v24 in v21, nil, nil do
                    if not v11 or v24.content and #v24.content ~= 0 then
                        v24.requestId = v18;
                        v22[tostring(tonumber(v23) + 1)] = v24;
                    end;
                end;
                v17:dispatch(v5(v22, v18, v14, v15));
                return ;
            end;
        end, function(v25)
            v3.warn("WebApi failure in FetchWidgetInfo: " .. tostring(v25));
        end);
    end);
end;
