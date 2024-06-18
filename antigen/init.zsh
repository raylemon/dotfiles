#-- START ZCACHE GENERATED FILE
#-- GENERATED: mar 18 jun 2024 13:09:56 CEST
#-- ANTIGEN v2.2.2
_antigen () {
	local -a _1st_arguments
	_1st_arguments=('apply:Load all bundle completions' 'bundle:Install and load the given plugin' 'bundles:Bulk define bundles' 'cleanup:Clean up the clones of repos which are not used by any bundles currently loaded' 'cache-gen:Generate cache' 'init:Load Antigen configuration from file' 'list:List out the currently loaded bundles' 'purge:Remove a cloned bundle from filesystem' 'reset:Clears cache' 'restore:Restore the bundles state as specified in the snapshot' 'revert:Revert the state of all bundles to how they were before the last antigen update' 'selfupdate:Update antigen itself' 'snapshot:Create a snapshot of all the active clones' 'theme:Switch the prompt theme' 'update:Update all bundles' 'use:Load any (supported) zsh pre-packaged framework') 
	_1st_arguments+=('help:Show this message' 'version:Display Antigen version') 
	__bundle () {
		_arguments '--loc[Path to the location <path-to/location>]' '--url[Path to the repository <github-account/repository>]' '--branch[Git branch name]' '--no-local-clone[Do not create a clone]'
	}
	__list () {
		_arguments '--simple[Show only bundle name]' '--short[Show only bundle name and branch]' '--long[Show bundle records]'
	}
	__cleanup () {
		_arguments '--force[Do not ask for confirmation]'
	}
	_arguments '*:: :->command'
	if (( CURRENT == 1 ))
	then
		_describe -t commands "antigen command" _1st_arguments
		return
	fi
	local -a _command_args
	case "$words[1]" in
		(bundle) __bundle ;;
		(use) compadd "$@" "oh-my-zsh" "prezto" ;;
		(cleanup) __cleanup ;;
		(update|purge) compadd $(type -f \-antigen-get-bundles &> /dev/null || antigen &> /dev/null; -antigen-get-bundles --simple 2> /dev/null) ;;
		(theme) compadd $(type -f \-antigen-get-themes &> /dev/null || antigen &> /dev/null; -antigen-get-themes 2> /dev/null) ;;
		(list) __list ;;
	esac
}
antigen () {
  local MATCH MBEGIN MEND
  [[ "$ZSH_EVAL_CONTEXT" =~ "toplevel:*" || "$ZSH_EVAL_CONTEXT" =~ "cmdarg:*" ]] && source "/home/cedric/.antigen/antigen.zsh" && eval antigen $@;
  return 0;
}
typeset -gaU fpath path
fpath+=(/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/lib /home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/git /home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/dnf /home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/colorize /home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/colored-man-pages /home/cedric/.antigen/bundles/zsh-users/zsh-autosuggestions /home/cedric/.antigen/bundles/zsh-users/zsh-syntax-highlighting /home/cedric/.antigen/bundles/zsh-users/zsh-completions /home/cedric/.antigen/bundles/zdharma-continuum/fast-syntax-highlighting) path+=(/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/lib /home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/git /home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/dnf /home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/colorize /home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/colored-man-pages /home/cedric/.antigen/bundles/zsh-users/zsh-autosuggestions /home/cedric/.antigen/bundles/zsh-users/zsh-syntax-highlighting /home/cedric/.antigen/bundles/zsh-users/zsh-completions /home/cedric/.antigen/bundles/zdharma-continuum/fast-syntax-highlighting)
_antigen_compinit () {
  autoload -Uz compinit; compinit -d "/home/cedric/.antigen/.zcompdump"; compdef _antigen antigen
  add-zsh-hook -D precmd _antigen_compinit
}
autoload -Uz add-zsh-hook; add-zsh-hook precmd _antigen_compinit
compdef () {}

if [[ -n "/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh" ]]; then
  ZSH="/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh"; ZSH_CACHE_DIR="/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/cache/"
fi
#--- BUNDLES BEGIN
source '/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/lib/async_prompt.zsh';
source '/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/lib/bzr.zsh';
source '/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/lib/clipboard.zsh';
source '/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/lib/cli.zsh';
source '/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/lib/compfix.zsh';
source '/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/lib/completion.zsh';
source '/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/lib/correction.zsh';
source '/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/lib/diagnostics.zsh';
source '/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/lib/directories.zsh';
source '/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/lib/functions.zsh';
source '/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/lib/git.zsh';
source '/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/lib/grep.zsh';
source '/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/lib/history.zsh';
source '/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/lib/key-bindings.zsh';
source '/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/lib/misc.zsh';
source '/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/lib/nvm.zsh';
source '/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/lib/prompt_info_functions.zsh';
source '/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/lib/spectrum.zsh';
source '/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/lib/termsupport.zsh';
source '/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/lib/theme-and-appearance.zsh';
source '/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/lib/vcs_info.zsh';
source '/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/git/git.plugin.zsh';
source '/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/dnf/dnf.plugin.zsh';
source '/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/colorize/colorize.plugin.zsh';
source '/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/colored-man-pages/colored-man-pages.plugin.zsh';
source '/home/cedric/.antigen/bundles/zsh-users/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh';
source '/home/cedric/.antigen/bundles/zsh-users/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh';
source '/home/cedric/.antigen/bundles/zsh-users/zsh-completions/zsh-completions.plugin.zsh';
source '/home/cedric/.antigen/bundles/zdharma-continuum/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh';

#--- BUNDLES END
typeset -gaU _ANTIGEN_BUNDLE_RECORD; _ANTIGEN_BUNDLE_RECORD=('https://github.com/robbyrussell/oh-my-zsh.git lib plugin true' 'https://github.com/robbyrussell/oh-my-zsh.git plugins/git plugin true' 'https://github.com/robbyrussell/oh-my-zsh.git plugins/dnf plugin true' 'https://github.com/robbyrussell/oh-my-zsh.git plugins/colorize plugin true' 'https://github.com/robbyrussell/oh-my-zsh.git plugins/colored-man-pages plugin true' 'https://github.com/zsh-users/zsh-autosuggestions.git / plugin true' 'https://github.com/zsh-users/zsh-syntax-highlighting.git / plugin true' 'https://github.com/zsh-users/zsh-completions.git / plugin true' 'https://github.com/zdharma-continuum/fast-syntax-highlighting.git / plugin true')
typeset -g _ANTIGEN_CACHE_LOADED; _ANTIGEN_CACHE_LOADED=true
typeset -ga _ZCACHE_BUNDLE_SOURCE; _ZCACHE_BUNDLE_SOURCE=('/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/lib' '/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/lib/async_prompt.zsh' '/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/lib/bzr.zsh' '/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/lib/clipboard.zsh' '/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/lib/cli.zsh' '/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/lib/compfix.zsh' '/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/lib/completion.zsh' '/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/lib/correction.zsh' '/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/lib/diagnostics.zsh' '/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/lib/directories.zsh' '/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/lib/functions.zsh' '/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/lib/git.zsh' '/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/lib/grep.zsh' '/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/lib/history.zsh' '/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/lib/key-bindings.zsh' '/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/lib/misc.zsh' '/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/lib/nvm.zsh' '/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/lib/prompt_info_functions.zsh' '/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/lib/spectrum.zsh' '/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/lib/termsupport.zsh' '/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/lib/theme-and-appearance.zsh' '/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/lib/vcs_info.zsh' '/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/git' '/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/git/git.plugin.zsh' '/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/dnf' '/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/dnf/dnf.plugin.zsh' '/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/colorize' '/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/colorize/colorize.plugin.zsh' '/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/colored-man-pages' '/home/cedric/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/colored-man-pages/colored-man-pages.plugin.zsh' '/home/cedric/.antigen/bundles/zsh-users/zsh-autosuggestions//' '/home/cedric/.antigen/bundles/zsh-users/zsh-autosuggestions///zsh-autosuggestions.plugin.zsh' '/home/cedric/.antigen/bundles/zsh-users/zsh-syntax-highlighting//' '/home/cedric/.antigen/bundles/zsh-users/zsh-syntax-highlighting///zsh-syntax-highlighting.plugin.zsh' '/home/cedric/.antigen/bundles/zsh-users/zsh-completions//' '/home/cedric/.antigen/bundles/zsh-users/zsh-completions///zsh-completions.plugin.zsh' '/home/cedric/.antigen/bundles/zdharma-continuum/fast-syntax-highlighting//' '/home/cedric/.antigen/bundles/zdharma-continuum/fast-syntax-highlighting///fast-syntax-highlighting.plugin.zsh')
typeset -g _ANTIGEN_CACHE_VERSION; _ANTIGEN_CACHE_VERSION='v2.2.2'

#-- END ZCACHE GENERATED FILE
