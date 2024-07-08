local v0 = require(script.Parent.isVisible);
return function(_, v2, ...)
    if typeof(v2) ~= "Instance" then
        return {
            pass = false, 
            message = function()
                return string.format("Expected `%s` to be a GuiObject, got %s", tostring(v2), (typeof(v2)));
            end
        };
    else
        local v3 = v2:IsA("GuiObject");
        local v4 = v3 and v0(v2);
        local v5 = nil;
        if not v4 then
            local v6 = v3 and "one of the ancestor of the received GuiObject has not set the Visible property, or the ScreenGui is disabled or not parented" or string.format("the received Instance is not a GuiObject (got %s)", v2.ClassName);
            v5 = function()
                return string.format("Expected `%s` to be visible, but " .. v6, v2:GetFullName());
            end;
        else
            v5 = function()
                return string.format("Expected `%s` not to be visible", v2:GetFullName());
            end;
        end;
        return {
            pass = v4, 
            message = v5
        };
    end;
end;
