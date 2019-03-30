function ls --wraps=exa
   exa --color=auto --classify $argv
end

function l --wraps=exa
   ls -l $argv
end

function ll --wraps=exa
   l --all $argv
end