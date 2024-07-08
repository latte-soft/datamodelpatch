local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_Modules_0.Settings.Pages.ShareGame.Constants);
local l_Constants_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.Constants;
local l_getRbxthumbWithTypeSizeAndOptions_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions;
local l_GRAY3_0 = v3.Color.GRAY3;
local l_InviteAvatarThumbnailSize_0 = v3.InviteAvatarThumbnailSize;
local v8 = {
    [1] = {
        {
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            FrameSize = UDim2.new(1, 0, 1, 0), 
            FramePosition = UDim2.new(0, 0, 0, 0)
        }
    }, 
    [2] = {
        {
            Size = UDim2.new(2, 0, 1, 0), 
            Position = UDim2.new(-0.5, 0, 0, 0), 
            FrameSize = UDim2.new(0.5, -1, 1, 0), 
            FramePosition = UDim2.new(0, 0, 0, 0), 
            Border = {
                BorderPosition = UDim2.new(0.5, -1, 0, 0), 
                BorderSize = UDim2.new(0, 1, 1, 0)
            }
        }, 
        {
            Size = UDim2.new(2, 0, 1, 0), 
            Position = UDim2.new(-0.5, 0, 0, 0), 
            FrameSize = UDim2.new(0.5, -1, 1, 0), 
            FramePosition = UDim2.new(0.5, 1, 0, 0)
        }
    }, 
    [3] = {
        {
            Size = UDim2.new(2, 0, 1, 0), 
            Position = UDim2.new(-0.5, 0, 0, 0), 
            FrameSize = UDim2.new(0.5, -1, 1, 0), 
            FramePosition = UDim2.new(0, 0, 0, 0), 
            Border = {
                BorderPosition = UDim2.new(0.5, -1, 0, 0), 
                BorderSize = UDim2.new(0, 1, 1, 0)
            }
        }, 
        {
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            FrameSize = UDim2.new(0.5, -1, 0.5, -1), 
            FramePosition = UDim2.new(0.5, 1, 0, 0), 
            Border = {
                BorderPosition = UDim2.new(0.5, 0, 0.5, -1), 
                BorderSize = UDim2.new(0.5, 0, 0, 1)
            }
        }, 
        {
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            FrameSize = UDim2.new(0.5, -1, 0.5, -1), 
            FramePosition = UDim2.new(0.5, 1, 0.5, 1)
        }
    }, 
    [4] = {
        {
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            FrameSize = UDim2.new(0.5, -1, 0.5, -1), 
            FramePosition = UDim2.new(0, 0, 0, 0), 
            Border = {
                BorderPosition = UDim2.new(0, 0, 0.5, -1), 
                BorderSize = UDim2.new(1, 0, 0, 1)
            }
        }, 
        {
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            FrameSize = UDim2.new(0.5, -1, 0.5, -1), 
            FramePosition = UDim2.new(0.5, 1, 0, 0)
        }, 
        {
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            FrameSize = UDim2.new(0.5, -1, 0.5, -1), 
            FramePosition = UDim2.new(0, 0, 0.5, 1), 
            Border = {
                BorderPosition = UDim2.new(0.5, -1, 0, 0), 
                BorderSize = UDim2.new(0, 1, 1, 0)
            }
        }, 
        {
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            FrameSize = UDim2.new(0.5, -1, 0.5, -1), 
            FramePosition = UDim2.new(0.5, 1, 0.5, 1)
        }
    }
};
local v9 = v2.PureComponent:extend("ConversationThumbnail");
v9.render = function(v10)
    local l_size_0 = v10.props.size;
    local l_layoutOrder_0 = v10.props.layoutOrder;
    local l_zIndex_0 = v10.props.zIndex;
    local l_users_0 = v10.props.users;
    local v15 = #l_users_0;
    local v16 = {};
    for v17, v18 in ipairs(l_users_0) do
        local v19 = v8[v15][v17];
        local v20 = nil;
        if v18 then
            v20 = l_getRbxthumbWithTypeSizeAndOptions_0(v18.id, v3.InviteAvatarRbxthumbType, l_Constants_0.RbxThumbnailSizeToNumberSize[l_InviteAvatarThumbnailSize_0]);
        end;
        if not v20 then
            v20 = "rbxasset://textures/ui/LuaApp/graphic/ph-avatar-portrait.png";
        end;
        v16["AvatarHolder-" .. v17] = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            ClipsDescendants = true, 
            Size = v19.FrameSize, 
            Position = v19.FramePosition, 
            ZIndex = l_zIndex_0
        }, {
            Avatar = v2.createElement("ImageLabel", {
                BackgroundTransparency = 1, 
                Size = v19.Size, 
                Position = v19.Position, 
                Image = v20, 
                ZIndex = l_zIndex_0
            })
        });
        if v19.Border then
            v16["Border-" .. v17] = v2.createElement("Frame", {
                Size = v19.Border.BorderSize, 
                Position = v19.Border.BorderPosition, 
                BorderSizePixel = 0, 
                BackgroundColor3 = l_GRAY3_0, 
                ZIndex = l_zIndex_0
            });
        end;
    end;
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = l_size_0, 
        LayoutOrder = l_layoutOrder_0, 
        ZIndex = l_zIndex_0
    }, {
        ContentsContainer = v2.createElement("Frame", {
            BackgroundTransparency = 0, 
            Size = UDim2.new(1, -1, 1, -1), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            BackgroundColor3 = v3.Color.WHITE, 
            BorderColor3 = l_GRAY3_0, 
            BorderSizePixel = 1, 
            ZIndex = l_zIndex_0
        }, v16)
    });
end;
return v9;
