local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameInvite");
local l_Context_0 = l_script_FirstAncestor_0.Context;
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.UIBlox);
local v5 = require(l_Context_0.GameInviteModalLayoutContext);
local v6 = require(l_script_FirstAncestor_0.GameInviteModalManager);
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_ImageSet_0 = v4.Core.ImageSet;
local l_Images_0 = v4.App.ImageSet.Images;
local v10 = Rect.new(8, 8, 9, 9);
return function(v11)
    local v12 = l_useStyle_0();
    local l_Theme_0 = v12.Theme;
    local v14 = nil;
    local v15 = nil;
    local v16 = nil;
    local v17 = v3.useContext(v5);
    local l_isFullWidth_0 = v17.isFullWidth;
    local l_isFullHeight_0 = v17.isFullHeight;
    local l_modalSize_0 = v17.modalSize;
    if not l_isFullWidth_0 and not l_isFullHeight_0 then
        v14 = Vector2.new(0.5, 0.5);
        v15 = "component_assets/circle_17";
        v16 = UDim2.new(0.5, 0, 0.5, 0);
    else
        v14 = Vector2.new(0.5, 1);
        v15 = "component_assets/bullet_17";
        v16 = UDim2.new(0.5, 0, 1, 0);
    end;
    return v3.createElement(l_ImageSet_0.ImageSetButton, {
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundColor3 = v12.Theme.Overlay.Color, 
        Transparency = v12.Theme.Overlay.Transparency, 
        AutoButtonColor = false, 
        ZIndex = 0, 
        [v3.Event.Activated] = function()
            v6:closeModal();
        end
    }, {
        GameInviteModalContainer = v3.createElement(l_ImageSet_0.ImageSetButton, {
            Position = v16, 
            Size = l_modalSize_0, 
            AnchorPoint = v14, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Image = l_Images_0[v15], 
            ImageColor3 = l_Theme_0.BackgroundDefault.Color, 
            ImageTransparency = l_Theme_0.BackgroundDefault.Transparency, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = v10, 
            AutoButtonColor = false, 
            ClipsDescendants = true, 
            Selectable = false
        }, v11.children)
    });
end;
