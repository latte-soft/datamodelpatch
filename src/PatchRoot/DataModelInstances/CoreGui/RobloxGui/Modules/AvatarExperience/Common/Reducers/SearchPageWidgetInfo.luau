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
return (v2.createReducer({}, {
    [v5.name] = function(v10, v11)
        if v11.query then
            return v3.Dictionary.join(v10, {
                [v11.query] = {
                    Details = v11.widgetInfo, 
                    RequestId = v11.requestId, 
                    FetchTime = if not v8() then nil else tick()
                }
            });
        else
            return v10;
        end;
    end, 
    [v6.name] = function(v12, v13)
        if v13.query then
            return v3.Dictionary.join(v12, {
                [v13.query] = v3.None
            });
        else
            return v12;
        end;
    end, 
    [v7.name] = function(v14, v15)
        if v9() then
            local l_widgetId_0 = v15.widgetId;
            local v17 = {};
            for v18, v19 in v14, nil, nil do
                local v20 = {};
                for v21, v22 in v19.Details, nil, nil do
                    if v22.id == l_widgetId_0 then
                        v20[v21] = v3.None;
                    end;
                end;
                v17[v18] = v3.Dictionary.join(v19, {
                    Details = v3.Dictionary.join(v19.Details, v20)
                });
            end;
            return v17;
        else
            return v14;
        end;
    end
}));
