local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Promise);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v4 = require(l_CorePackages_0.Logging);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetHydratedWidgetData);
return function(v7, v8, v9)
    return l_PerformFetch_0.Single("hydrateWidgetKey." .. v9, function(v10)
        return v5.HydrateWidgetContent(v7, v8):andThen(function(v11)
            local v12 = if not v11 then nil else v11.responseBody;
            local v13 = if not v12 then nil else v12.hydratedContent;
            if v13 == nil then
                return ;
            else
                assert(v13, "");
                local v14 = {};
                for _, v16 in v13, nil, nil do
                    local l_type_0 = v16.type;
                    local v18 = tostring(v16.id);
                    if not v14[l_type_0] then
                        v14[l_type_0] = {};
                    end;
                    v14[l_type_0][v18] = v16;
                end;
                for _, v20 in v8, nil, nil do
                    local l_type_1 = v20.type;
                    local v22 = tostring(v20.id);
                    if not v14[l_type_1] then
                        v14[l_type_1] = {};
                    end;
                    if not v14[l_type_1][v22] then
                        v14[l_type_1][v22] = {
                            id = v20.id, 
                            type = l_type_1, 
                            failedToHydrate = true
                        };
                    end;
                end;
                v10:dispatch(v6(v14));
                return ;
            end;
        end, function(v23)
            v4.warn("WebApi failure in FetchHydratedWidgetContent: " .. tostring(v23));
            return v2.reject(v23);
        end);
    end);
end;
