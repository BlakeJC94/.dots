let g:vim_chat_config = {
  \ "default": {
  \   "model": "phi4:latest",
  \   },
  \ "deepseek": {
  \   "model": "deepseek-r1:8b",
  \   },
  \ "brainstorm": {
  \   "model": "phi4:latest",
  \   "system_prompt": "Ask me one question at a time so we can develop a thorough, step-by-step spec for this idea. Each question should build on my previous answers, and our end goal is to have a detailed specification I can hand off to a developer. Let’s do this iteratively and dig into every relevant detail. Remember, only one question at a time.",
  \   },
  \ }
