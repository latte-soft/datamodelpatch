local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Rodux);
local v3 = require(l_CorePackages_0.Cryo);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetWidgetInfo);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Actions.ClearWidgetInfo);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Actions.RemoveWidgetInfo);
local v8 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagRefreshWidgets);
local v9 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagRemoveEmptyHydratedWidgets);
local v10 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXWidgetsByContext);
return (v2.createReducer({
    Details = {}, 
    RequestId = nil, 
    FetchTime = nil
}, {
    [v5.name] = function(v11, v12)
        if not v12.query and (not v10() or not v12.context) then
            return {
                Details = v12.widgetInfo, 
                RequestId = v12.requestId, 
                FetchTime = if not v8() then nil else tick()
            };
        else
            return v11;
        end;
    end, 
    [v6.name] = function(v13, v14)
        if not v14.query and (not v10() or not v14.context) then
            return {
                Details = {}
            };
        else
            return v13;
        end;
    end, 
    [v7.name] = function(v15, v16)
        if v9() then
            local l_widgetId_0 = v16.widgetId;
            local v18 = {};
            for v19, v20 in v15.Details, nil, nil do
                if v20.id == l_widgetId_0 then
                    v18[v19] = v3.None;
                end;
            end;
            return v3.Dictionary.join(v15, {
                Details = v3.Dictionary.join(v15.Details, v18)
            });
        else
            return v15;
        end;
    end
}));
