" AI-powered code completion plugin

" Configuration
let g:ai_completion_endpoint = get(g:, 'ai_completion_endpoint', 'https://openrouter.ai/api/v1/chat/completions')
let g:ai_completion_model = get(g:, 'ai_completion_model', 'google/gemini-2.5-flash-lite-preview-06-17')
let g:ai_completion_max_tokens = get(g:, 'ai_completion_max_tokens', 200)
let g:ai_completion_temperature = get(g:, 'ai_completion_temperature', 0.2)
let g:ai_completion_context_lines = get(g:, 'ai_completion_context_lines', 10)
let g:ai_completion_env_file = get(g:, 'ai_completion_env_file', '~/.env')

function! s:GetEnvFromFile(file, key) abort
  try
    let l:lines = readfile(expand(a:file))
    for line in l:lines
      if line =~ '^' . a:key . '='
        return substitute(split(line, '=', 2)[1], '^"\(.*\)"$', '\1', '')
      endif
    endfor
  catch
    echoerr 'Failed to read environment file: ' . a:file
  endtry
  return ''
endfunction

function! s:GetContextLines(max_lines) abort
  let lnum = line('.')
  let start = max([1, lnum - a:max_lines])
  let context = []

  for i in range(start, lnum - 1)
    let line_content = getline(i)
    if line_content !=# ''
      call add(context, line_content)
    endif
  endfor

  return context
endfunction

function! s:BuildApiRequest() abort
  let api_key = s:GetEnvFromFile(g:ai_completion_env_file, "OPENROUTER_API_KEY")
  if empty(api_key)
    echoerr 'OPENROUTER_API_KEY not found in ' . g:ai_completion_env_file
    return {}
  endif

  let headers = [
        \ '-H', 'Content-Type: application/json',
        \ '-H', 'Authorization: Bearer ' . api_key,
        \ ]
  let headers = map(copy(headers), 'shellescape(v:val)')

  let context_lines = s:GetContextLines(g:ai_completion_context_lines)
  let current_line = getline('.')
  let code_context = join(context_lines + [current_line], "\n")

  let system_prompt = "You are a " . &filetype . " code autocompletion engine. " .
        \ "When extending a snippet of code, prefer adding helpful lines such as " .
        \ "logging, printing, or debugging statements when they are appropriate. " .
        \ "Respond only with the next few lines of code that continue the input. " .
        \ "Do not explain or format — only output the code."

  let payload = {
        \ "model": g:ai_completion_model,
        \ "messages": [
        \   {"role": "system", "content": system_prompt},
        \   {"role": "user", "content": code_context}
        \ ],
        \ "max_tokens": g:ai_completion_max_tokens,
        \ "temperature": g:ai_completion_temperature,
        \ "stop": ["```", "###", "<|endoftext|>"]
        \ }

  let body = ['-d', json_encode(payload)]
  let body = map(copy(body), 'shellescape(v:val)')

  return {
        \ 'headers': headers,
        \ 'body': body,
        \ 'endpoint': g:ai_completion_endpoint
        \ }
endfunction

function! s:CallApi(request) abort
  let cmd = ['curl', '-q', a:request.endpoint] + a:request.headers + a:request.body
  let cmd_string = join(cmd, ' ') . ' 2>/dev/null'

  let raw_response = system(cmd_string)
  if v:shell_error != 0
    echoerr "API request failed with exit code: " . v:shell_error
    return ''
  endif

  try
    let decoded = json_decode(raw_response)
  catch
    echoerr "Failed to parse API response as JSON"
    return ''
  endtry

  if !has_key(decoded, 'choices') || len(decoded.choices) == 0
    if has_key(decoded, 'error')
      echoerr "API error: " . get(decoded.error, 'message', 'Unknown error')
    else
      echoerr 'No completion returned from API'
    endif
    return ''
  endif

  return decoded.choices[0].message.content
endfunction

function! s:InsertCompletion(completion_text) abort
  if empty(a:completion_text)
    return
  endif

  " Get current line indentation
  let indent = matchstr(getline('.'), '^\s*')

  " Split completion into lines and apply indentation
  let completion_lines = split(a:completion_text, "\n")
  let indented_lines = map(completion_lines, 'indent . v:val')

  " Insert below the current line
  let start_line = line('.')
  call append(start_line, indented_lines)

  " Move cursor to end of inserted text
  let final_line = start_line + len(indented_lines)
  let final_col = strlen(getline(final_line)) + 1
  call cursor(final_line, final_col)
endfunction

function! s:GetAiCompletion() abort
  let request = s:BuildApiRequest()
  if empty(request)
    return
  endif

  echo 'Getting AI completion...'
  let completion_text = s:CallApi(request)
  call s:InsertCompletion(completion_text)
endfunction

command! AiComplete call s:GetAiCompletion()
inoremap <C-f> <C-o>:AiComplete<CR>

