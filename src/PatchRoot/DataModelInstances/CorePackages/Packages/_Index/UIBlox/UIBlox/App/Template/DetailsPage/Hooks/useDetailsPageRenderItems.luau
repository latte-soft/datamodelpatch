local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.Parent.Parent.Parent.React);
local _ = require(l_Parent_0.Types);
return function(v3, v4, v5, v6)
    local v12 = v1.useMemo(function()
        local v7 = {};
        for v8, v9 in v3, nil, nil do
            table.insert(v7, {
                index = v9.portraitLayoutOrder + 1, 
                renderComponent = v9.renderComponent, 
                showCornerGradient = v9.showCornerGradient, 
                useSelectionBumper = v9.useSelectionBumper, 
                key = v8
            });
        end;
        table.sort(v7, function(v10, v11)
            if v11.index then
                if v10.index then
                    return v10.index <= v11.index;
                else
                    return false;
                end;
            else
                return true;
            end;
        end);
        return v7;
    end, {
        v3
    });
    return (v1.useMemo(function()
        local v13 = table.clone(v12);
        table.insert(v13, 1, {
            index = 1, 
            key = "Header", 
            showCornerGradient = true, 
            renderComponent = function()
                return v1.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, v5.Y - v6.Y * 2), 
                    BackgroundTransparency = 1
                }, {
                    Layout = v1.createElement("UIListLayout", {
                        VerticalAlignment = Enum.VerticalAlignment.Bottom
                    }), 
                    HeaderContainer = v4
                });
            end
        });
        return v13;
    end, {
        v12, 
        v4, 
        v5.Y, 
        v6.Y
    }));
end;
