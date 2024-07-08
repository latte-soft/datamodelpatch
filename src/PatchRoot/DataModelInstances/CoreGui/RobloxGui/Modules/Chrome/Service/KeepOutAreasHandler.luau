local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_RunService_0 = game:GetService("RunService");
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local l_useSelector_0 = v4.Hooks.RoactRodux.useSelector;
local l_dependencyArray_0 = v4.Hooks.dependencyArray;
local v7 = require(script.Parent.Parent.Flags.GetFFlagFixKeepOutAreasCompatibility);
local function v22(v8, v9, v10)
    local v11 = {};
    local l_X_0 = v8.X;
    local l_Y_0 = v8.Y;
    local l_X_1 = v9.X;
    local v15 = v9.Y - l_Y_0;
    local l_l_X_0_0 = l_X_0;
    local v17 = 0;
    for _, v19 in ipairs(v10) do
        local v20 = l_l_X_0_0 + v17;
        table.insert(v11, {
            Position = {
                X = v20, 
                Y = l_Y_0
            }, 
            Size = {
                X = v19.position.X - v20, 
                Y = v15
            }
        });
        l_l_X_0_0 = v19.position.X;
        v17 = v19.size.X;
    end;
    local v21 = l_l_X_0_0 + v17;
    table.insert(v11, {
        Position = {
            X = v21, 
            Y = l_Y_0
        }, 
        Size = {
            X = l_X_1 - v21, 
            Y = v15
        }
    });
    return v11;
end;
local function v37(v23, v24)
    local v25 = {};
    local v26 = {};
    for _, v28 in pairs(v24) do
        table.insert(v26, {
            id = v28.id, 
            size = v28.size, 
            position = v28.position
        });
    end;
    table.sort(v26, function(v29, v30)
        local v31 = false;
        if v29.position.X < v30.position.X then
            v31 = v29.position.X + v29.size.X < v30.size.X + v30.position.X;
        end;
        return v31;
    end);
    local l_l_GuiService_0_GuiInset_0, _ = l_GuiService_0:GetGuiInset();
    v25 = v22(Vector2.new(0, 0), Vector2.new(v23.X, l_l_GuiService_0_GuiInset_0.Y), v26);
    local v34 = nil;
    for _, v36 in ipairs(v25) do
        if not v34 or v34.Width < v36.Size.X then
            v34 = Rect.new(v36.Position.X, v36.Position.Y, v36.Position.X + v36.Size.X, v36.Position.Y + v36.Size.Y);
        end;
    end;
    return v34;
end;
local function _(v38, v39)
    local v40 = v37(v38, v39);
    if v40 then
        l_GuiService_0:SetTopbarInset(v40);
    end;
end;
KeepOutAreasHandler = function(_)
    local v44 = l_useSelector_0(function(v43)
        return v43.displayOptions.screenSize;
    end);
    local v46 = l_useSelector_0(function(v45)
        return v45.displayOptions.keepOutAreas;
    end);
    v3.useEffect(function()
        if not (not v7() and (not game:GetEngineFeature("InGameChromeSignalAPI") or not l_RunService_0:IsStudio())) then
            local v47 = v37(v44, v46);
            if v47 then
                l_GuiService_0:SetTopbarInset(v47);
            end;
        end;
    end, l_dependencyArray_0(v44, v46));
end;
return KeepOutAreasHandler;
