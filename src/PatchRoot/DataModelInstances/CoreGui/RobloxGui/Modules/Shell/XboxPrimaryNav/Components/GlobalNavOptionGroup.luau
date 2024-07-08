local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local v2 = require(l_CorePackages_0.Packages.React);
local l_Object_0 = require(l_CorePackages_0.Packages.LuauPolyfill).Object;
local v4 = require(l_CorePackages_0.UIBlox);
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_StyledTextLabel_0 = v4.App.Text.StyledTextLabel;
local v7 = require(script.Parent.GlobalNavOption);
local function v11()
    local v8, v9 = v2.useState(nil);
    return v8, (v2.useCallback(function(v10)
        v9(v10);
    end, {}));
end;
local function v18(v12)
    local v13, v14 = v2.useState({});
    v2.useEffect(function()
        if not v12 then
            return ;
        else
            local v15 = {};
            for _, v17 in ipairs(v12:GetDescendants()) do
                if v17:IsA("ImageButton") then
                    table.insert(v15, v17);
                end;
            end;
            v14(v15);
            return function()
                v14({});
            end;
        end;
    end, {
        v12, 
        v14
    });
    return v13;
end;
local function v23(v19)
    local v20, v21 = v2.useState(nil);
    v2.useEffect(function()
        local v22 = l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function()
            v21((table.find(v19, l_GuiService_0.SelectedCoreObject)));
        end);
        return function()
            v22:Disconnect();
        end;
    end, {
        v21, 
        v19
    });
    return v20;
end;
createIconsTabs = function(v24, v25)
    local v26 = {};
    for v27, v28 in ipairs(v24) do
        table.insert(v26, v2.createElement(v7, {
            key = v28.label .. "-" .. v27, 
            selected = v25 == v27, 
            icon = v28.icon, 
            onActivated = v28.onActivated
        }));
    end;
    return v26;
end;
local function _(v29, v30)
    if not (v30 ~= nil) or v29 == nil then
        return 0;
    else
        return (v30.AbsolutePosition.X - v29.AbsolutePosition.X) + v30.Size.X.Offset / 2;
    end;
end;
local function _(v32)
    if v32 == nil then
        return 0;
    else
        return (v32.Position.Y.Offset + v32.Size.Y.Offset) - 10;
    end;
end;
GlobalNavOptionGroup = function(v34)
    local v35 = l_useStyle_0();
    local v36, v37 = v11();
    local v38 = v18(v36);
    local v39 = v23(v38);
    local v40 = if not v39 then nil else v34.items[v39].label;
    local v41 = if not v39 then nil else v38[v39];
    return v2.createElement("Frame", {
        Size = if not v34.size then UDim2.new(1, 0, 1, 0) else v34.size, 
        AnchorPoint = Vector2.new(1, 0), 
        BackgroundTransparency = 1
    }, {
        IconButtons = v2.createElement("Frame", {
            ref = v37, 
            Size = if not v34.size then UDim2.new(1, 0, 1, 0) else v34.size, 
            BackgroundTransparency = 1
        }, {
            l_Object_0.assign({}, {
                Layout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, v34.spacing or 0)
                })
            }, createIconsTabs(v34.items, nil))
        }), 
        ToolTip = if not v40 then nil else v2.createElement("Frame", {
            Transparency = 1, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 300, 1, 0), 
            AnchorPoint = Vector2.new(0.5, -1), 
            Position = UDim2.new(0, (not (v41 ~= nil) or v36 == nil) and 0 or (v41.AbsolutePosition.X - v36.AbsolutePosition.X) + v41.Size.X.Offset / 2, 0, v41 == nil and 0 or (v41.Position.Y.Offset + v41.Size.Y.Offset) - 10)
        }, {
            Text = v2.createElement(l_StyledTextLabel_0, {
                size = UDim2.new(1, 0, 1, 0), 
                text = v40, 
                textXAlignment = Enum.TextXAlignment.Center, 
                colorStyle = {
                    Color = v35.Theme.TextDefault.Color, 
                    Transparency = 0
                }, 
                fontStyle = v35.Font.Header2
            })
        })
    });
end;
return GlobalNavOptionGroup;
