function XCommit()
    vim.notify("--------------------------------------------------", vim.log.levels.WARN)
    vim.notify("Checking git status...", vim.log.levels.DEBUG)
    local gitstatus = vim.fn.system("git status")
    vim.notify(gitstatus, vim.log.levels.DEBUG)

    -- check if "Tracked files" is in the git status
    if string.find(gitstatus, "Tracked files") == nil then
        vim.notify("No changes to tracked files. Exiting.", vim.log.levels.ERROR)
        return
    end

    vim.notify("--------------------------------------------------", vim.log.levels.WARN)

    local diff = vim.fn.system("git diff")
    local gpt_completion = GptCall("Write a one line git commit message for this diff: \n\n" .. diff)

    vim.notify("Wrote commit message: " .. gpt_completion, vim.log.levels.DEBUG)

    vim.notify("--------------------------------------------------", vim.log.levels.WARN)
    vim.notify("Adding all tracked files...", vim.log.levels.DEBUG)
    local gitadd = vim.fn.system("git add -u")
    vim.notify(gitadd, vim.log.levels.DEBUG)
    vim.notify("--------------------------------------------------", vim.log.levels.WARN)

    vim.notify("Committing...", vim.log.levels.DEBUG)
    local gitcommit = vim.fn.system("git commit -m '" .. gpt_completion .. "'")
    vim.notify(gitcommit, vim.log.levels.DEBUG)

    vim.notify("--------------------------------------------------", vim.log.levels.WARN)

    vim.notify("Pushing...", vim.log.levels.DEBUG)
    local gitpush = vim.fn.system("git push")
    vim.notify(gitpush, vim.log.levels.DEBUG)
end

local function remove_non_ascii(str)
    return str:gsub("[^\32-\126]", "")
end

local function escape_str(s)
    -- note that this replaces ' with " because I was having issues with the json
    local escapes = { ['\n'] = '\\n', ['"'] = '\\"', ["'"] = "\\\"", ["\\"] = "\\\\", ["\t"] = "\\t" }
    return s:gsub('.', escapes)
end

function GptCall(user_string)
    vim.notify("Calling GPT...", vim.log.levels.DEBUG)
    local api_key = os.getenv("OPENAI_API_KEY")
    -- vim.notify("Found OpenAI Key: " .. api_key, vim.log.levels.DEBUG)

    local OPENAI_API_HOST = "api.openai.com"
    local CHAT_COMPLETIONS_URL = "https://" .. OPENAI_API_HOST .. "/v1/chat/completions"
    -- vim.notify("Chat Completions Url: " .. CHAT_COMPLETIONS_URL, vim.log.levels.DEBUG)

    user_string = remove_non_ascii(user_string)
    user_string = escape_str(user_string)  -- Use the escape function
    local json_data = string.format('{"model": "gpt-3.5-turbo", "messages": [{"role": "user" , "content": "%s"}]}', user_string)

    -- For debugging json
    -- local file = io.open("testjsondata.txt", "w")
    -- file:write(json_data)
    -- file:close()

    local curl_command = "curl -s " .. CHAT_COMPLETIONS_URL .. " -H 'Content-Type: application/json' -H 'Authorization: Bearer " .. api_key .. "' -d '" .. json_data .. "'"
    -- vim.notify("Curl Command: " .. curl_command, vim.log.levels.DEBUG)
    local gpt_completion = vim.fn.system(curl_command)

    local json = vim.fn.json_decode(gpt_completion)
    if json == nil then
        vim.notify("No Response.", vim.log.levels.DEBUG)
    elseif json.error then
        vim.notify("API ERROR: " .. json.error.message, vim.log.levels.DEBUG)
    else
        local message = json.choices[1].message
        if message ~= nil then
            local response_text = json.choices[1].message.content
            if type(response_text) == "string" and response_text ~= "" then
                --vim.notify("Got a response: " .. response_text, vim.log.levels.ERROR)
                -- THIS IS THE VALID RESPONSE?

                -- replace all " in the response with nothing
                response_text = response_text:gsub('"', '')
                return response_text
            else
                vim.notify("...", vim.log.levels.ERROR)
            end
        else
            local response_text = json.choices[1].text
            if type(response_text) == "string" and response_text ~= "" then
                vim.notify("Got a response: " .. response_text, vim.log.levels.ERROR)
                vim.notify("Used " .. json.usage .. " tokens.", vim.log.levels.ERROR)
            else
                vim.notify("...", vim.log.levels.ERROR)
            end
        end
    end

    return "Unknown"
end

