local l_Parent_0 = script:FindFirstAncestor("SocialCommon").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.UIBlox);
local l_PlayerTile_0 = v3.App.Tile.PlayerTile;
local l_Interactable_0 = v3.Core.Control.Interactable;
local l_getStandardSizeAvatarHeadShotRbxthumb_0 = require(l_Parent_0.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb;
local v7 = require(script.Parent.PlayerName);
local v8 = require(script.Parent.Constants);
local l_FFlagContactRecs_0 = require(l_Parent_0.SharedFlags).FFlagContactRecs;
local l_FFlagUseSizeInClipRect_0 = require(l_Parent_0.SharedFlags).FFlagUseSizeInClipRect;
local function v11()
end;
local v12 = {
    tileSize = v8.TILE_SIZE, 
    nameTopPadding = v8.NAME_TOP_PADDING, 
    contextualTopPadding = v8.CONTEXTUAL_TOP_PADDING
};
return function(v13)
    local v14 = v2.Dictionary.join(v12, v13);
    local l_tileSize_0 = v14.tileSize;
    local function _()
        if not v14.renderButtons then
            return nil;
        else
            return (v14.renderButtons());
        end;
    end;
    local function v17()
        if not v14.renderPlayerTile then
            return (v1.createElement(l_PlayerTile_0, {
                title = "", 
                tileSize = UDim2.fromOffset(v14.tileSize, v14.tileSize), 
                thumbnail = if not not l_FFlagContactRecs_0 and v14.headshotImageUrl then v14.headshotImageUrl else l_getStandardSizeAvatarHeadShotRbxthumb_0(v14.userId), 
                onActivated = v14.onActivatedTile, 
                buttons = if not v14.renderButtons then nil else v14.renderButtons()
            }));
        else
            return (v14.renderPlayerTile());
        end;
    end;
    local function _()
        if not v14.renderContextualInfo then
            return nil;
        else
            return (v14.renderContextualInfo());
        end;
    end;
    return v1.createElement("Frame", {
        LayoutOrder = v14.layoutOrder, 
        Size = if not l_FFlagUseSizeInClipRect_0 then UDim2.fromOffset(l_tileSize_0, 0) else UDim2.new(0, l_tileSize_0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        UIListLayout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        PlayerTileFrame = v1.createElement("Frame", {
            LayoutOrder = 1, 
            Size = UDim2.fromOffset(l_tileSize_0, l_tileSize_0), 
            BackgroundTransparency = 1
        }, {
            PlayerTile = v17()
        }), 
        NameTopPadding = if not v14.nameTopPadding then nil else v1.createElement("Frame", {
            LayoutOrder = 2, 
            Size = UDim2.fromOffset(0, v14.nameTopPadding), 
            BackgroundTransparency = 1
        }), 
        UserInfo = v1.createElement(l_Interactable_0, {
            LayoutOrder = 3, 
            [v1.Event.Activated] = v14.onActivatedContextual, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            onStateChanged = v11, 
            BackgroundTransparency = 1
        }, {
            UIListLayout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            PlayerNameFrame = v1.createElement("Frame", {
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.XY
            }, {
                PlayerName = (function()
                    if not v14.renderPlayerName then
                        return not not v14.userName and v1.createElement(v7, {
                            name = v14.userName, 
                            width = v14.tileSize
                        }) or nil;
                    else
                        return (v14.renderPlayerName());
                    end;
                end)()
            }), 
            ContextualTopPadding = if not v14.contextualTopPadding then nil else v1.createElement("Frame", {
                LayoutOrder = 2, 
                Size = UDim2.fromOffset(0, v14.contextualTopPadding), 
                BackgroundTransparency = 1
            }), 
            ContextualInfoFrame = v1.createElement("Frame", {
                LayoutOrder = 3, 
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.XY
            }, {
                ContextualInfo = if not v14.renderContextualInfo then nil else v14.renderContextualInfo()
            })
        })
    });
end;
