local v0 = require(script.Parent.Parent.dependencies);
local l_GuiService_0 = game:GetService("GuiService");
local l_Roact_0 = v0.Roact;
local l_AppCommonLib_0 = v0.AppCommonLib;
local l_RobloxAppAssets_0 = v0.RobloxAppAssets;
local l_Cryo_0 = v0.Cryo;
local l_Immutable_0 = l_AppCommonLib_0.Immutable;
local l_GetImageSetData_0 = l_RobloxAppAssets_0.GetImageSetData;
local l_GetImageSetPathPattern_0 = l_RobloxAppAssets_0.GetImageSetPathPattern;
local v9 = l_Roact_0.PureComponent:extend("ImageSetLabel");
v9.render = function(v10)
    local v11, v12 = l_GetImageSetData_0(l_GuiService_0:GetResolutionScale());
    local v13 = v11[v10.props.Image];
    if v13 then
        local l_forwardRef_0 = v10.props.forwardRef;
        local v15 = l_Immutable_0.RemoveFromDictionary(v10.props, "Image", "ImageRectOffset", "ImageRectSize", "SliceCenter", "forwardRef");
        v15[l_Roact_0.Ref] = l_forwardRef_0;
        if v10.props.Image then
            v15.Image = l_GetImageSetPathPattern_0(v13.ImageSet);
        end;
        if not v10.props.ImageRectOffset then
            v15.ImageRectOffset = v13.ImageRectOffset;
        else
            v15.ImageRectOffset = Vector2.new(v13.ImageRectOffset.X + v10.props.ImageRectOffset.X * v12, v13.ImageRectOffset.Y + v10.props.ImageRectOffset.Y * v12);
        end;
        if not v10.props.ImageRectSize then
            v15.ImageRectSize = v13.ImageRectSize;
        else
            v15.ImageRectSize = Vector2.new(v10.props.ImageRectSize.X * v12, v10.props.ImageRectSize.Y * v12);
        end;
        if v10.props.SliceCenter then
            v15.SliceCenter = Rect.new(v10.props.SliceCenter.Min.X * v12, v10.props.SliceCenter.Min.Y * v12, v10.props.SliceCenter.Max.X * v12, v10.props.SliceCenter.Max.Y * v12);
            if not v10.props.SliceScale then
                v15.SliceScale = 1 / v12;
            else
                v15.SliceScale = v10.props.SliceScale / v12;
            end;
        end;
        return l_Roact_0.createElement("ImageLabel", v15);
    else
        local l_forwardRef_1 = v10.props.forwardRef;
        local v17 = l_Immutable_0.RemoveFromDictionary(v10.props, "forwardRef");
        v17[l_Roact_0.Ref] = l_forwardRef_1;
        return l_Roact_0.createElement("ImageLabel", v17);
    end;
end;
return l_Roact_0.forwardRef(function(v18, v19)
    return l_Roact_0.createElement(v9, l_Cryo_0.Dictionary.join(v18, {
        forwardRef = v19
    }));
end);
