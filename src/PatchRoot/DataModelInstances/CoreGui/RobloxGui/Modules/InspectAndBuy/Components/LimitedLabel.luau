local l_CorePackages_0 = game:GetService("CorePackages");
local l_Parent_0 = script.Parent.Parent;
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local v3 = require(l_CorePackages_0.UIBlox);
local l_Images_0 = v3.App.ImageSet.Images;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local v6 = require(l_CorePackages_0.Roact);
local v7 = v6.PureComponent:extend("LimitedLabel");
local v8 = require(l_Parent_0.Flags.GetFFlagIBEnableCollectiblesSystemSupport);
v7.render = function(v9)
    local l_frameSize_0 = v9.props.frameSize;
    local l_framePosition_0 = v9.props.framePosition;
    local l_imageSize_0 = v9.props.imageSize;
    local l_imagePosition_0 = v9.props.imagePosition;
    local l_textSize_0 = v9.props.textSize;
    local l_textPosition_0 = v9.props.textPosition;
    local l_text_0 = v9.props.text;
    return v6.createElement("Frame", {
        Size = l_frameSize_0, 
        BorderSizePixel = 0, 
        LayoutOrder = 3, 
        Position = l_framePosition_0, 
        BackgroundColor3 = Color3.fromRGB(120, 120, 120)
    }, {
        Corner = v6.createElement("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }), 
        CollectiblesIcon = v6.createElement(l_ImageSetLabel_0, {
            Position = l_imagePosition_0, 
            Size = l_imageSize_0, 
            BackgroundTransparency = 1, 
            ZIndex = 2, 
            Visible = true, 
            Image = l_Images_0["icons/status/item/limited"]
        }), 
        CollectiblesText = if not v8() or l_text_0 then v6.createElement("TextLabel", {
            Position = l_textPosition_0, 
            Size = l_textSize_0, 
            BackgroundTransparency = 1, 
            Text = l_text_0, 
            Font = l_AppFonts_0.default:getDefault(), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextSize = 12, 
            TextColor3 = Color3.new(1, 1, 1)
        }) else nil
    });
end;
return v7;
