local l_Roact_0 = require(game:GetService("CorePackages").InGameMenuDependencies).Roact;
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Resources.Controls);
local v3 = require(script.Parent.Parent.ControlLayoutContainer);
local v4 = require(l_Parent_0.Components.PaddedScrollFrame);
local v5 = require(script.Parent.Parent.ControlEntry);
local v6 = require(script.Parent.Parent.ControlEntryHeader);
return function(_)
    local v8 = {
        ListLayout = l_Roact_0.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Padding = l_Roact_0.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 95), 
            PaddingRight = UDim.new(0, 95)
        }), 
        SizeConstraint = l_Roact_0.createElement("UISizeConstraint", {
            MaxSize = Vector2.new(1090, math.huge), 
            MinSize = Vector2.new(150, 0)
        })
    };
    local v9 = 0;
    local v10 = 0;
    local v11 = 1;
    for _, v13 in ipairs(v2.keybinds) do
        local l_title_0 = v13.title;
        v9 = v9 + 1;
        v8[l_title_0 .. "_header"] = l_Roact_0.createElement(v6, {
            title = l_title_0, 
            LayoutOrder = v11
        });
        v11 = v11 + 1;
        for v15, v16 in ipairs(v13.controls) do
            v10 = v10 + 1;
            v8[l_title_0 .. "_" .. v15] = l_Roact_0.createElement(v5, {
                LayoutOrder = v11, 
                actionDescription = v16.desc, 
                inputs = v16.inputs, 
                isList = v16.list, 
                hasDivider = v15 ~= #v13.controls
            });
            v11 = v11 + 1;
        end;
    end;
    return l_Roact_0.createElement(v3, {
        titleText = "CoreScripts.InGameMenu.Controls.KeyboardAndMouseTitle"
    }, {
        ScrollContent = l_Roact_0.createElement(v4, {
            CanvasSize = UDim2.new(0, 0, 0, 45 * v9 + 50 * v10), 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            Size = UDim2.new(1, 0, 1, -130)
        }, {
            ListContainer = l_Roact_0.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                AnchorPoint = Vector2.new(0.5, 0), 
                Position = UDim2.new(0.5, 0, 0, 0)
            }, v8)
        })
    });
end;
