local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.UIBlox);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local l_Images_0 = v3.App.ImageSet.Images;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_BaseMenu_0 = v3.App.Menu.BaseMenu;
local v10 = l_Images_0["icons/actions/truncationExpand_small"];
local v11 = v5.wrap(v4.strictInterface({
    buttonSize = v4.UDim2, 
    dropdownList = v4.table, 
    selectedIndex = v4.number, 
    onSelection = v4.callback, 
    layoutOrder = v4.number
}));
return function(v12)
    assert(v11(v12));
    local v13 = l_useStyle_0();
    local l_CaptionHeader_0 = v13.Font.CaptionHeader;
    local v15 = l_CaptionHeader_0.RelativeSize * v13.Font.BaseSize;
    local v16 = if not v13.UIBloxThemeEnabled then Color3.fromRGB(79, 84, 95) else v13.color("ControlInputBackground");
    local v17, v18 = v1.useState(false);
    local v19, v20 = v1.useState({});
    local v21 = v1.useCallback(function()
        v18(not v17);
    end);
    v1.useEffect(function()
        local v22 = {};
        for v23, v24 in pairs(v12.dropdownList) do
            v22[v23] = {
                text = v24, 
                fontStyle = {
                    Font = l_CaptionHeader_0.Font, 
                    RelativeSize = l_CaptionHeader_0.RelativeSize
                }, 
                onActivated = function()
                    v12.onSelection(v23);
                    v18(false);
                end, 
                leftPaddingOffset = -12, 
                selected = v23 == v12.selectedIndex, 
                selectedIconPaddingRight = 12
            };
        end;
        v20(v22);
    end, {
        v12.dropdownList, 
        v12.selectedIndex
    });
    return v2.createElement("Frame", {
        Size = v12.buttonSize, 
        LayoutOrder = v12.layoutOrder, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        ZIndex = 3
    }, {
        SpawnButton = v2.createElement("TextButton", {
            Size = UDim2.new(1, 0, 1, 0), 
            Text = v12.dropdownList[v12.selectedIndex], 
            TextColor3 = Color3.new(1, 1, 1), 
            TextSize = v15, 
            Font = l_CaptionHeader_0.Font, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            BackgroundColor3 = v16, 
            BackgroundTransparency = 0, 
            LayoutOrder = v12.layoutOrder, 
            [v2.Event.Activated] = v21
        }, {
            UICorner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 4)
            }), 
            UIPadding = v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 12)
            }), 
            UIStroke = v2.createElement("UIStroke", {
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
                Color = Color3.new(1, 1, 1), 
                Thickness = 1, 
                Transparency = 0.8
            }), 
            Arrow = v2.createElement(l_ImageSetLabel_0, {
                Image = v10, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 16, 0, 16), 
                Position = UDim2.new(1, -28, 0.5, -8)
            })
        }), 
        Dropdown = v17 and v2.createElement(l_BaseMenu_0, {
            buttonProps = v19, 
            position = UDim2.new(0, 0, 1, 6), 
            layoutOrder = 2, 
            elementHeight = 40, 
            background = {
                Color = v16
            }, 
            showDropShadow = true
        })
    });
end;
