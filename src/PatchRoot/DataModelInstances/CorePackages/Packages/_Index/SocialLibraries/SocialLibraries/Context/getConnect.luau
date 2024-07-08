local v0 = require(script:FindFirstAncestor("SocialLibraries").dependencies);
local l_Roact_0 = v0.Roact;
local l_llama_0 = v0.llama;
return function(v3)
    return function(v4)
        return function(v5)
            local v6 = l_Roact_0.Component:extend("Connected-" .. tostring(v5));
            v6.render = function(v7)
                return l_Roact_0.createElement(v3.Consumer, {
                    render = function(v8)
                        return l_Roact_0.createElement(v5, l_llama_0.Dictionary.join(v7.props, v4(v8)));
                    end
                });
            end;
            return v6;
        end;
    end;
end;
