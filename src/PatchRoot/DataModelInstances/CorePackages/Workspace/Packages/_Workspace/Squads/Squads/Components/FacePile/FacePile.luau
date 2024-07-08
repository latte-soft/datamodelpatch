local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local v1 = require(l_script_FirstAncestor_0.Common.getColorFromUserId);
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_Dash_0 = v2.Dash;
local l_UIBlox_0 = v2.UIBlox;
local l_dependencyArray_0 = v2.Hooks.dependencyArray;
local l_llama_0 = v2.llama;
local l_getStandardSizeAvatarHeadShotRbxthumb_0 = v2.getStandardSizeAvatarHeadShotRbxthumb;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local v10 = require(l_script_FirstAncestor_0.Parent.React);
local v11 = {
    borderColor = Color3.fromRGB(0, 0, 0), 
    borderWidth = 0, 
    horizontalAlignment = Enum.HorizontalAlignment.Left, 
    facePileWidth = UDim.new(1, 0), 
    layoutOrder = 0, 
    reverse = false
};
return function(v12)
    local v13 = l_Dash_0.join(v11, v12 or {});
    local v14 = v10.useRef(nil);
    local v15, v16 = v10.useState(0);
    local v17 = l_useStyle_0();
    local l_Theme_0 = v17.Theme;
    local l_Font_0 = v17.Font;
    v10.useEffect(function()
        v16(if not not v14 and v14.current then v14.current.AbsoluteSize.X else 0);
    end);
    return v10.createElement("Frame", {
        ref = v14, 
        Size = UDim2.new(v13.facePileWidth.Scale, v13.facePileWidth.Offset, 0, v13.avatarSize), 
        BackgroundTransparency = 1, 
        LayoutOrder = v13.layoutOrder, 
        [v10.Change.AbsoluteSize] = v10.useCallback(function(v20)
            v16(v20.AbsoluteSize.X);
        end, l_dependencyArray_0(v16))
    }, (v10.useMemo(function()
        local l_users_0 = v13.users;
        local l_avatarSize_0 = v13.avatarSize;
        local l_overlapOffset_0 = v13.overlapOffset;
        local l_borderWidth_0 = v13.borderWidth;
        local l_borderColor_0 = v13.borderColor;
        local v26 = if not v13.faceCount then #l_users_0 else v13.faceCount;
        local l_horizontalAlignment_0 = v13.horizontalAlignment;
        local l_reverse_0 = v13.reverse;
        if not ((((v15 >= l_avatarSize_0 and l_avatarSize_0 >= l_overlapOffset_0) and v15 > 0) and l_avatarSize_0 > 0) and v26 > 0) or v26 < #l_users_0 then
            return nil;
        else
            local v29 = 0;
            v29 = if l_avatarSize_0 == l_overlapOffset_0 then v26 else math.floor((v15 - l_avatarSize_0) / (l_avatarSize_0 - l_overlapOffset_0)) + 1;
            local v30 = {};
            for v31 = 1, v26 do
                if v29 >= v31 then
                    local v32 = "AvatarCell" .. v31;
                    local v33 = UDim2.fromOffset(l_avatarSize_0 - l_borderWidth_0 * 2, l_avatarSize_0 - l_borderWidth_0 * 2);
                    local _ = nil;
                    v30[v32] = v10.createElement("Frame", {
                        Size = UDim2.fromOffset(l_avatarSize_0, l_avatarSize_0), 
                        BackgroundTransparency = 0, 
                        BackgroundColor3 = l_borderColor_0, 
                        LayoutOrder = v31, 
                        ZIndex = if not l_reverse_0 then v31 else (v26 - v31) + 1
                    }, {
                        UICorner = v10.createElement("UICorner", {
                            CornerRadius = UDim.new(1, 0)
                        }), 
                        UserAvatar = if v31 == v29 and v29 < v26 then v10.createElement("TextLabel", {
                            Font = l_Font_0.CaptionHeader.Font, 
                            TextColor3 = l_Theme_0.TextEmphasis.Color, 
                            TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                            Text = "+" .. math.min((v26 - v29) + 1, 99), 
                            Size = v33, 
                            TextSize = l_Font_0.BaseSize * l_Font_0.CaptionHeader.RelativeSize, 
                            Position = UDim2.fromScale(0.5, 0.5), 
                            AnchorPoint = Vector2.new(0.5, 0.5), 
                            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color
                        }, {
                            UICorner = v10.createElement("UICorner", {
                                CornerRadius = UDim.new(1, 0)
                            })
                        }) else if v31 <= #l_users_0 then v10.createElement(l_ImageSetLabel_0, {
                            Image = l_getStandardSizeAvatarHeadShotRbxthumb_0(l_users_0[v31]), 
                            Size = v33, 
                            Position = UDim2.fromScale(0.5, 0.5), 
                            AnchorPoint = Vector2.new(0.5, 0.5), 
                            BackgroundColor3 = v1((tonumber(l_users_0[v31])))
                        }, {
                            UICorner = v10.createElement("UICorner", {
                                CornerRadius = UDim.new(1, 0)
                            })
                        }) else v10.createElement("Frame", {
                            Size = v33, 
                            Position = UDim2.fromScale(0.5, 0.5), 
                            AnchorPoint = Vector2.new(0.5, 0.5), 
                            BackgroundColor3 = l_Theme_0.TextSecondary
                        }, {
                            UICorner = v10.createElement("UICorner", {
                                CornerRadius = UDim.new(1, 0)
                            })
                        })
                    });
                else
                    break;
                end;
            end;
            return l_llama_0.Dictionary.join(v30, {
                layout = v10.createElement("UIListLayout", {
                    HorizontalAlignment = l_horizontalAlignment_0, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, -l_overlapOffset_0)
                })
            });
        end;
    end, l_dependencyArray_0(v15, v13.users, v13.avatarSize, v13.overlapOffset, v13.borderWidth, v13.borderColor, v13.faceCount, v13.horizontalAlignment, v13.reverse))));
end;
