local l_Parent_0 = script:FindFirstAncestor("ErrorReporters").Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.t);
local v4 = require(script.Parent.ProcessErrorStack);
local v5 = require(script.Parent.Flags.GetFFlagBacktraceMainSourcePathEnabled);
local v6 = v3.strictInterface({
    name = v3.optional(v3.string), 
    fault = v3.optional(v3.boolean), 
    stack = v3.optional(v3.array((v3.strictInterface({
        guessed_frame = v3.optional(v3.boolean), 
        funcName = v3.optional(v3.string), 
        address = v3.optional(v3.string), 
        line = v3.optional(v3.string), 
        column = v3.optional(v3.string), 
        sourceCode = v3.optional(v3.string), 
        library = v3.optional(v3.string), 
        debug_identifier = v3.optional(v3.string), 
        faulted = v3.optional(v3.boolean), 
        registers = v3.optional(v3.map(v3.string, v3.some(v3.string, v3.number)))
    }))))
});
local v7 = v3.strictInterface({
    name = v3.string, 
    registers = v3.map(v3.string, v3.string)
});
local v8 = v3.strictInterface({
    text = v3.optional(v3.string), 
    startLine = v3.optional(v3.number), 
    startColumn = v3.optional(v3.number), 
    startPos = v3.optional(v3.number), 
    path = v3.optional(v3.string), 
    tabWidth = v3.optional(v3.number)
});
local v9 = v3.strictInterface({
    start = v3.string, 
    size = v3.optional(v3.number), 
    data = v3.optional(v3.string), 
    perms = v3.optional((v3.strictInterface({
        read = v3.boolean, 
        write = v3.boolean, 
        exec = v3.boolean
    })))
});
local v10 = v3.strictInterface({
    start = v3.string, 
    size = v3.number, 
    code_file = v3.optional(v3.string), 
    version = v3.optional(v3.string), 
    debug_file = v3.optional(v3.string), 
    debug_identifier = v3.optional(v3.string), 
    debug_file_exists = v3.optional(v3.boolean)
});
local v11 = v3.optional(v3.map(v3.string, v3.some(v3.string, v3.number, v3.boolean)));
local v19 = v3.optional(v3.map(v3.string, function(v12)
    local function v13(v14)
        if type(v14) == "table" then
            for v15, v16 in pairs(v14) do
                local v17, v18 = v13(v16);
                if not v17 then
                    return false, string.format("error when checking key: %s - %s", v15, v18);
                end;
            end;
            return true;
        else
            return v3.some(v3.string, v3.number, v3.boolean)(v14);
        end;
    end;
    return v13(v12);
end));
local v27 = v3.intersection(v3.strictInterface({
    uuid = v3.string, 
    timestamp = v3.number, 
    lang = v3.string, 
    langVersion = v3.string, 
    agent = v3.string, 
    agentVersion = v3.string, 
    threads = v3.map(v3.string, v6), 
    mainThread = v3.string, 
    attributes = v11, 
    annotations = v19, 
    symbolication = v3.optional(v3.literal("minidump")), 
    entryThread = v3.optional(v3.string), 
    arch = v3.optional(v7), 
    fingerprint = v3.optional(v3.string), 
    classifiers = v3.optional(v3.array(v3.string)), 
    sourceCode = v3.optional(v3.map(v3.string, v8)), 
    memory = v3.optional(v3.array(v9)), 
    modules = v3.optional(v3.array(v10))
}), function(v20)
    local v21 = false;
    for _, v23 in pairs(v20.threads) do
        local l_stack_0 = v23.stack;
        if l_stack_0 ~= nil then
            for _, v26 in ipairs(l_stack_0) do
                if v26.registers ~= nil then
                    v21 = true;
                    break;
                end;
            end;
        end;
        if v21 then
            break;
        end;
    end;
    if v21 and v20.arch == nil then
        return false, "arch must exist if you want to have registers in the stack";
    else
        return true;
    end;
end);
local v28 = {
    IAttributes = v11, 
    IAnnotations = v19
};
v28.__index = v28;
local function _(v29)
    if v29 and type(v29) == "table" then
        local v30 = v2.Dictionary.keys(v29);
        if #v30 > 0 then
            local v31 = v29[v30[1]];
            if v31 and v31.path ~= nil then
                return v31.path;
            end;
        end;
    end;
    return "";
end;
v28.validate = function(v33)
    return v27(v33);
end;
v28.new = function()
    local v34 = {
        uuid = l_HttpService_0:GenerateGUID(false):lower(), 
        timestamp = os.time(), 
        lang = "lua", 
        langVersion = "Roblox", 
        agent = "backtrace-Lua", 
        agentVersion = "0.1.0", 
        threads = {}, 
        mainThread = "default"
    };
    setmetatable(v34, v28);
    return v34;
end;
v28.addAttributes = function(v35, v36)
    if type(v36) ~= "table" then
        warn("Cannot add attributes of type: ", (type(v36)));
        return ;
    else
        v35.attributes = v2.Dictionary.join(v35.attributes or {}, v36);
        return ;
    end;
end;
v28.addAnnotations = function(v37, v38)
    if type(v38) ~= "table" then
        warn("Cannot add annotations of type: ", (type(v38)));
        return ;
    else
        v37.annotations = v2.Dictionary.join(v37.annotations or {}, v38);
        return ;
    end;
end;
v28.addStackToThread = function(v39, v40, v41)
    v39.threads = v2.Dictionary.join(v39.threads, {
        [v41] = {
            name = v41, 
            stack = v40
        }
    });
end;
v28.addStackToMainThread = function(v42, v43)
    v42:addStackToThread(v43, v42.mainThread);
end;
v28.fromMessageAndStack = function(v44, v45)
    local v46 = v28.new();
    v46:addAttributes({
        ["error.message"] = v44
    });
    local v47, v48 = v4(v45);
    v46:addStackToMainThread(v47);
    v46.sourceCode = v48;
    if v5() then
        local v49 = {};
        local l_sourceCode_0 = v46.sourceCode;
        local v51;
        if l_sourceCode_0 and type(l_sourceCode_0) == "table" then
            local v52 = v2.Dictionary.keys(l_sourceCode_0);
            if #v52 > 0 then
                local v53 = l_sourceCode_0[v52[1]];
                if v53 and v53.path ~= nil then
                    v51 = v53.path;
                    goto label0 --[[  true, true  ]];
                end;
            end;
        end;
        v51 = "";
        ::label0::;
        v49.MainSourcePath = v51;
        v46:addAttributes(v49);
    end;
    return v46;
end;
v28.fromDetails = function(v54)
    local v55 = v28.new();
    v55:addAttributes({
        ["error.message"] = v54.message
    });
    v55.sourceCode = {};
    local v56 = 0;
    for v57, v58 in ipairs(v54.stacks) do
        local v59, v60, v61 = v4(v58, v56);
        if v57 == 1 then
            v55:addStackToMainThread(v59);
        else
            v55:addStackToThread(v59, "stack" .. v57);
        end;
        v55.sourceCode = v2.Dictionary.join(v55.sourceCode, v60);
        v56 = v61;
    end;
    v55:addAnnotations(v54.annotations);
    if v5() then
        local v62 = {};
        local l_sourceCode_1 = v55.sourceCode;
        local v64;
        if l_sourceCode_1 and type(l_sourceCode_1) == "table" then
            local v65 = v2.Dictionary.keys(l_sourceCode_1);
            if #v65 > 0 then
                local v66 = l_sourceCode_1[v65[1]];
                if v66 and v66.path ~= nil then
                    v64 = v66.path;
                    goto label1 --[[  true, true  ]];
                end;
            end;
        end;
        v64 = "";
        ::label1::;
        v62.MainSourcePath = v64;
        v55:addAttributes(v62);
    end;
    return v55;
end;
return v28;
