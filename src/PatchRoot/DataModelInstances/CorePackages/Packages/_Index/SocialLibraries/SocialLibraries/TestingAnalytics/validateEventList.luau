local v0 = require(script:FindFirstAncestor("SocialLibraries").dependencies);
local l_llama_0 = v0.llama;
local v2 = require(script.Parent.Parent.Analytics.Enums);
local l_Contexts_0 = v2.Contexts;
local l_EventTypes_0 = v2.EventTypes;
local l_SubPages_0 = v2.SubPages;
local l_Pages_0 = v2.Pages;
local _ = require(script.Parent.Parent.Analytics.FireEvent.Types);
local v8 = require(script.Parent.Parent.Utils.isEnum);
local l_t_0 = v0.t;
local v10 = require(script.Parent.formatKeyValidationError);
local v11 = require(script.Parent.formatErrorForIncorrectKey);
local v12 = l_t_0.strictInterface({
    context = l_t_0.any, 
    eventType = l_t_0.any, 
    additionalInfo = l_t_0.optional(l_t_0.table), 
    formatRulesForAdditionalInfo = l_t_0.optional(l_t_0.table)
});
return function(v13, v14)
    l_llama_0.Dictionary.map(v13, function(v15, v16)
        local v17 = if not v8(v16) then v16 else v16.rawValue();
        assert(l_Contexts_0.isEnumValue(v15.context), v10("context", "a Context enum", v17));
        assert(l_EventTypes_0.isEnumValue(v15.eventType), v10("eventType", "an EventType enum", v17));
        local v18 = true;
        if type(v15.additionalInfo) ~= "table" then
            v18 = v15.additionalInfo == nil;
        end;
        assert(v18, v10("additionalInfo", "nil or a table", v17));
        v18 = true;
        if type(v15.formatRulesForAdditionalInfo) ~= "table" then
            v18 = v15.formatRulesForAdditionalInfo == nil;
        end;
        assert(v18, v10("formatRulesForAdditionalInfo", "nil or a table", v17));
        assert(v11(v12)(v15, v17));
        if v15.additionalInfo then
            v18 = true;
            if v15.additionalInfo.subpage ~= nil then
                v18 = l_SubPages_0.isEnumValue(v15.additionalInfo.subpage);
            end;
            assert(v18, v10("subpage additional info", "SubPages enum", v17));
            v18 = true;
            if v15.additionalInfo.page ~= nil then
                v18 = l_Pages_0.isEnumValue(v15.additionalInfo.page);
            end;
            assert(v18, v10("page additional info", "Pages enum", v17));
            l_llama_0.Dictionary.map(v14 or {}, function(v19, v20)
                assert(v19(v15.additionalInfo[v20]), v20 .. " key is invalid. Issue with: " .. v17);
            end);
        end;
    end);
    return true;
end;
