local l_document_0 = require(script.Parent.Parent.Parent.DomTestingLibrary).document;
return {
    toBeInTheDocument = function(v1, v2, _)
        local v4 = {
            isNot = v1.isNot, 
            promise = v1.promise
        };
        return {
            message = function()
                return v1.utils.matcherHint("toBeInTheDocument", nil, nil, v4) .. "\n\n" .. (not v1.isNot and "element could not be found in the document" or "element was found in the document");
            end, 
            pass = v2:IsDescendantOf(l_document_0)
        };
    end, 
    toBeEmptyDOMElement = function(v5, v6, _)
        local v8 = {
            isNot = v5.isNot, 
            promise = v5.promise
        };
        return {
            message = function()
                return v5.utils.matcherHint("toBeEmptyDOMElement", nil, nil, v8) .. "\n\n" .. (not v5.isNot and "element is not empty" or "element is empty");
            end, 
            pass = #v6:GetChildren() == 0
        };
    end, 
    toHaveTextContent = function(v9, v10, v11)
        if v10:IsA("TextBox") then
            error("toHaveTextContent is not meant to be used with TextBox");
        end;
        local l_Text_0 = v10.Text;
        local v13 = not v11;
        if not v13 then
            v13 = true;
            if v11 ~= "" then
                v13 = l_Text_0 == "";
            end;
        end;
        local v14 = nil;
        if typeof(v11) == "string" then
            v14 = string.find(l_Text_0, v11, 1, true);
        elseif typeof(v11) == "table" and typeof(v11.test) == "function" then
            v14 = v11:test(l_Text_0);
        else
            error("Unhandled expected value type: string or regex is required");
        end;
        local v15 = {
            isNot = v9.isNot, 
            promise = v9.promise
        };
        return {
            message = function()
                return v9.utils.matcherHint("toHaveTextContent", nil, nil, v15) .. "\n\n" .. if not v13 then "Expected element " .. (not v9.isNot and "to" or "not to") .. " have text content" else "Checking with empty string will always match, use .toBeEmptyDOMElement() instead";
            end, 
            pass = not v13 and not not v14
        };
    end, 
    toHaveValue = function(v16, v17, v18)
        if not v17:IsA("TextBox") then
            error("toHaveValue is meant to be used only with TextBox");
        end;
        local l_Text_1 = v17.Text;
        local v20 = nil;
        if typeof(v18) == "string" then
            v20 = string.find(l_Text_1, v18, 1, true);
        elseif typeof(v18) == "table" and typeof(v18.test) == "function" then
            v20 = v18:test(l_Text_1);
        else
            error("Unhandled expected value type: string or regex is required");
        end;
        local v21 = {
            isNot = v16.isNot, 
            promise = v16.promise
        };
        return {
            message = function()
                return v16.utils.matcherHint("toHaveValue", nil, nil, v21) .. "\n\n" .. "Expected element " .. (not v16.isNot and "to" or "not to") .. " have value";
            end, 
            pass = not not v20
        };
    end
};
