local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_Modules_0.Common.Roact);
local v4 = require(l_Modules_0.Common.Immutable);
local l_GetImageSetData_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppAssets).GetImageSetData;
local l_GetImageSetPathPattern_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppAssets).GetImageSetPathPattern;
local v7 = require(l_CorePackages_0.Cryo);
local v8 = v3.PureComponent:extend("ImageSetLabel");
v8.render = function(v9)
    local v10, v11 = l_GetImageSetData_0(l_GuiService_0:GetResolutionScale());
    local v12 = v10[v9.props.Image];
    if v12 then
        local l_forwardRef_0 = v9.props.forwardRef;
        local v14 = v4.RemoveFromDictionary(v9.props, "Image", "ImageRectOffset", "ImageRectSize", "SliceCenter", "forwardRef");
        v14[v3.Ref] = l_forwardRef_0;
        if v9.props.Image then
            v14.Image = l_GetImageSetPathPattern_0(v12.ImageSet);
        end;
        if not v9.props.ImageRectOffset then
            v14.ImageRectOffset = v12.ImageRectOffset;
        else
            v14.ImageRectOffset = Vector2.new(v12.ImageRectOffset.X + v9.props.ImageRectOffset.X * v11, v12.ImageRectOffset.Y + v9.props.ImageRectOffset.Y * v11);
        end;
        if not v9.props.ImageRectSize then
            v14.ImageRectSize = v12.ImageRectSize;
        else
            v14.ImageRectSize = Vector2.new(v9.props.ImageRectSize.X * v11, v9.props.ImageRectSize.Y * v11);
        end;
        if v9.props.SliceCenter then
            v14.SliceCenter = Rect.new(v9.props.SliceCenter.Min.X * v11, v9.props.SliceCenter.Min.Y * v11, v9.props.SliceCenter.Max.X * v11, v9.props.SliceCenter.Max.Y * v11);
            if not v9.props.SliceScale then
                v14.SliceScale = 1 / v11;
            else
                v14.SliceScale = v9.props.SliceScale / v11;
            end;
        end;
        return v3.createElement("ImageLabel", v14);
    else
        local l_forwardRef_1 = v9.props.forwardRef;
        local v16 = v4.RemoveFromDictionary(v9.props, "forwardRef");
        v16[v3.Ref] = l_forwardRef_1;
        return v3.createElement("ImageLabel", v16);
    end;
end;
return v3.forwardRef(function(v17, v18)
    return v3.createElement(v8, v7.Dictionary.join(v17, {
        forwardRef = v18
    }));
end);
