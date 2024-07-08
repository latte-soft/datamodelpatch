local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.RoactRodux);
local v6 = require(l_Parent_0.Colors);
local v7 = require(l_CoreGui_0.RobloxGui.Modules.RobloxTranslator);
local v8 = v4.PureComponent:extend("NoInventoryNotice");
v8.render = function(v9)
    local l_locale_0 = v9.props.locale;
    local l_assets_0 = v9.props.assets;
    local l_isLoaded_0 = v9.props.isLoaded;
    local l_createElement_0 = v4.createElement;
    local v14 = "Frame";
    local v15 = {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    };
    local v16 = false;
    if next(l_assets_0) == nil then
        v16 = l_isLoaded_0;
    end;
    v15.Visible = v16;
    return l_createElement_0(v14, v15, {
        UIListLayout = v4.createElement("UIListLayout", {
            Padding = UDim.new(0, 15), 
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        NotWearingImage = v4.createElement("ImageLabel", {
            AnchorPoint = Vector2.new(0.5, 0), 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0.25, 0, 0.25, 0), 
            LayoutOrder = 1, 
            Image = "rbxasset://textures/ui/InspectMenu/ico_isnt-wearing.png", 
            ImageColor3 = v6.White
        }, {
            UIAspectRatioConstraint = v4.createElement("UIAspectRatioConstraint", {
                AspectRatio = 1
            })
        }), 
        NotWearingText = v4.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0.8, 0, 0.3, 0), 
            LayoutOrder = 2, 
            Font = l_AppFonts_0.default:getDefault(), 
            Text = v7:FormatByKeyForLocale("InGame.InspectMenu.Description.NoInventoryNotice", l_locale_0), 
            TextScaled = true, 
            TextColor3 = v6.White, 
            TextSize = 20, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            TextWrapped = true
        }, {
            UITextSizeConstraint = v4.createElement("UITextSizeConstraint", {
                MaxTextSize = 20
            })
        })
    });
end;
return v5.UNSTABLE_connect2(function(v17, _)
    return {
        assets = v17.assets, 
        locale = v17.locale, 
        isLoaded = v17.isLoaded
    };
end)(v8);
