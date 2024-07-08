local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLibraries");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_llama_0 = v1.llama;
local l_UIBlox_0 = v1.UIBlox;
local l_PlayerTile_0 = l_UIBlox_0.App.Tile.PlayerTile;
local l_Interactable_0 = l_UIBlox_0.Core.Control.Interactable;
local v7 = require(l_script_FirstAncestor_0.User.getUserAvatarImage);
local v8 = require(script.Parent.PlayerName);
local _ = require(script.Parent.StyleTypes);
local v10 = require(script.Parent.Constants);
local function v11()
end;
local v12 = {
    tileSize = v10.TILE_SIZE, 
    nameTopPadding = v10.NAME_TOP_PADDING, 
    contextualTopPadding = v10.CONTEXTUAL_TOP_PADDING
};
return function(v13)
    local v14 = l_llama_0.Dictionary.join(v12, v13);
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
            return (l_Roact_0.createElement(l_PlayerTile_0, {
                tileSize = UDim2.fromOffset(v14.tileSize, v14.tileSize), 
                thumbnail = v7(v14.userId), 
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
    return l_Roact_0.createElement("Frame", {
        LayoutOrder = v14.layoutOrder, 
        Size = UDim2.fromOffset(l_tileSize_0, 0), 
        BackgroundTransparency = 1
    }, {
        UIListLayout = l_Roact_0.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        PlayerTileFrame = l_Roact_0.createElement("Frame", {
            LayoutOrder = 1, 
            Size = UDim2.fromOffset(l_tileSize_0, l_tileSize_0), 
            BackgroundTransparency = 1
        }, {
            PlayerTile = v17()
        }), 
        NameTopPadding = if not v14.nameTopPadding then nil else l_Roact_0.createElement("Frame", {
            LayoutOrder = 2, 
            Size = UDim2.fromOffset(0, v14.nameTopPadding), 
            BackgroundTransparency = 1
        }), 
        UserInfo = l_Roact_0.createElement(l_Interactable_0, {
            LayoutOrder = 3, 
            [l_Roact_0.Event.Activated] = v14.onActivatedContextual, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            onStateChanged = v11, 
            BackgroundTransparency = 1
        }, {
            UIListLayout = l_Roact_0.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            PlayerNameFrame = l_Roact_0.createElement("Frame", {
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.XY
            }, {
                PlayerName = (function()
                    if not v14.renderPlayerName then
                        return not not v14.userName and l_Roact_0.createElement(v8, {
                            name = v14.userName, 
                            width = v14.tileSize
                        }) or nil;
                    else
                        return (v14.renderPlayerName());
                    end;
                end)()
            }), 
            ContextualTopPadding = if not v14.contextualTopPadding then nil else l_Roact_0.createElement("Frame", {
                LayoutOrder = 2, 
                Size = UDim2.fromOffset(0, v14.contextualTopPadding), 
                BackgroundTransparency = 1
            }), 
            ContextualInfoFrame = l_Roact_0.createElement("Frame", {
                LayoutOrder = 3, 
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.XY
            }, {
                ContextualInfo = if not v14.renderContextualInfo then nil else v14.renderContextualInfo()
            })
        })
    });
end;
