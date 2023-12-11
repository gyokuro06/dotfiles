function kubectl_status
  [ -z "$KUBECTL_PROMPT_ICON" ]; and set -l KUBECTL_PROMPT_ICON "⎈"
  [ -z "$KUBECTL_PROMPT_SEPARATOR" ]; and set -l KUBECTL_PROMPT_SEPARATOR "/"
  set -l config $KUBECONFIG
  [ -z "$config" ]; and set -l config "$HOME/.kube/config"
  if [ ! -f $config ]
    echo (set_color red)$KUBECTL_PROMPT_ICON" "(set_color white)"no config"
    return
  end

  set -l ctx (kubectl config current-context 2>/dev/null)
  if [ $status -ne 0 ]
    echo (set_color red)$KUBECTL_PROMPT_ICON" "(set_color white)"no context"
    return
  end

  set -l ns (kubectl config view -o "jsonpath={.contexts[?(@.name==\"$ctx\")].context.namespace}" 2>/dev/null)
  [ -z $ns ]; and set -l ns 'default'

  echo (set_color cyan)$KUBECTL_PROMPT_ICON" "(set_color red)"($ctx$KUBECTL_PROMPT_SEPARATOR$ns)"
end

function fish_prompt
  set -l ctx (kubectl config current-context 2>/dev/null)
  test ! (string match -r 'dev-*|colima|kind|orb' "$ctx"); and set -l ctx_warning "😱😱😱😱😱😱😱😱😱😱😱😱😱😱😱😱"
  test (string match -r 'dev-*' "$ctx"); and set -l ctx_warning "🤗🤗🤗🤗🤗🤗🤗🤗🤗🤗🤗🤗🤗🤗🤗🤗"
  set -l time (set_color yellow)(date "+(%H:%M:%S)")
  set -l dir (set_color blue)"["(prompt_pwd --full-length-dirs 3)"]"
  set -l git (set_color green)(git rev-parse --abbrev-ref HEAD 2>/dev/null; or echo "")
  set -l cursor (set_color red)"❯"(set_color yellow)"❯"(set_color green)"❯ "

  printf '%s %s %s %s %s\n' $dir (kubectl_status) $git $time $ctx_warning
  printf '%s' $cursor
end
