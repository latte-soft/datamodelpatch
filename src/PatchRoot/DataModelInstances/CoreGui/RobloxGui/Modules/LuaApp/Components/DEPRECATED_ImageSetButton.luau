local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_Modules_0.Common.Roact);
local v4 = require(l_Modules_0.Common.Immutable);
local l_GetImageSetData_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppAssets).GetImageSetData;
local v6 = require(l_CorePackages_0.Cryo);
local v7 = v3.PureComponent:extend("ImageSetButton");
v7.render = function(v8)
    local v9, v10 = l_GetImageSetData_0(l_GuiService_0:GetResolutionScale());
    local v11 = v9[v8.props.Image];
    if v11 then
        local l_forwardRef_0 = v8.props.forwardRef;
        local v13 = v4.RemoveFromDictionary(v8.props, "Image", "ImageRectOffset", "ImageRectSize", "SliceCenter", "forwardRef");
        v13[v3.Ref] = l_forwardRef_0;
        if v8.props.Image then
            v13.Image = "rbxasset://textures/ui/ImageSet/" .. v11.ImageSet .. ".png";
        end;
        if not v8.props.ImageRectOffset then
            v13.ImageRectOffset = v11.ImageRectOffset;
        else
            v13.ImageRectOffset = Vector2.new(v11.ImageRectOffset.X + v8.props.ImageRectOffset.X * v10, v11.ImageRectOffset.Y + v8.props.ImageRectOffset.Y * v10);
        end;
        if not v8.props.ImageRectSize then
            v13.ImageRectSize = v11.ImageRectSize;
        else
            v13.ImageRectSize = Vector2.new(v8.props.ImageRectSize.X * v10, v8.props.ImageRectSize.Y * v10);
        end;
        if v8.props.SliceCenter then
            v13.SliceCenter = Rect.new(v8.props.SliceCenter.Min.X * v10, v8.props.SliceCenter.Min.Y * v10, v8.props.SliceCenter.Max.X * v10, v8.props.SliceCenter.Max.Y * v10);
            if not v8.props.SliceScale then
                v13.SliceScale = 1 / v10;
            else
                v13.SliceScale = v8.props.SliceScale / v10;
            end;
        end;
        return v3.createElement("ImageButton", v13);
    else
        local l_forwardRef_1 = v8.props.forwardRef;
        local v15 = v4.RemoveFromDictionary(v8.props, "forwardRef");
        v15[v3.Ref] = l_forwardRef_1;
        return v3.createElement("ImageButton", v15);
    end;
end;
return v3.forwardRef(function(v16, v17)
    return v3.createElement(v7, v6.Dictionary.join(v16, {
        forwardRef = v17
    }));
end);
